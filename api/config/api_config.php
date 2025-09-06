<?php
// Enable error reporting for development (disable in production)
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Include necessary files
require_once __DIR__ . '/../../includes/config.php';
require_once __DIR__ . '/../../includes/db.php';
require_once __DIR__ . '/jwt_helper.php';

// Set JSON content type
header('Content-Type: application/json');

// Enable CORS for Flutter app
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With');

// Handle preflight OPTIONS request
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit();
}

/**
 * Standard API response format
 */
function sendResponse($success = true, $message = '', $data = null, $status_code = 200) {
    http_response_code($status_code);
    
    $response = [
        'success' => $success,
        'message' => $message,
        'timestamp' => date('Y-m-d H:i:s')
    ];
    
    if ($data !== null) {
        $response['data'] = $data;
    }
    
    echo json_encode($response, JSON_PRETTY_PRINT);
    exit();
}

/**
 * Send error response
 */
function sendError($message, $status_code = 400) {
    sendResponse(false, $message, null, $status_code);
}

/**
 * Send success response
 */
function sendSuccess($message, $data = null) {
    sendResponse(true, $message, $data, 200);
}

/**
 * Validate required fields in request
 */
function validateRequiredFields($data, $required_fields) {
    $missing_fields = [];
    
    foreach ($required_fields as $field) {
        if (!isset($data[$field]) || empty(trim($data[$field]))) {
            $missing_fields[] = $field;
        }
    }
    
    if (!empty($missing_fields)) {
        sendError('Missing required fields: ' . implode(', ', $missing_fields), 400);
    }
    
    return true;
}

/**
 * Sanitize input data
 */
function sanitizeInput($data) {
    if (is_array($data)) {
        return array_map('sanitizeInput', $data);
    }
    
    return htmlspecialchars(strip_tags(trim($data)), ENT_QUOTES, 'UTF-8');
}

/**
 * Get request data (handles both JSON and form data)
 */
function getRequestData() {
    $content_type = $_SERVER['CONTENT_TYPE'] ?? '';
    
    if (strpos($content_type, 'application/json') !== false) {
        $json = file_get_contents('php://input');
        $data = json_decode($json, true);
        
        if (json_last_error() !== JSON_ERROR_NONE) {
            sendError('Invalid JSON data', 400);
        }
        
        return $data ?: [];
    }
    
    return $_POST;
}

/**
 * Authenticate user and return user data
 */
function authenticateUser() {
    $token_data = JWTHelper::validateToken();
    
    if (!$token_data) {
        sendError('Invalid or expired token', 401);
    }
    
    // Get user details from database
    global $pdo;
    
    try {
        $stmt = $pdo->prepare("SELECT id, name, email, subscription_status, subscription_expiry FROM users WHERE id = ? AND email = ?");
        $stmt->execute([$token_data['user_id'], $token_data['email']]);
        
        $user = $stmt->fetch(PDO::FETCH_ASSOC);
        
        if (!$user) {
            sendError('User not found', 401);
        }
        
        return $user;
    } catch (PDOException $e) {
        error_log('Auth error: ' . $e->getMessage());
        sendError('Authentication error', 500);
    }
}

/**
 * Check if user has active subscription
 */
function checkSubscription($user) {
    if ($user['subscription_status'] !== 'active' || 
        ($user['subscription_expiry'] && $user['subscription_expiry'] < date('Y-m-d'))) {
        sendError('Active subscription required', 403);
    }
    
    return true;
}

/**
 * Rate limiting (simple implementation)
 */
function checkRateLimit($identifier, $max_requests = 100, $time_window = 3600) {
    $cache_file = sys_get_temp_dir() . '/rate_limit_' . md5($identifier);
    
    $current_time = time();
    $requests = [];
    
    if (file_exists($cache_file)) {
        $requests = json_decode(file_get_contents($cache_file), true) ?: [];
    }
    
    // Remove old requests outside time window
    $requests = array_filter($requests, function($timestamp) use ($current_time, $time_window) {
        return ($current_time - $timestamp) < $time_window;
    });
    
    if (count($requests) >= $max_requests) {
        sendError('Rate limit exceeded. Please try again later.', 429);
    }
    
    // Add current request
    $requests[] = $current_time;
    file_put_contents($cache_file, json_encode($requests));
    
    return true;
}

/**
 * Log API activity
 */
function logApiActivity($endpoint, $user_id = null, $action = 'access') {
    global $pdo;
    
    try {
        $stmt = $pdo->prepare("
            INSERT INTO api_logs (endpoint, user_id, action, ip_address, user_agent, created_at) 
            VALUES (?, ?, ?, ?, ?, NOW())
        ");
        
        $stmt->execute([
            $endpoint,
            $user_id,
            $action,
            $_SERVER['REMOTE_ADDR'] ?? 'unknown',
            $_SERVER['HTTP_USER_AGENT'] ?? 'unknown'
        ]);
    } catch (PDOException $e) {
        // Log error but don't fail the request
        error_log('Failed to log API activity: ' . $e->getMessage());
    }
}

// Create api_logs table if it doesn't exist
try {
    $pdo->exec("
        CREATE TABLE IF NOT EXISTS api_logs (
            id INT AUTO_INCREMENT PRIMARY KEY,
            endpoint VARCHAR(255) NOT NULL,
            user_id INT NULL,
            action VARCHAR(100) NOT NULL,
            ip_address VARCHAR(45) NOT NULL,
            user_agent TEXT,
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            INDEX idx_endpoint (endpoint),
            INDEX idx_user_id (user_id),
            INDEX idx_created_at (created_at)
        )
    ");
} catch (PDOException $e) {
    error_log('Failed to create api_logs table: ' . $e->getMessage());
}
?>