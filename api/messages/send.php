<?php
require_once __DIR__ . '/../config/api_config.php';

// Only allow POST requests
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    sendError('Method not allowed', 405);
}

// Authenticate user
$user = authenticateUser();
$user_id = $user['id'];

// Rate limiting for sending messages
checkRateLimit($user_id . '_send_message', 100, 3600); // 100 messages per hour

// Get request data
$data = getRequestData();

// Validate required fields
validateRequiredFields($data, ['visitor_id', 'message']);

// Sanitize inputs
$visitor_id = sanitizeInput($data['visitor_id']);
$message = sanitizeInput($data['message']);
$widget_id = sanitizeInput($data['widget_id'] ?? '');

// Validation
if (strlen($message) > 5000) {
    sendError('Message too long. Maximum 5000 characters allowed.', 400);
}

if (strlen(trim($message)) === 0) {
    sendError('Message cannot be empty', 400);
}

logApiActivity('/api/messages/send', $user_id, 'send_message');

try {
    // Verify visitor belongs to user
    $visitor_stmt = $pdo->prepare("SELECT id, name, email FROM visitors WHERE id = ? AND user_id = ?");
    $visitor_stmt->execute([$visitor_id, $user_id]);
    $visitor = $visitor_stmt->fetch(PDO::FETCH_ASSOC);
    
    if (!$visitor) {
        sendError('Visitor not found or access denied', 404);
    }
    
    // Check subscription limits (if applicable)
    if ($user['subscription_status'] === 'active') {
        // Get subscription details
        $sub_stmt = $pdo->prepare("
            SELECT s.message_limit 
            FROM subscriptions s 
            INNER JOIN users u ON u.subscription_id = s.id 
            WHERE u.id = ?
        ");
        $sub_stmt->execute([$user_id]);
        $subscription = $sub_stmt->fetch(PDO::FETCH_ASSOC);
        
        if ($subscription) {
            // Check monthly message count
            $count_stmt = $pdo->prepare("
                SELECT COUNT(*) as message_count
                FROM messages 
                WHERE user_id = ? AND sender_type = 'agent' 
                AND MONTH(created_at) = MONTH(NOW()) 
                AND YEAR(created_at) = YEAR(NOW())
            ");
            $count_stmt->execute([$user_id]);
            $monthly_count = $count_stmt->fetch(PDO::FETCH_ASSOC)['message_count'];
            
            if ($monthly_count >= $subscription['message_limit']) {
                sendError('Monthly message limit reached. Please upgrade your subscription.', 403);
            }
        }
    }
    
    // Handle file upload if present
    $file_data = null;
    if (isset($_FILES['file']) && $_FILES['file']['error'] === UPLOAD_ERR_OK) {
        $file_data = handleFileUpload($_FILES['file'], $user_id);
    }
    
    // Insert message
    $insert_stmt = $pdo->prepare("
        INSERT INTO messages (
            user_id, visitor_id, widget_id, message, sender_type, 
            file_path, file_name, file_size, file_type, created_at
        ) VALUES (?, ?, ?, ?, 'agent', ?, ?, ?, ?, NOW())
    ");
    
    $insert_stmt->execute([
        $user_id,
        $visitor_id,
        $widget_id,
        $message,
        $file_data['path'] ?? null,
        $file_data['name'] ?? null,
        $file_data['size'] ?? null,
        $file_data['type'] ?? null
    ]);
    
    $message_id = $pdo->lastInsertId();
    
    // Get the complete message data
    $message_stmt = $pdo->prepare("
        SELECT m.*, v.name as visitor_name, v.email as visitor_email
        FROM messages m
        LEFT JOIN visitors v ON m.visitor_id = v.id
        WHERE m.id = ?
    ");
    $message_stmt->execute([$message_id]);
    $sent_message = $message_stmt->fetch(PDO::FETCH_ASSOC);
    
    // Format response data
    if ($sent_message['file_path']) {
        $sent_message['file_info'] = [
            'path' => $sent_message['file_path'],
            'name' => $sent_message['file_name'],
            'size' => $sent_message['file_size'],
            'type' => $sent_message['file_type'],
            'download_url' => 'https://agileproject.site/' . $sent_message['file_path']
        ];
    }
    
    $sent_message['created_at_formatted'] = date('M j, Y g:i A', strtotime($sent_message['created_at']));
    $sent_message['is_from_visitor'] = false;
    $sent_message['visitor_name'] = $sent_message['visitor_name'] ?: 'Anonymous';
    
    // Optional: Trigger real-time notification to visitor
    // This could be WebSocket, Server-Sent Events, or push notification
    // triggerVisitorNotification($visitor_id, $sent_message);
    
    // Optional: Send email notification to visitor if they provided email
    if ($visitor['email'] && filter_var($visitor['email'], FILTER_VALIDATE_EMAIL)) {
        // sendEmailNotification($visitor['email'], $message, $user['name']);
    }
    
    sendSuccess('Message sent successfully', [
        'message' => $sent_message,
        'visitor' => [
            'id' => $visitor['id'],
            'name' => $visitor['name'] ?: 'Anonymous',
            'email' => $visitor['email']
        ]
    ]);
    
} catch (PDOException $e) {
    error_log('Send message error: ' . $e->getMessage());
    sendError('Failed to send message', 500);
} catch (Exception $e) {
    error_log('Send message exception: ' . $e->getMessage());
    sendError('An error occurred while sending message', 500);
}

/**
 * Handle file upload
 */
function handleFileUpload($file, $user_id) {
    $allowed_types = ['image/jpeg', 'image/png', 'image/gif', 'application/pdf', 'text/plain'];
    $max_size = 5 * 1024 * 1024; // 5MB
    
    // Validate file type
    if (!in_array($file['type'], $allowed_types)) {
        sendError('File type not allowed. Allowed: JPG, PNG, GIF, PDF, TXT', 400);
    }
    
    // Validate file size
    if ($file['size'] > $max_size) {
        sendError('File too large. Maximum size: 5MB', 400);
    }
    
    // Create upload directory
    $upload_dir = __DIR__ . '/../../uploads/messages/';
    if (!is_dir($upload_dir)) {
        mkdir($upload_dir, 0755, true);
    }
    
    // Generate unique filename
    $extension = pathinfo($file['name'], PATHINFO_EXTENSION);
    $filename = uniqid() . '_' . time() . '.' . $extension;
    $file_path = $upload_dir . $filename;
    
    // Move uploaded file
    if (!move_uploaded_file($file['tmp_name'], $file_path)) {
        sendError('Failed to upload file', 500);
    }
    
    return [
        'path' => 'uploads/messages/' . $filename,
        'name' => $file['name'],
        'size' => formatFileSize($file['size']),
        'type' => $file['type']
    ];
}

/**
 * Format file size for display
 */
function formatFileSize($bytes) {
    $units = ['B', 'KB', 'MB', 'GB'];
    $bytes = max($bytes, 0);
    $pow = floor(($bytes ? log($bytes) : 0) / log(1024));
    $pow = min($pow, count($units) - 1);
    
    $bytes /= pow(1024, $pow);
    
    return round($bytes, 2) . ' ' . $units[$pow];
}

/**
 * Send email notification to visitor
 */
function sendEmailNotification($email, $message, $agent_name) {
    $subject = 'New message from ' . $agent_name;
    $email_body = "
        You have received a new message from {$agent_name}:
        
        {$message}
        
        Visit the website to continue the conversation.
    ";
    
    // Implement your email sending logic here
    // mail($email, $subject, $email_body);
}
?>