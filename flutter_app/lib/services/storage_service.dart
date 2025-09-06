import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../models/user.dart';
import '../config/app_config.dart';

class StorageService {
  static final StorageService _instance = StorageService._internal();
  factory StorageService() => _instance;
  StorageService._internal();

  static const _secureStorage = FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
    iOptions: IOSOptions(
      accessibility: IOSAccessibility.first_unlock_this_device,
    ),
  );

  SharedPreferences? _prefs;

  // Initialize storage
  Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }

  SharedPreferences get prefs {
    if (_prefs == null) {
      throw Exception('StorageService not initialized. Call initialize() first.');
    }
    return _prefs!;
  }

  // ============ AUTHENTICATION DATA ============

  // Store auth token securely
  Future<void> setToken(String token) async {
    try {
      await _secureStorage.write(key: AppConfig.tokenKey, value: token);
      if (AppConfig.enableLogging) {
        debugPrint('🔐 Token stored securely');
      }
    } catch (e) {
      if (AppConfig.enableLogging) {
        debugPrint('❌ Failed to store token: $e');
      }
    }
  }

  // Get auth token
  Future<String?> getToken() async {
    try {
      return await _secureStorage.read(key: AppConfig.tokenKey);
    } catch (e) {
      if (AppConfig.enableLogging) {
        debugPrint('❌ Failed to get token: $e');
      }
      return null;
    }
  }

  // Store user data
  Future<void> setUser(User user) async {
    try {
      final userJson = jsonEncode(user.toJson());
      await prefs.setString(AppConfig.userKey, userJson);
      if (AppConfig.enableLogging) {
        debugPrint('👤 User data stored');
      }
    } catch (e) {
      if (AppConfig.enableLogging) {
        debugPrint('❌ Failed to store user data: $e');
      }
    }
  }

  // Get user data
  Future<User?> getUser() async {
    try {
      final userJson = prefs.getString(AppConfig.userKey);
      if (userJson != null) {
        final userMap = jsonDecode(userJson) as Map<String, dynamic>;
        return User.fromJson(userMap);
      }
      return null;
    } catch (e) {
      if (AppConfig.enableLogging) {
        debugPrint('❌ Failed to get user data: $e');
      }
      return null;
    }
  }

  // Clear all authentication data
  Future<void> clearAuthData() async {
    try {
      await _secureStorage.delete(key: AppConfig.tokenKey);
      await prefs.remove(AppConfig.userKey);
      if (AppConfig.enableLogging) {
        debugPrint('🗑️ Auth data cleared');
      }
    } catch (e) {
      if (AppConfig.enableLogging) {
        debugPrint('❌ Failed to clear auth data: $e');
      }
    }
  }

  // ============ APP SETTINGS ============

  // Store app settings
  Future<void> setSettings(Map<String, dynamic> settings) async {
    try {
      final settingsJson = jsonEncode(settings);
      await prefs.setString(AppConfig.settingsKey, settingsJson);
    } catch (e) {
      if (AppConfig.enableLogging) {
        debugPrint('❌ Failed to store settings: $e');
      }
    }
  }

  // Get app settings
  Future<Map<String, dynamic>?> getSettings() async {
    try {
      final settingsJson = prefs.getString(AppConfig.settingsKey);
      if (settingsJson != null) {
        return jsonDecode(settingsJson) as Map<String, dynamic>;
      }
      return null;
    } catch (e) {
      if (AppConfig.enableLogging) {
        debugPrint('❌ Failed to get settings: $e');
      }
      return null;
    }
  }

  // ============ NOTIFICATION SETTINGS ============

  // Store notification settings
  Future<void> setNotificationSettings(Map<String, dynamic> settings) async {
    try {
      final settingsJson = jsonEncode(settings);
      await prefs.setString(AppConfig.notificationKey, settingsJson);
    } catch (e) {
      if (AppConfig.enableLogging) {
        debugPrint('❌ Failed to store notification settings: $e');
      }
    }
  }

  // Get notification settings
  Future<Map<String, dynamic>> getNotificationSettings() async {
    try {
      final settingsJson = prefs.getString(AppConfig.notificationKey);
      if (settingsJson != null) {
        return jsonDecode(settingsJson) as Map<String, dynamic>;
      }
      // Return default settings
      return {
        'enabled': true,
        'sound': true,
        'vibration': true,
        'showPreview': true,
        'newMessages': true,
        'visitorOnline': true,
        'systemNotifications': true,
      };
    } catch (e) {
      if (AppConfig.enableLogging) {
        debugPrint('❌ Failed to get notification settings: $e');
      }
      return {
        'enabled': true,
        'sound': true,
        'vibration': true,
        'showPreview': true,
        'newMessages': true,
        'visitorOnline': true,
        'systemNotifications': true,
      };
    }
  }

  // ============ CACHE MANAGEMENT ============

  // Store cache data with expiry
  Future<void> setCacheData(String key, dynamic data, {Duration? expiry}) async {
    try {
      final cacheItem = {
        'data': data,
        'timestamp': DateTime.now().millisecondsSinceEpoch,
        'expiry': expiry?.inMilliseconds,
      };
      final cacheJson = jsonEncode(cacheItem);
      await prefs.setString('cache_$key', cacheJson);
    } catch (e) {
      if (AppConfig.enableLogging) {
        debugPrint('❌ Failed to store cache data: $e');
      }
    }
  }

  // Get cache data (returns null if expired)
  Future<T?> getCacheData<T>(String key) async {
    try {
      final cacheJson = prefs.getString('cache_$key');
      if (cacheJson != null) {
        final cacheItem = jsonDecode(cacheJson) as Map<String, dynamic>;
        final timestamp = cacheItem['timestamp'] as int;
        final expiry = cacheItem['expiry'] as int?;
        
        // Check if cache is expired
        if (expiry != null) {
          final expiryTime = DateTime.fromMillisecondsSinceEpoch(timestamp + expiry);
          if (DateTime.now().isAfter(expiryTime)) {
            // Cache expired, remove it
            await prefs.remove('cache_$key');
            return null;
          }
        }
        
        return cacheItem['data'] as T;
      }
      return null;
    } catch (e) {
      if (AppConfig.enableLogging) {
        debugPrint('❌ Failed to get cache data: $e');
      }
      return null;
    }
  }

  // Clear specific cache
  Future<void> clearCache(String key) async {
    try {
      await prefs.remove('cache_$key');
    } catch (e) {
      if (AppConfig.enableLogging) {
        debugPrint('❌ Failed to clear cache: $e');
      }
    }
  }

  // Clear all cache data
  Future<void> clearAllCache() async {
    try {
      final keys = prefs.getKeys().where((key) => key.startsWith('cache_'));
      for (final key in keys) {
        await prefs.remove(key);
      }
      if (AppConfig.enableLogging) {
        debugPrint('🗑️ All cache cleared');
      }
    } catch (e) {
      if (AppConfig.enableLogging) {
        debugPrint('❌ Failed to clear all cache: $e');
      }
    }
  }

  // ============ THEME & UI PREFERENCES ============

  // Store theme mode
  Future<void> setThemeMode(String mode) async {
    await prefs.setString('theme_mode', mode);
  }

  // Get theme mode
  String getThemeMode() {
    return prefs.getString('theme_mode') ?? 'system';
  }

  // Store font size preference
  Future<void> setFontSize(double size) async {
    await prefs.setDouble('font_size', size);
  }

  // Get font size preference
  double getFontSize() {
    return prefs.getDouble('font_size') ?? 14.0;
  }

  // ============ CHAT PREFERENCES ============

  // Store last seen message timestamp for a conversation
  Future<void> setLastSeenMessage(String conversationId, DateTime timestamp) async {
    await prefs.setString(
      'last_seen_$conversationId',
      timestamp.toIso8601String(),
    );
  }

  // Get last seen message timestamp
  DateTime? getLastSeenMessage(String conversationId) {
    final timestampStr = prefs.getString('last_seen_$conversationId');
    if (timestampStr != null) {
      return DateTime.parse(timestampStr);
    }
    return null;
  }

  // Store draft message for a conversation
  Future<void> setDraftMessage(String conversationId, String message) async {
    if (message.isEmpty) {
      await prefs.remove('draft_$conversationId');
    } else {
      await prefs.setString('draft_$conversationId', message);
    }
  }

  // Get draft message
  String? getDraftMessage(String conversationId) {
    return prefs.getString('draft_$conversationId');
  }

  // ============ OFFLINE DATA ============

  // Store offline messages
  Future<void> storeOfflineMessage(Map<String, dynamic> message) async {
    try {
      final offlineMessages = await getOfflineMessages();
      offlineMessages.add({
        ...message,
        'timestamp': DateTime.now().toIso8601String(),
        'id': DateTime.now().millisecondsSinceEpoch.toString(),
      });
      
      final messagesJson = jsonEncode(offlineMessages);
      await prefs.setString('offline_messages', messagesJson);
    } catch (e) {
      if (AppConfig.enableLogging) {
        debugPrint('❌ Failed to store offline message: $e');
      }
    }
  }

  // Get offline messages
  Future<List<Map<String, dynamic>>> getOfflineMessages() async {
    try {
      final messagesJson = prefs.getString('offline_messages');
      if (messagesJson != null) {
        final messagesList = jsonDecode(messagesJson) as List;
        return messagesList.cast<Map<String, dynamic>>();
      }
      return [];
    } catch (e) {
      if (AppConfig.enableLogging) {
        debugPrint('❌ Failed to get offline messages: $e');
      }
      return [];
    }
  }

  // Clear offline messages
  Future<void> clearOfflineMessages() async {
    await prefs.remove('offline_messages');
  }

  // ============ ANALYTICS & USAGE DATA ============

  // Store usage statistics
  Future<void> updateUsageStats({
    int? messagesViewed,
    int? messagesSent,
    int? conversationsViewed,
    int? loginCount,
  }) async {
    try {
      final stats = await getUsageStats();
      
      if (messagesViewed != null) {
        stats['messages_viewed'] = (stats['messages_viewed'] ?? 0) + messagesViewed;
      }
      if (messagesSent != null) {
        stats['messages_sent'] = (stats['messages_sent'] ?? 0) + messagesSent;
      }
      if (conversationsViewed != null) {
        stats['conversations_viewed'] = (stats['conversations_viewed'] ?? 0) + conversationsViewed;
      }
      if (loginCount != null) {
        stats['login_count'] = (stats['login_count'] ?? 0) + loginCount;
      }
      
      stats['last_updated'] = DateTime.now().toIso8601String();
      
      final statsJson = jsonEncode(stats);
      await prefs.setString('usage_stats', statsJson);
    } catch (e) {
      if (AppConfig.enableLogging) {
        debugPrint('❌ Failed to update usage stats: $e');
      }
    }
  }

  // Get usage statistics
  Future<Map<String, dynamic>> getUsageStats() async {
    try {
      final statsJson = prefs.getString('usage_stats');
      if (statsJson != null) {
        return jsonDecode(statsJson) as Map<String, dynamic>;
      }
      return {
        'messages_viewed': 0,
        'messages_sent': 0,
        'conversations_viewed': 0,
        'login_count': 0,
        'first_login': DateTime.now().toIso8601String(),
        'last_updated': DateTime.now().toIso8601String(),
      };
    } catch (e) {
      if (AppConfig.enableLogging) {
        debugPrint('❌ Failed to get usage stats: $e');
      }
      return {};
    }
  }

  // ============ UTILITY METHODS ============

  // Check if key exists
  bool hasKey(String key) {
    return prefs.containsKey(key);
  }

  // Remove specific key
  Future<void> removeKey(String key) async {
    await prefs.remove(key);
  }

  // Get all keys
  Set<String> getAllKeys() {
    return prefs.getKeys();
  }

  // Clear all data (except secure storage)
  Future<void> clearAll() async {
    await prefs.clear();
    if (AppConfig.enableLogging) {
      debugPrint('🗑️ All storage cleared');
    }
  }

  // Get storage size (approximate)
  int getStorageSize() {
    int size = 0;
    for (final key in prefs.getKeys()) {
      final value = prefs.get(key);
      if (value is String) {
        size += value.length;
      }
    }
    return size;
  }
}