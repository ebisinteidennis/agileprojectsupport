class AppConfig {
  // API Configuration
  static const String apiUrl = 'https://agileproject.site/api/';
  static const String websiteUrl = 'https://agileproject.site/';
  static const int apiTimeout = 30;
  static const int maxRetries = 3;
  
  // App Configuration
  static const String appName = 'Agile Project Manager';
  static const String appVersion = '1.0.0';
  static const bool enableLogging = true;
  static const bool enablePushNotifications = true;
  
  // Storage Keys
  static const String tokenKey = 'auth_token';
  static const String userKey = 'user_data';
  static const String refreshTokenKey = 'refresh_token';
  
  // Chat Configuration
  static const int messageCacheLimit = 100;
  static const int pollInterval = 30; // seconds
  static const bool enableWebSocket = true;
  
  // File Upload Configuration
  static const int maxFileSize = 10 * 1024 * 1024; // 10MB
  static const List<String> allowedImageTypes = [
    'jpg', 'jpeg', 'png', 'gif', 'webp'
  ];
  static const List<String> allowedDocTypes = [
    'pdf', 'doc', 'docx', 'txt', 'rtf'
  ];
  
  // Theme Configuration
  static const bool darkModeDefault = false;
  static const String fontFamily = 'Roboto';
  
  // Security Configuration
  static const bool requireBiometric = false;
  static const int sessionTimeout = 3600; // seconds
  static const bool enableOfflineMode = true;
}