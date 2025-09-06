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
$page = max(1, intval($_GET['page'] ?? 1));
$limit = min(100, max(10, intval($_GET['limit'] ?? 20))); // Between 10-100 visitors
$status = $_GET['status'] ?? 'all'; // active, inactive, all
$search = $_GET['search'] ?? '';
$since = $_GET['since'] ?? null; // For real-time updates

$offset = ($page - 1) * $limit;

logApiActivity('/api/visitors/list', $user_id, 'get_visitors');

try {
    // Build query conditions
    $where_conditions = ["v.user_id = ?"];
    $params = [$user_id];
    
    // Filter by status
    if ($status === 'active') {
        $where_conditions[] = "v.last_active >= DATE_SUB(NOW(), INTERVAL 24 HOUR)";
    } elseif ($status === 'inactive') {
        $where_conditions[] = "v.last_active < DATE_SUB(NOW(), INTERVAL 24 HOUR)";
    }
    
    // Search filter
    if (!empty($search)) {
        $where_conditions[] = "(v.name LIKE ? OR v.email LIKE ? OR v.ip_address LIKE ? OR v.url LIKE ?)";
        $search_term = '%' . $search . '%';
        $params = array_merge($params, [$search_term, $search_term, $search_term, $search_term]);
    }
    
    // Since parameter for real-time updates
    if ($since) {
        $where_conditions[] = "(v.created_at > ? OR v.last_active > ?)";
        $params = array_merge($params, [$since, $since]);
    }
    
    $where_clause = implode(' AND ', $where_conditions);
    
    // Main query to get visitors with message statistics
    $visitors_query = "
        SELECT 
            v.*,
            COUNT(m.id) as total_messages,
            SUM(CASE WHEN m.sender_type = 'visitor' THEN 1 ELSE 0 END) as visitor_messages,
            SUM(CASE WHEN m.sender_type = 'agent' THEN 1 ELSE 0 END) as agent_messages,
            SUM(CASE WHEN m.sender_type = 'visitor' AND m.read = 0 THEN 1 ELSE 0 END) as unread_messages,
            MAX(m.created_at) as last_message_at,
            (SELECT m2.message FROM messages m2 WHERE m2.visitor_id = v.id ORDER BY m2.created_at DESC LIMIT 1) as last_message,
            (SELECT m2.sender_type FROM messages m2 WHERE m2.visitor_id = v.id ORDER BY m2.created_at DESC LIMIT 1) as last_message_sender,
            CASE 
                WHEN v.last_active >= DATE_SUB(NOW(), INTERVAL 5 MINUTE) THEN 'online'
                WHEN v.last_active >= DATE_SUB(NOW(), INTERVAL 24 HOUR) THEN 'recently_active'
                ELSE 'offline'
            END as activity_status
        FROM visitors v
        LEFT JOIN messages m ON v.id = m.visitor_id
        WHERE {$where_clause}
        GROUP BY v.id
        ORDER BY 
            CASE 
                WHEN unread_messages > 0 THEN 0 
                ELSE 1 
            END ASC,
            COALESCE(MAX(m.created_at), v.last_active) DESC
        LIMIT {$limit} OFFSET {$offset}
    ";
    
    $stmt = $pdo->prepare($visitors_query);
    $stmt->execute($params);
    $visitors = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
    // Get total count for pagination
    $count_query = "
        SELECT COUNT(DISTINCT v.id) as total
        FROM visitors v
        LEFT JOIN messages m ON v.id = m.visitor_id
        WHERE " . str_replace(['(v.created_at > ? OR v.last_active > ?)'], ['v.created_at <= NOW()'], $where_clause);
    
    $count_params = $params;
    if ($since) {
        // Remove the since parameters from count query
        array_pop($count_params);
        array_pop($count_params);
    }
    
    $count_stmt = $pdo->prepare($count_query);
    $count_stmt->execute($count_params);
    $total = $count_stmt->fetch(PDO::FETCH_ASSOC)['total'];
    
    // Process visitors for better display
    foreach ($visitors as &$visitor) {
        // Format timestamps
        $visitor['created_at_formatted'] = date('M j, Y g:i A', strtotime($visitor['created_at']));
        $visitor['last_active_formatted'] = date('M j, Y g:i A', strtotime($visitor['last_active']));
        
        if ($visitor['last_message_at']) {
            $visitor['last_message_at_formatted'] = date('M j, Y g:i A', strtotime($visitor['last_message_at']));
            $visitor['last_message_relative'] = timeAgo($visitor['last_message_at']);
        }
        
        // Format relative times
        $visitor['created_at_relative'] = timeAgo($visitor['created_at']);
        $visitor['last_active_relative'] = timeAgo($visitor['last_active']);
        
        // Clean up data
        $visitor['name'] = $visitor['name'] ?: 'Anonymous';
        $visitor['total_messages'] = (int)$visitor['total_messages'];
        $visitor['visitor_messages'] = (int)$visitor['visitor_messages'];
        $visitor['agent_messages'] = (int)$visitor['agent_messages'];
        $visitor['unread_messages'] = (int)$visitor['unread_messages'];
        $visitor['has_unread'] = $visitor['unread_messages'] > 0;
        
        // Truncate last message for preview
        if ($visitor['last_message']) {
            $visitor['last_message_preview'] = strlen($visitor['last_message']) > 100 
                ? substr($visitor['last_message'], 0, 97) . '...' 
                : $visitor['last_message'];
        }
        
        // Device and browser info
        if ($visitor['user_agent']) {
            $visitor['parsed_user_agent'] = parseUserAgent($visitor['user_agent']);
        }
        
        // Geographic info (if available)
        if ($visitor['ip_address'] && !$visitor['country']) {
            // You could integrate with a GeoIP service here
            $visitor['estimated_location'] = getLocationFromIP($visitor['ip_address']);
        }
    }
    
    // Get summary statistics
    $summary_query = "
        SELECT 
            COUNT(DISTINCT v.id) as total_visitors,
            COUNT(DISTINCT CASE WHEN v.last_active >= DATE_SUB(NOW(), INTERVAL 24 HOUR) THEN v.id END) as active_visitors,
            COUNT(DISTINCT CASE WHEN v.last_active >= DATE_SUB(NOW(), INTERVAL 5 MINUTE) THEN v.id END) as online_visitors,
            SUM(CASE WHEN m.sender_type = 'visitor' AND m.read = 0 THEN 1 ELSE 0 END) as total_unread
        FROM visitors v
        LEFT JOIN messages m ON v.id = m.visitor_id
        WHERE v.user_id = ?
    ";
    
    $summary_stmt = $pdo->prepare($summary_query);
    $summary_stmt->execute([$user_id]);
    $summary = $summary_stmt->fetch(PDO::FETCH_ASSOC);
    
    $response_data = [
        'visitors' => $visitors,
        'summary' => [
            'total_visitors' => (int)$summary['total_visitors'],
            'active_visitors' => (int)$summary['active_visitors'],
            'online_visitors' => (int)$summary['online_visitors'],
            'total_unread' => (int)$summary['total_unread']
        ],
        'pagination' => [
            'current_page' => $page,
            'total_visitors' => (int)$total,
            'total_pages' => ceil($total / $limit),
            'per_page' => $limit,
            'has_more' => $page < ceil($total / $limit)
        ],
        'filters' => [
            'status' => $status,
            'search' => $search
        ]
    ];
    
    sendSuccess('Visitors retrieved successfully', $response_data);
    
} catch (PDOException $e) {
    error_log('Get visitors error: ' . $e->getMessage());
    sendError('Failed to retrieve visitors', 500);
} catch (Exception $e) {
    error_log('Get visitors exception: ' . $e->getMessage());
    sendError('An error occurred while retrieving visitors', 500);
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

/**
 * Parse user agent string
 */
function parseUserAgent($user_agent) {
    $result = [
        'browser' => 'Unknown',
        'os' => 'Unknown',
        'device' => 'Desktop'
    ];
    
    // Simple browser detection
    if (strpos($user_agent, 'Chrome') !== false) {
        $result['browser'] = 'Chrome';
    } elseif (strpos($user_agent, 'Firefox') !== false) {
        $result['browser'] = 'Firefox';
    } elseif (strpos($user_agent, 'Safari') !== false) {
        $result['browser'] = 'Safari';
    } elseif (strpos($user_agent, 'Edge') !== false) {
        $result['browser'] = 'Edge';
    }
    
    // Simple OS detection
    if (strpos($user_agent, 'Windows') !== false) {
        $result['os'] = 'Windows';
    } elseif (strpos($user_agent, 'Mac') !== false) {
        $result['os'] = 'macOS';
    } elseif (strpos($user_agent, 'Linux') !== false) {
        $result['os'] = 'Linux';
    } elseif (strpos($user_agent, 'Android') !== false) {
        $result['os'] = 'Android';
        $result['device'] = 'Mobile';
    } elseif (strpos($user_agent, 'iPhone') !== false || strpos($user_agent, 'iPad') !== false) {
        $result['os'] = 'iOS';
        $result['device'] = 'Mobile';
    }
    
    return $result;
}

/**
 * Get estimated location from IP (placeholder - integrate with real service)
 */
function getLocationFromIP($ip_address) {
    // This is a placeholder - integrate with services like:
    // - MaxMind GeoIP2
    // - ipapi.co
    // - ipinfo.io
    
    return [
        'country' => null,
        'city' => null,
        'region' => null
    ];
}
?>