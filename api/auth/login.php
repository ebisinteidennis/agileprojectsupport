<?php
require_once __DIR__ . '/../config/api_config.php';

// Only allow POST requests
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    sendError('Method not allowed', 405);
}

// Rate limiting
checkRateLimit($_SERVER['REMOTE_ADDR'] . '_login', 10, 900); // 10 attempts per 15 minutes

// Get request data
$data = getRequestData();

// Validate required fields
validateRequiredFields($data, ['email', 'password']);

// Sanitize inputs
$email = filter_var(sanitizeInput($data['email']), FILTER_VALIDATE_EMAIL);
$password = sanitizeInput($data['password']);

if (!$email) {
    sendError('Invalid email format', 400);
}

if (strlen($password) < 6) {
    sendError('Password must be at least 6 characters', 400);
}

try {
    // Check user credentials
    $stmt = $pdo->prepare("
        SELECT id, name, email, password, subscription_status, subscription_expiry, 
               widget_id, api_key, created_at, last_activity
        FROM users 
        WHERE email = ?
    ");
    
    $stmt->execute([$email]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);
    
    if (!$user || !password_verify($password, $user['password'])) {
        logApiActivity('/api/auth/login', null, 'failed_login');
        sendError('Invalid email or password', 401);
    }
    
    // Update last activity
    $update_stmt = $pdo->prepare("UPDATE users SET last_activity = NOW() WHERE id = ?");
    $update_stmt->execute([$user['id']]);
    
    // Generate JWT token
    $token = JWTHelper::generateToken($user['id'], $user['email'], 24);
    
    // Prepare user data (exclude sensitive information)
    $user_data = [
        'id' => $user['id'],
        'name' => $user['name'],
        'email' => $user['email'],
        'subscription_status' => $user['subscription_status'],
        'subscription_expiry' => $user['subscription_expiry'],
        'widget_id' => $user['widget_id'],
        'created_at' => $user['created_at'],
        'last_activity' => $user['last_activity']
    ];
    
    // Get subscription details if active
    if ($user['subscription_status'] === 'active') {
        $sub_stmt = $pdo->prepare("
            SELECT s.name as subscription_name, s.message_limit, s.visitor_limit, 
                   s.allow_file_upload, s.features
            FROM subscriptions s
            INNER JOIN users u ON u.subscription_id = s.id
            WHERE u.id = ?
        ");
        $sub_stmt->execute([$user['id']]);
        $subscription = $sub_stmt->fetch(PDO::FETCH_ASSOC);
        
        if ($subscription) {
            $user_data['subscription'] = $subscription;
        }
    }
    
    // Get widget settings
    $widget_stmt = $pdo->prepare("
        SELECT theme_color, text_color, position, welcome_message, 
               offline_message, display_name, logo_url
        FROM widget_settings 
        WHERE user_id = ?
    ");
    $widget_stmt->execute([$user['id']]);
    $widget_settings = $widget_stmt->fetch(PDO::FETCH_ASSOC);
    
    if ($widget_settings) {
        $user_data['widget_settings'] = $widget_settings;
    }
    
    // Get recent activity stats
    $stats_query = "
        SELECT 
            (SELECT COUNT(*) FROM messages WHERE user_id = ? AND created_at >= DATE_SUB(NOW(), INTERVAL 24 HOUR)) as messages_today,
            (SELECT COUNT(*) FROM visitors WHERE user_id = ? AND created_at >= DATE_SUB(NOW(), INTERVAL 24 HOUR)) as visitors_today,
            (SELECT COUNT(DISTINCT visitor_id) FROM messages WHERE user_id = ?) as total_conversations
    ";
    
    $stats_stmt = $pdo->prepare($stats_query);
    $stats_stmt->execute([$user['id'], $user['id'], $user['id']]);
    $stats = $stats_stmt->fetch(PDO::FETCH_ASSOC);
    
    $user_data['stats'] = $stats;
    
    logApiActivity('/api/auth/login', $user['id'], 'successful_login');
    
    sendSuccess('Login successful', [
        'token' => $token,
        'user' => $user_data
    ]);
    
} catch (PDOException $e) {
    error_log('Login error: ' . $e->getMessage());
    sendError('Database error occurred', 500);
} catch (Exception $e) {
    error_log('Login exception: ' . $e->getMessage());
    sendError('An error occurred during login', 500);
}
?>