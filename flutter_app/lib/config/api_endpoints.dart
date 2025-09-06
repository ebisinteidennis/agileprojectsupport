class ApiEndpoints {
  // Base
  static const String _baseUrl = '/api';
  
  // Authentication
  static const String login = '$_baseUrl/auth/login.php';
  static const String register = '$_baseUrl/auth/register.php';
  static const String logout = '$_baseUrl/auth/logout.php';
  static const String refreshToken = '$_baseUrl/auth/refresh.php';
  static const String forgotPassword = '$_baseUrl/auth/forgot_password.php';
  static const String resetPassword = '$_baseUrl/auth/reset_password.php';
  
  // User
  static const String userProfile = '$_baseUrl/user/profile.php';
  static const String userDashboard = '$_baseUrl/user/dashboard.php';
  static const String updateProfile = '$_baseUrl/user/update.php';
  static const String changePassword = '$_baseUrl/user/change_password.php';
  static const String uploadAvatar = '$_baseUrl/user/upload_avatar.php';
  
  // Messages
  static const String getMessages = '$_baseUrl/messages/get.php';
  static const String sendMessage = '$_baseUrl/messages/send.php';
  static const String markMessageRead = '$_baseUrl/messages/mark_read.php';
  static const String deleteMessage = '$_baseUrl/messages/delete.php';
  static const String getConversations = '$_baseUrl/messages/conversations.php';
  
  // Visitors
  static const String getVisitors = '$_baseUrl/visitors/list.php';
  static const String trackVisitor = '$_baseUrl/visitors/track.php';
  static const String getVisitorStats = '$_baseUrl/visitors/stats.php';
  static const String exportVisitors = '$_baseUrl/visitors/export.php';
  
  // Projects
  static const String getProjects = '$_baseUrl/projects/list.php';
  static const String createProject = '$_baseUrl/projects/create.php';
  static const String updateProject = '$_baseUrl/projects/update.php';
  static const String deleteProject = '$_baseUrl/projects/delete.php';
  static const String getProjectDetails = '$_baseUrl/projects/details.php';
  
  // Tasks
  static const String getTasks = '$_baseUrl/tasks/list.php';
  static const String createTask = '$_baseUrl/tasks/create.php';
  static const String updateTask = '$_baseUrl/tasks/update.php';
  static const String deleteTask = '$_baseUrl/tasks/delete.php';
  static const String markTaskComplete = '$_baseUrl/tasks/complete.php';
  
  // Notifications
  static const String getNotifications = '$_baseUrl/notifications/list.php';
  static const String markNotificationRead = '$_baseUrl/notifications/mark_read.php';
  static const String deleteNotification = '$_baseUrl/notifications/delete.php';
  
  // Files
  static const String uploadFile = '$_baseUrl/files/upload.php';
  static const String downloadFile = '$_baseUrl/files/download.php';
  static const String deleteFile = '$_baseUrl/files/delete.php';
  
  // Settings
  static const String getSettings = '$_baseUrl/settings/get.php';
  static const String updateSettings = '$_baseUrl/settings/update.php';
  
  // WebSocket
  static const String wsEndpoint = 'wss://yourdomain.com/websocket';
}

class ApiStatusCodes {
  static const int success = 200;
  static const int created = 201;
  static const int badRequest = 400;
  static const int unauthorized = 401;
  static const int forbidden = 403;
  static const int notFound = 404;
  static const int tooManyRequests = 429;
  static const int internalServerError = 500;
  static const int serviceUnavailable = 503;
}