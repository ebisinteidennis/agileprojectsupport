// lib/models/user.dart
class User {
  final int id;
  final String name;
  final String email;
  final String? phone;        // ✅ Add this
  final String? bio;          // ✅ Add this
  final String? avatar;       // ✅ Add this
  final String subscriptionStatus;
  final String? subscriptionExpiry;
  final String widgetId;
  final DateTime createdAt;
  final DateTime? lastActivity;
  final Subscription? subscription;
  final WidgetSettings? widgetSettings;
  final UserStats? stats;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.phone,               // ✅ Add this
    this.bio,                 // ✅ Add this
    this.avatar,              // ✅ Add this
    required this.subscriptionStatus,
    this.subscriptionExpiry,
    required this.widgetId,
    required this.createdAt,
    this.lastActivity,
    this.subscription,
    this.widgetSettings,
    this.stats,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],           // ✅ Add this
      bio: json['bio'],               // ✅ Add this
      avatar: json['avatar'],         // ✅ Add this
      subscriptionStatus: json['subscription_status'],
      subscriptionExpiry: json['subscription_expiry'],
      widgetId: json['widget_id'],
      createdAt: DateTime.parse(json['created_at']),
      lastActivity: json['last_activity'] != null 
          ? DateTime.parse(json['last_activity']) 
          : null,
      subscription: json['subscription'] != null 
          ? Subscription.fromJson(json['subscription']) 
          : null,
      widgetSettings: json['widget_settings'] != null 
          ? WidgetSettings.fromJson(json['widget_settings']) 
          : null,
      stats: json['stats'] != null 
          ? UserStats.fromJson(json['stats']) 
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,                 // ✅ Add this
      'bio': bio,                     // ✅ Add this
      'avatar': avatar,               // ✅ Add this
      'subscription_status': subscriptionStatus,
      'subscription_expiry': subscriptionExpiry,
      'widget_id': widgetId,
      'created_at': createdAt.toIso8601String(),
      'last_activity': lastActivity?.toIso8601String(),
      'subscription': subscription?.toJson(),
      'widget_settings': widgetSettings?.toJson(),
      'stats': stats?.toJson(),
    };
  }

  bool get hasActiveSubscription => subscriptionStatus == 'active';
  bool get isSubscriptionExpired => subscriptionExpiry != null && 
      DateTime.parse(subscriptionExpiry!).isBefore(DateTime.now());
}

// lib/models/subscription.dart
class Subscription {
  final String name;
  final double price;
  final int messageLimit;
  final int visitorLimit;
  final bool allowFileUpload;
  final String features;
  final double? paymentAmount;
  final String? paymentDate;
  final String? expiresAt;

  Subscription({
    required this.name,
    required this.price,
    required this.messageLimit,
    required this.visitorLimit,
    required this.allowFileUpload,
    required this.features,
    this.paymentAmount,
    this.paymentDate,
    this.expiresAt,
  });

  factory Subscription.fromJson(Map<String, dynamic> json) {
    return Subscription(
      name: json['name'] ?? json['subscription_name'],
      price: double.tryParse(json['price'].toString()) ?? 0.0,
      messageLimit: json['message_limit'] ?? 0,
      visitorLimit: json['visitor_limit'] ?? 0,
      allowFileUpload: json['allow_file_upload'] == 1 || json['allow_file_upload'] == true,
      features: json['features'] ?? '',
      paymentAmount: json['payment_amount'] != null 
          ? double.tryParse(json['payment_amount'].toString()) 
          : null,
      paymentDate: json['payment_date'],
      expiresAt: json['expires_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'message_limit': messageLimit,
      'visitor_limit': visitorLimit,
      'allow_file_upload': allowFileUpload,
      'features': features,
      'payment_amount': paymentAmount,
      'payment_date': paymentDate,
      'expires_at': expiresAt,
    };
  }

  List<String> get featuresList {
    return features.split('\n').where((f) => f.isNotEmpty).toList();
  }
}

// lib/models/widget_settings.dart
class WidgetSettings {
  final String themeColor;
  final String textColor;
  final String position;
  final String welcomeMessage;
  final String offlineMessage;
  final String displayName;
  final String? logoUrl;

  WidgetSettings({
    required this.themeColor,
    required this.textColor,
    required this.position,
    required this.welcomeMessage,
    required this.offlineMessage,
    required this.displayName,
    this.logoUrl,
  });

