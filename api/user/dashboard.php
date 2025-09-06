<?php
require_once __DIR__ . '/../config/api_config.php';

// Only allow GET requests
if ($_SERVER['REQUEST_METHOD'] !== 'GET') {
    sendError('Method not allowed', 405);
}

// Authenticate user
$user = authenticateUser();
$user_id = $user['id'];

logApiActivity('/api/user/dashboard', $user_id, 'dashboard_access');

try {
    // Get comprehensive dashboard data
    $dashboard_data = [];
    
    // 1. User Profile Information
    $dashboard_data['profile'] = [
        'id' => $user['id'],
        'name' => $user['name'],
        'email' => $user['email'],
        'subscription_status' => $user['subscription_status'],
        'subscription_expiry' => $user['subscription_expiry']
    ];
    
    // 2. Subscription Details
    if ($user['subscription_status'] === 'active') {
        $sub_stmt = $pdo->prepare("
            SELECT s.*, p.amount, p.created_at as payment_date
            FROM subscriptions s
            INNER JOIN users u ON u.subscription_id = s.id
            LEFT JOIN payments p ON p.user_id = u.id AND p.status = 'completed'
            WHERE u.id = ?
            ORDER BY p.created_at DESC
            LIMIT 1
        ");
        $sub_stmt->execute([$user_id]);
        $subscription = $sub_stmt->fetch(PDO::FETCH_ASSOC);
        
        if ($subscription) {
            $dashboard_data['subscription'] = [
                'name' => $subscription['name'],
                'price' => $subscription['price'],
                'message_limit' => $subscription['message_limit'],
                'visitor_limit' => $subscription['visitor_limit'],
                'allow_file_upload' => (bool)$subscription['allow_file_upload'],
                'features' => $subscription['features'],
                'payment_amount' => $subscription['amount'],
                'payment_date' => $subscription['payment_date'],
                'expires_at' => $user['subscription_expiry']
            ];
        }
    }
    
    // 3. Statistics (Today, This Week, This Month, All Time)
    $stats_query = "
        SELECT 
            -- Today's stats
            (SELECT COUNT(*) FROM messages WHERE user_id = ? AND DATE(created_at) = CURDATE()) as messages_today,
            (SELECT COUNT(*) FROM visitors WHERE user_id = ? AND DATE(created_at) = CURDATE()) as visitors_today,
            
            -- This week's stats
            (SELECT COUNT(*) FROM messages WHERE user_id = ? AND created_at >= DATE_SUB(NOW(), INTERVAL 7 DAY)) as messages_week,
            (SELECT COUNT(*) FROM visitors WHERE user_id = ? AND created_at >= DATE_SUB(NOW(), INTERVAL 7 DAY)) as visitors_week,
            
            -- This month's stats
            (SELECT COUNT(*) FROM messages WHERE user_id = ? AND MONTH(created_at) = MONTH(NOW()) AND YEAR(created_at) = YEAR(NOW())) as messages_month,
            (SELECT COUNT(*) FROM visitors WHERE user_id = ? AND MONTH(created_at) = MONTH(NOW()) AND YEAR(created_at) = YEAR(NOW())) as visitors_month,
            
            -- All time stats
            (SELECT COUNT(*) FROM messages WHERE user_id = ?) as total_messages,
            (SELECT COUNT(*) FROM visitors WHERE user_id = ?) as total_visitors,
            (SELECT COUNT(DISTINCT visitor_id) FROM messages WHERE user_id = ?) as total_conversations,
            
            -- Unread messages
            (SELECT COUNT(*) FROM messages WHERE user_id = ? AND sender_type = 'visitor' AND read = 0) as unread_messages
    ";
    
    $stats_stmt = $pdo->prepare($stats_query);
    $stats_stmt->execute(array_fill(0, 10, $user_id));
    $stats = $stats_stmt->fetch(PDO::FETCH_ASSOC);
    
    $dashboard_data['stats'] = $stats;
    
    // 4. Recent Messages (Last 10)
    $messages_stmt = $pdo->prepare("
        SELECT m.*, v.name as visitor_name, v.email as visitor_email
        FROM messages m
        LEFT JOIN visitors v ON m.visitor_id = v.id
        WHERE m.user_id = ?
        ORDER BY m.created_at DESC
        LIMIT 10
    ");
    $messages_stmt->execute([$user_id]);
    $recent_messages = $messages_stmt->fetchAll(PDO::FETCH_ASSOC);
    
    $dashboard_data['recent_messages'] = $recent_messages;
    
    // 5. Active Visitors (Last 24 hours)
    $visitors_stmt = $pdo->prepare("
        SELECT v.*, 
               (SELECT COUNT(*) FROM messages WHERE visitor_id = v.id) as message_count,
               (SELECT MAX(created_at) FROM messages WHERE visitor_id = v.id) as last_message_at
        FROM visitors v
        WHERE v.user_id = ? AND v.last_active >= DATE_SUB(NOW(), INTERVAL 24 HOUR)
        ORDER BY v.last_active DESC
        LIMIT 20
    ");
    $visitors_stmt->execute([$user_id]);
    $active_visitors = $visitors_stmt->fetchAll(PDO::FETCH_ASSOC);
    
    $dashboard_data['active_visitors'] = $active_visitors;
    
    // 6. Widget Settings
    $widget_stmt = $pdo->prepare("
        SELECT * FROM widget_settings WHERE user_id = ?
    ");
    $widget_stmt->execute([$user_id]);
    $widget_settings = $widget_stmt->fetch(PDO::FETCH_ASSOC);
    
    $dashboard_data['widget_settings'] = $widget_settings;
    
    // 7. Recent Payments (Last 5)
    $payments_stmt = $pdo->prepare("
        SELECT p.*, s.name as subscription_name
        FROM payments p
        LEFT JOIN subscriptions s ON p.subscription_id = s.id
        WHERE p.user_id = ?
        ORDER BY p.created_at DESC
        LIMIT 5
    ");
    $payments_stmt->execute([$user_id]);
    $recent_payments = $payments_stmt->fetchAll(PDO::FETCH_ASSOC);
    
    $dashboard_data['recent_payments'] = $recent_payments;
    
    // 8. Monthly Message Chart Data (Last 12 months)
    $chart_query = "
        SELECT 
            DATE_FORMAT(created_at, '%Y-%m') as month,
            COUNT(*) as message_count
        FROM messages 
        WHERE user_id = ? AND created_at >= DATE_SUB(NOW(), INTERVAL 12 MONTH)
        GROUP BY DATE_FORMAT(created_at, '%Y-%m')
        ORDER BY month ASC
    ";
    $chart_stmt = $pdo->prepare($chart_query);
    $chart_stmt->execute([$user_id]);
    $chart_data = $chart_stmt->fetchAll(PDO::FETCH_ASSOC);
    
    $dashboard_data['chart_data'] = $chart_data;
    
    // 9. Top Visitor Countries (if available)
    $countries_stmt = $pdo->prepare("
        SELECT country, COUNT(*) as visitor_count
        FROM visitors 
        WHERE user_id = ? AND country IS NOT NULL
        GROUP BY country
        ORDER BY visitor_count DESC
        LIMIT 10
    ");
    $countries_stmt->execute([$user_id]);
    $top_countries = $countries_stmt->fetchAll(PDO::FETCH_ASSOC);
    
    $dashboard_data['top_countries'] = $top_countries;
    
    // 10. System Alerts/Notifications
    $alerts = [];
    
    // Check subscription expiry
    if ($user['subscription_status'] === 'active' && $user['subscription_expiry']) {
        $days_until_expiry = (strtotime($user['subscription_expiry']) - time()) / (60 * 60 * 24);
        
        if ($days_until_expiry <= 7) {
            $alerts[] = [
                'type' => 'warning',
                'message' => 'Your subscription expires in ' . ceil($days_until_expiry) . ' days',
                'action' => 'renew_subscription'
            ];
        }
    } else if ($user['subscription_status'] !== 'active') {
        $alerts[] = [
            'type' => 'info',
            'message' => 'Upgrade to a paid plan to unlock all features',
            'action' => 'view_subscriptions'
        ];
    }
    
    // Check for high message volume
    if ($stats['messages_today'] > 50) {
        $alerts[] = [
            'type' => 'success',
            'message' => 'High activity today - ' . $stats['messages_today'] . ' messages!',
            'action' => null
        ];
    }
    
    $dashboard_data['alerts'] = $alerts;
    
    sendSuccess('Dashboard data retrieved successfully', $dashboard_data);
    
} catch (PDOException $e) {
    error_log('Dashboard error: ' . $e->getMessage());
    sendError('Failed to load dashboard data', 500);
} catch (Exception $e) {
    error_log('Dashboard exception: ' . $e->getMessage());
    sendError('An error occurred while loading dashboard', 500);
}
?>