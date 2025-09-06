<?php
require_once __DIR__ . '/../config/api_config.php';

// Only allow GET requests
if ($_SERVER['REQUEST_METHOD'] !== 'GET') {
    sendError('Method not allowed', 405);
}

// Authenticate user
$user = authenticateUser();
$user_id = $user['id'];

// Get query parameters
$visitor_id = $_GET['visitor_id'] ?? null;
$page = max(1, intval($_GET['page'] ?? 1));
$limit = min(100, max(10, intval($_GET['limit'] ?? 20))); // Between 10-100 messages
$since = $_GET['since'] ?? null; // For real-time updates

$offset = ($page - 1) * $limit;

logApiActivity('/api/messages/get', $user_id, 'get_messages');

try {
    // Build query based on parameters
    $where_conditions = ["m.user_id = ?"];
    $params = [$user_id];
    
    if ($visitor_id) {
        $where_conditions[] = "m.visitor_id = ?";
        $params[] = $visitor_id;
    }
    
    if ($since) {
        $where_conditions[] = "m.created_at > ?";
        $params[] = $since;
    }
    
    $where_clause = implode(' AND ', $where_conditions);
    
    // Get messages with visitor information
    $messages_query = "
        SELECT 
            m.*,
            v.name as visitor_name,
            v.email as visitor_email,
            v.url as visitor_url,
            v.ip_address as visitor_ip,
            v.country as visitor_country,
            v.browser as visitor_browser,
            v.device_type as visitor_device
        FROM messages m
        LEFT JOIN visitors v ON m.visitor_id = v.id
        WHERE {$where_clause}
        ORDER BY m.created_at DESC
        LIMIT {$limit} OFFSET {$offset}
    ";
    
    $stmt = $pdo->prepare($messages_query);
    $stmt->execute($params);
    $messages = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
    // Get total count for pagination
    $count_query = "
        SELECT COUNT(*) as total
        FROM messages m
        WHERE " . str_replace('m.created_at > ?', 'm.created_at <= NOW()', $where_clause);
    
    $count_params = array_filter($params, function($param) use ($since) {
        return $param !== $since;
    });
    
    $count_stmt = $pdo->prepare($count_query);
    $count_stmt->execute($count_params);
    $total = $count_stmt->fetch(PDO::FETCH_ASSOC)['total'];
    
    // Process messages for better mobile display
    foreach ($messages as &$message) {
        // Format file information if exists
        if ($message['file_path']) {
            $message['file_info'] = [
                'path' => $message['file_path'],
                'name' => $message['file_name'],
                'size' => $message['file_size'],
                'type' => $message['file_type'],
                'download_url' => 'https://agileproject.site/' . $message['file_path']
            ];
        }
        
        // Format timestamps
        $message['created_at_formatted'] = date('M j, Y g:i A', strtotime($message['created_at']));
        $message['created_at_relative'] = timeAgo($message['created_at']);
        
        // Clean up null values
        $message['visitor_name'] = $message['visitor_name'] ?: 'Anonymous';
        
        // Add message status
        $message['is_read'] = (bool)$message['read'];
        $message['is_from_visitor'] = $message['sender_type'] === 'visitor';
    }
    
    // Mark visitor messages as read if viewing specific conversation
    if ($visitor_id && !empty($messages)) {
        $mark_read_stmt = $pdo->prepare("
            UPDATE messages 
            SET `read` = 1 
            WHERE user_id = ? AND visitor_id = ? AND sender_type = 'visitor' AND `read` = 0
        ");
        $mark_read_stmt->execute([$user_id, $visitor_id]);
    }
    
    // Get conversation summary if specific visitor
    $conversation_summary = null;
    if ($visitor_id) {
        $summary_stmt = $pdo->prepare("
            SELECT 
                v.*,
                COUNT(m.id) as total_messages,
                MAX(m.created_at) as last_message_at,
                SUM(CASE WHEN m.sender_type = 'visitor' AND m.read = 0 THEN 1 ELSE 0 END) as unread_count
            FROM visitors v
            LEFT JOIN messages m ON v.id = m.visitor_id
            WHERE v.id = ? AND v.user_id = ?
            GROUP BY v.id
        ");
        $summary_stmt->execute([$visitor_id, $user_id]);
        $conversation_summary = $summary_stmt->fetch(PDO::FETCH_ASSOC);
        
        if ($conversation_summary) {
            $conversation_summary['last_message_at_formatted'] = 
                $conversation_summary['last_message_at'] ? 
                date('M j, Y g:i A', strtotime($conversation_summary['last_message_at'])) : 
                null;
        }
    }
    
    $response_data = [
        'messages' => $messages,
        'pagination' => [
            'current_page' => $page,
            'total_messages' => (int)$total,
            'total_pages' => ceil($total / $limit),
            'per_page' => $limit,
            'has_more' => $page < ceil($total / $limit)
        ]
    ];
    
    if ($conversation_summary) {
        $response_data['conversation_summary'] = $conversation_summary;
    }
    
    sendSuccess('Messages retrieved successfully', $response_data);
    
} catch (PDOException $e) {
    error_log('Get messages error: ' . $e->getMessage());
    sendError('Failed to retrieve messages', 500);
} catch (Exception $e) {
    error_log('Get messages exception: ' . $e->getMessage());
    sendError('An error occurred while retrieving messages', 500);
}

/**
 * Convert timestamp to relative time
 */
function timeAgo($datetime) {
    $time = time() - strtotime($datetime);
    
    if ($time < 60) return 'Just now';
    if ($time < 3600) return floor($time/60) . ' min ago';
    if ($time < 86400) return floor($time/3600) . ' hr ago';
    if ($time < 2592000) return floor($time/86400) . ' days ago';
    if ($time < 31536000) return floor($time/2592000) . ' mon ago';
    return floor($time/31536000) . ' yr ago';
}
?>