  factory WidgetSettings.fromJson(Map<String, dynamic> json) {
    return WidgetSettings(
      themeColor: json['theme_color'] ?? '#3498db',
      textColor: json['text_color'] ?? '#ffffff',
      position: json['position'] ?? 'bottom_right',
      welcomeMessage: json['welcome_message'] ?? 'Hello! How can we help you today?',
      offlineMessage: json['offline_message'] ?? 'Sorry, we\'re currently offline.',
      displayName: json['display_name'] ?? 'Support',
      logoUrl: json['logo_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'theme_color': themeColor,
      'text_color': textColor,
      'position': position,
      'welcome_message': welcomeMessage,
      'offline_message': offlineMessage,
      'display_name': displayName,
      'logo_url': logoUrl,
    };
  }
}

// lib/models/user_stats.dart
class UserStats {
  final int messagesToday;
  final int visitorsToday;
  final int messagesWeek;
  final int visitorsWeek;
  final int messagesMonth;
  final int visitorsMonth;
  final int totalMessages;
  final int totalVisitors;
  final int totalConversations;
  final int unreadMessages;

  UserStats({
    required this.messagesToday,
    required this.visitorsToday,
    required this.messagesWeek,
    required this.visitorsWeek,
    required this.messagesMonth,
    required this.visitorsMonth,
    required this.totalMessages,
    required this.totalVisitors,
    required this.totalConversations,
    required this.unreadMessages,
  });

  factory UserStats.fromJson(Map<String, dynamic> json) {
    return UserStats(
      messagesToday: int.tryParse(json['messages_today'].toString()) ?? 0,
      visitorsToday: int.tryParse(json['visitors_today'].toString()) ?? 0,
      messagesWeek: int.tryParse(json['messages_week'].toString()) ?? 0,
      visitorsWeek: int.tryParse(json['visitors_week'].toString()) ?? 0,
      messagesMonth: int.tryParse(json['messages_month'].toString()) ?? 0,
      visitorsMonth: int.tryParse(json['visitors_month'].toString()) ?? 0,
      totalMessages: int.tryParse(json['total_messages'].toString()) ?? 0,
      totalVisitors: int.tryParse(json['total_visitors'].toString()) ?? 0,
      totalConversations: int.tryParse(json['total_conversations'].toString()) ?? 0,
      unreadMessages: int.tryParse(json['unread_messages'].toString()) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'messages_today': messagesToday,
      'visitors_today': visitorsToday,
      'messages_week': messagesWeek,
      'visitors_week': visitorsWeek,
      'messages_month': messagesMonth,
      'visitors_month': visitorsMonth,
      'total_messages': totalMessages,
      'total_visitors': totalVisitors,
      'total_conversations': totalConversations,
      'unread_messages': unreadMessages,
    };
  }
}

// lib/models/message.dart
class Message {
  final int id;
  final int userId;
  final String visitorId;
  final String? widgetId;
  final String message;
  final String senderType;
  final bool isRead;
  final DateTime createdAt;
  final String? filePath;
  final String? fileName;
  final String? fileSize;
  final String? fileType;
  final FileInfo? fileInfo;
  final String? visitorName;
  final String? visitorEmail;

  Message({
    required this.id,
    required this.userId,
    required this.visitorId,
    this.widgetId,
    required this.message,
    required this.senderType,
    required this.isRead,
    required this.createdAt,
    this.filePath,
    this.fileName,
    this.fileSize,
    this.fileType,
    this.fileInfo,
    this.visitorName,
    this.visitorEmail,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'],
      userId: json['user_id'],
      visitorId: json['visitor_id'].toString(),
      widgetId: json['widget_id'],
      message: json['message'],
      senderType: json['sender_type'],
      isRead: json['is_read'] ?? json['read'] == 1,
      createdAt: DateTime.parse(json['created_at']),
      filePath: json['file_path'],
      fileName: json['file_name'],
      fileSize: json['file_size'],
      fileType: json['file_type'],
      fileInfo: json['file_info'] != null 
          ? FileInfo.fromJson(json['file_info']) 
          : null,
      visitorName: json['visitor_name'],
      visitorEmail: json['visitor_email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'visitor_id': visitorId,
      'widget_id': widgetId,
      'message': message,
      'sender_type': senderType,
      'is_read': isRead,
      'created_at': createdAt.toIso8601String(),
      'file_path': filePath,
      'file_name': fileName,
      'file_size': fileSize,
      'file_type': fileType,
      'file_info': fileInfo?.toJson(),
      'visitor_name': visitorName,
      'visitor_email': visitorEmail,
    };
  }

  bool get isFromVisitor => senderType == 'visitor';
  bool get isFromAgent => senderType == 'agent';
  bool get hasFile => fileInfo != null || filePath != null;
  String get displayName => visitorName ?? 'Anonymous';
}

// lib/models/file_info.dart
class FileInfo {
  final String path;
  final String name;
  final String size;
  final String type;
  final String downloadUrl;

