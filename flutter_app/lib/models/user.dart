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