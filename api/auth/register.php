<?php
require_once __DIR__ . '/../config/api_config.php';

// Only allow POST requests
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    sendError('Method not allowed', 405);
}

// Rate limiting for registration
checkRateLimit($_SERVER['REMOTE_ADDR'] . '_register', 5, 3600); // 5 attempts per hour

// Get request data
$data = getRequestData();

// Validate required fields
validateRequiredFields($data, ['name', 'email', 'password']);

// Sanitize inputs
$name = sanitizeInput($data['name']);
$email = filter_var(sanitizeInput($data['email']), FILTER_VALIDATE_EMAIL);
$password = sanitizeInput($data['password']);

// Validation
if (!$email) {
    sendError('Invalid email format', 400);
}

if (strlen($password) < 6) {
    sendError('Password must be at least 6 characters', 400);
}

if (strlen($name) < 2) {
    sendError('Name must be at least 2 characters', 400);
}

if (strlen($name) > 100) {
    sendError('Name must not exceed 100 characters', 400);
}

// Additional password validation
if (!preg_match('/^(?=.*[a-zA-Z])(?=.*\d)/', $password)) {
    sendError('Password must contain at least one letter and one number', 400);
}

try {
    // Check if email already exists
    $stmt = $pdo->prepare("SELECT id FROM users WHERE email = ?");
    $stmt->execute([$email]);
    
    if ($stmt->fetch()) {
        logApiActivity('/api/auth/register', null, 'duplicate_email');
        sendError('Email already registered', 409);
    }
    
    // Hash password
    $hashed_password = password_hash($password, PASSWORD_DEFAULT);
    
    // Generate unique identifiers
    $api_key = hash('sha256', $email . time() . random_bytes(16));
    $widget_id = md5($email . time() . random_bytes(16));
    
    // Start transaction
    $pdo->beginTransaction();
    
    // Insert user
    $insert_stmt = $pdo->prepare("
        INSERT INTO users (
            name, email, password, api_key, widget_id, 
            subscription_status, created_at, updated_at
        ) VALUES (?, ?, ?, ?, ?, 'inactive', NOW(), NOW())
    ");
    
    $insert_stmt->execute([$name, $email, $hashed_password, $api_key, $widget_id]);
    
    $user_id = $pdo->lastInsertId();
    
    // Create default widget settings
    $widget_stmt = $pdo->prepare("
        INSERT INTO widget_settings (
            user_id, widget_id, theme_color, text_color, position,
            welcome_message, offline_message, display_name,
            mobile_enabled, show_branding, auto_popup, auto_popup_delay
        ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    ");
    
    $widget_stmt->execute([
        $user_id,
        $widget_id,
        '#3498db',
        '#ffffff',
        'bottom_right',
        'Hello! How can we help you today?',
        'Sorry, we\'re currently offline. Please leave a message and we\'ll get back to you soon.',
        $name,
        1, // mobile_enabled
        1, // show_branding
        0, // auto_popup
        10 // auto_popup_delay
    ]);
    
    // Commit transaction
    $pdo->commit();
    
    // Generate JWT token for immediate login
    $token = JWTHelper::generateToken($user_id, $email, 24);
    
    // Prepare user data
    $user_data = [
        'id' => $user_id,
        'name' => $name,
        'email' => $email,
        'subscription_status' => 'inactive',
        'subscription_expiry' => null,
        'widget_id' => $widget_id,
        'created_at' => date('Y-m-d H:i:s'),
        'widget_settings' => [
            'theme_color' => '#3498db',
            'text_color' => '#ffffff',
            'position' => 'bottom_right',
            'welcome_message' => 'Hello! How can we help you today?',
            'offline_message' => 'Sorry, we\'re currently offline. Please leave a message and we\'ll get back to you soon.',
            'display_name' => $name,
        ],
        'stats' => [
            'messages_today' => 0,
            'visitors_today' => 0,
            'total_conversations' => 0
        ]
    ];
    
    logApiActivity('/api/auth/register', $user_id, 'successful_registration');
    
    // Optional: Send welcome email (implement based on your email system)
    // sendWelcomeEmail($email, $name);
    
    sendSuccess('Registration successful', [
        'token' => $token,
        'user' => $user_data
    ]);
    
} catch (PDOException $e) {
    // Rollback transaction on error
    if ($pdo->inTransaction()) {
        $pdo->rollback();
    }
    
    error_log('Registration error: ' . $e->getMessage());
    
    // Check for duplicate key error
    if ($e->getCode() == '23000') {
        sendError('Email already registered', 409);
    }
    
    sendError('Registration failed. Please try again.', 500);
} catch (Exception $e) {
    // Rollback transaction on error
    if ($pdo->inTransaction()) {
        $pdo->rollback();
    }
    
    error_log('Registration exception: ' . $e->getMessage());
    sendError('An error occurred during registration', 500);
}

/**
 * Send welcome email (implement based on your email system)
 */
function sendWelcomeEmail($email, $name) {
    // Implement your email sending logic here
    // This could integrate with your existing email system
    
    $subject = 'Welcome to Agile Project Live Support';
    $message = "
        Hi {$name},
        
        Welcome to Agile Project Live Support! Your account has been successfully created.
        
        You can now start using our live chat system to engage with your website visitors.
        
        Best regards,
        The Agile Project Team
    ";
    
    // Use your existing email configuration
    // mail($email, $subject, $message);
}
?>