  FileInfo({
    required this.path,
    required this.name,
    required this.size,
    required this.type,
    required this.downloadUrl,
  });

  factory FileInfo.fromJson(Map<String, dynamic> json) {
    return FileInfo(
      path: json['path'],
      name: json['name'],
      size: json['size'],
      type: json['type'],
      downloadUrl: json['download_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'path': path,
      'name': name,
      'size': size,
      'type': type,
      'download_url': downloadUrl,
    };
  }

  bool get isImage => type.startsWith('image/');
  bool get isPdf => type == 'application/pdf';
  bool get isText => type.startsWith('text/');
}

// lib/models/visitor.dart
class Visitor {
  final int id;
  final int userId;
  final String name;
  final String? email;
  final String? url;
  final String ipAddress;
  final String? userAgent;
  final DateTime createdAt;
  final DateTime lastActive;
  final String status;
  final String? country;
  final String? browser;
  final String? deviceType;
  final int totalMessages;
  final int visitorMessages;
  final int agentMessages;
  final int unreadMessages;
  final DateTime? lastMessageAt;
  final String? lastMessage;
  final String? lastMessageSender;
  final String activityStatus;

  Visitor({
    required this.id,
    required this.userId,
    required this.name,
    this.email,
    this.url,
    required this.ipAddress,
    this.userAgent,
    required this.createdAt,
    required this.lastActive,
    required this.status,
    this.country,
    this.browser,
    this.deviceType,
    required this.totalMessages,
    required this.visitorMessages,
    required this.agentMessages,
    required this.unreadMessages,
    this.lastMessageAt,
    this.lastMessage,
    this.lastMessageSender,
    required this.activityStatus,
  });

  factory Visitor.fromJson(Map<String, dynamic> json) {
    return Visitor(
      id: json['id'],
      userId: json['user_id'],
      name: json['name'] ?? 'Anonymous',
      email: json['email'],
      url: json['url'],
      ipAddress: json['ip_address'] ?? '',
      userAgent: json['user_agent'],
      createdAt: DateTime.parse(json['created_at']),
      lastActive: DateTime.parse(json['last_active']),
      status: json['status'] ?? 'active',
      country: json['country'],
      browser: json['browser'],
      deviceType: json['device_type'],
      totalMessages: int.tryParse(json['total_messages'].toString()) ?? 0,
      visitorMessages: int.tryParse(json['visitor_messages'].toString()) ?? 0,
      agentMessages: int.tryParse(json['agent_messages'].toString()) ?? 0,
      unreadMessages: int.tryParse(json['unread_messages'].toString()) ?? 0,
      lastMessageAt: json['last_message_at'] != null 
          ? DateTime.parse(json['last_message_at']) 
          : null,
      lastMessage: json['last_message'],
      lastMessageSender: json['last_message_sender'],
      activityStatus: json['activity_status'] ?? 'offline',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'name': name,
      'email': email,
      'url': url,
      'ip_address': ipAddress,
      'user_agent': userAgent,
      'created_at': createdAt.toIso8601String(),
      'last_active': lastActive.toIso8601String(),
      'status': status,
      'country': country,
      'browser': browser,
      'device_type': deviceType,
      'total_messages': totalMessages,
      'visitor_messages': visitorMessages,
      'agent_messages': agentMessages,
      'unread_messages': unreadMessages,
      'last_message_at': lastMessageAt?.toIso8601String(),
      'last_message': lastMessage,
      'last_message_sender': lastMessageSender,
      'activity_status': activityStatus,
    };
  }

  bool get isOnline => activityStatus == 'online';
  bool get isRecentlyActive => activityStatus == 'recently_active';
  bool get hasUnreadMessages => unreadMessages > 0;
  String get displayName => name.isEmpty ? 'Anonymous' : name;
}

// lib/models/api_response.dart
class ApiResponse<T> {
  final bool success;
  final String message;
  final T? data;
  final String timestamp;
  final Map<String, dynamic>? pagination;
  final int? statusCode;

  ApiResponse({
    required this.success,
    required this.message,
    this.data,
    required this.timestamp,
    this.pagination,
    this.statusCode,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json, {T? data}) {
    return ApiResponse<T>(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: data ?? json['data'],
      timestamp: json['timestamp'] ?? DateTime.now().toIso8601String(),
      pagination: json['pagination'],
      statusCode: json['status_code'],
    );
  }

  bool get isSuccess => success;
  bool get isError => !success;
}