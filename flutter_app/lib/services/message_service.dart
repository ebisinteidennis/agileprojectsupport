import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../models/message.dart';
import '../models/visitor.dart';
import '../models/api_response.dart';
import '../config/app_config.dart';
import 'api_service.dart';
import 'storage_service.dart';
import 'auth_service.dart';

class MessageService extends ChangeNotifier {
  static final MessageService _instance = MessageService._internal();
  factory MessageService() => _instance;
  MessageService._internal();

  final ApiService _apiService = ApiService();
  final StorageService _storage = StorageService();
  final AuthService _authService = AuthService();

  // WebSocket connection
  WebSocketChannel? _webSocketChannel;
  StreamSubscription? _webSocketSubscription;
  Timer? _reconnectTimer;
  Timer? _pollingTimer;
  Timer? _heartbeatTimer;

  // State management
  final List<Message> _messages = [];
  final Map<String, List<Message>> _conversationMessages = {};
  final Set<String> _loadingConversations = {};
  
  bool _isConnected = false;
  bool _isConnecting = false;
  bool _usePolling = false;
  int _reconnectAttempts = 0;
  int _maxReconnectAttempts = 5;

  // Getters
  List<Message> get messages => List.unmodifiable(_messages);
  bool get isConnected => _isConnected;
  bool get isConnecting => _isConnecting;
  bool get useWebSocket => !_usePolling;

  // Stream controllers for real-time updates
  final StreamController<Message> _newMessageController = StreamController<Message>.broadcast();
  final StreamController<String> _messageStatusController = StreamController<String>.broadcast();
  final StreamController<bool> _connectionStatusController = StreamController<bool>.broadcast();

  // Public streams
  Stream<Message> get newMessageStream => _newMessageController.stream;
  Stream<String> get messageStatusStream => _messageStatusController.stream;
  Stream<bool> get connectionStatusStream => _connectionStatusController.stream;

  // Initialize message service
  Future<void> initialize() async {
    // Check connectivity
    final connectivity = Connectivity();
    final connectivityResult = await connectivity.checkConnectivity();
    
    if (connectivityResult != ConnectivityResult.none) {
      await _initializeConnection();
    }
    
    // Listen to connectivity changes
    connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      if (result != ConnectivityResult.none) {
        _handleConnectivityRestored();
      } else {
        _handleConnectivityLost();
      }
    });
  }

  // Initialize connection (WebSocket or polling)
  Future<void> _initializeConnection() async {
    if (!_authService.isLoggedIn) return;

    try {
      // Try WebSocket first
      await _connectWebSocket();
    } catch (e) {
      if (AppConfig.enableLogging) {
        debugPrint('WebSocket failed, falling back to polling: $e');
      }
      _usePolling = true;
      _startPolling();
    }
  }

  // Connect to WebSocket
  Future<void> _connectWebSocket() async {
    if (_isConnecting || _isConnected) return;

    _isConnecting = true;
    _connectionStatusController.add(false);
    notifyListeners();

    try {
      final token = await _storage.getToken();
      if (token == null) throw Exception('No auth token');

      final uri = Uri.parse('${AppConfig.websocketUrl}?token=$token');
      _webSocketChannel = WebSocketChannel.connect(uri);

      _webSocketSubscription = _webSocketChannel!.stream.listen(
        _handleWebSocketMessage,
        onError: _handleWebSocketError,
        onDone: _handleWebSocketDone,
      );

      // Start heartbeat
      _startHeartbeat();

      _isConnected = true;
      _isConnecting = false;
      _reconnectAttempts = 0;
      _usePolling = false;

      _connectionStatusController.add(true);
      notifyListeners();

      if (AppConfig.enableLogging) {
        debugPrint('✅ WebSocket connected');
      }
    } catch (e) {
      _isConnecting = false;
      _handleConnectionError(e);
    }
  }

  // Handle WebSocket message
  void _handleWebSocketMessage(dynamic data) {
    try {
      if (data is String) {
        final messageData = Map<String, dynamic>.from(
          Uri.splitQueryString(data)
        );
        
        switch (messageData['type']) {
          case 'new_message':
            _handleNewMessage(messageData);
            break;
          case 'message_read':
            _handleMessageRead(messageData);
            break;
          case 'visitor_online':
            _handleVisitorOnline(messageData);
            break;
          case 'visitor_offline':
            _handleVisitorOffline(messageData);
            break;
          case 'pong':
            // Heartbeat response
            break;
        }
      }
    } catch (e) {
      if (AppConfig.enableLogging) {
        debugPrint('❌ Error handling WebSocket message: $e');
      }
    }
  }

  // Handle WebSocket error
  void _handleWebSocketError(error) {
    if (AppConfig.enableLogging) {
      debugPrint('❌ WebSocket error: $error');
    }
    _handleConnectionError(error);
  }

  // Handle WebSocket done
  void _handleWebSocketDone() {
    if (AppConfig.enableLogging) {
      debugPrint('⚠️ WebSocket connection closed');
    }
    _isConnected = false;
    _connectionStatusController.add(false);
    notifyListeners();
    
    // Attempt to reconnect
    _scheduleReconnect();
  }

  // Start heartbeat to keep connection alive
  void _startHeartbeat() {
    _heartbeatTimer?.cancel();
    _heartbeatTimer = Timer.periodic(const Duration(seconds: 30), (timer) {
      if (_isConnected && _webSocketChannel != null) {
        try {
          _webSocketChannel!.sink.add('ping');
        } catch (e) {
          if (AppConfig.enableLogging) {
            debugPrint('❌ Heartbeat failed: $e');
          }
        }
      }
    });
  }

  // Start polling for new messages
  void _startPolling() {
    _stopPolling();
    
    _pollingTimer = Timer.periodic(
      Duration(seconds: AppConfig.pollingInterval),
      (timer) => _pollForUpdates(),
    );

    if (AppConfig.enableLogging) {
      debugPrint('🔄 Started polling for messages');
    }
  }

  // Stop polling
  void _stopPolling() {
    _pollingTimer?.cancel();
  }

  // Poll for new messages and updates
  Future<void> _pollForUpdates() async {
    if (!_authService.isLoggedIn) return;

    try {
      // Get timestamp of last received message
      final lastMessage = _messages.isNotEmpty ? _messages.first : null;
      final since = lastMessage?.createdAt.toIso8601String();

      final response = await _apiService.get(
        '/messages/get.php',
        queryParameters: since != null ? {'since': since} : null,
      );

      if (response.isSuccess && response.data != null) {
        final data = response.data as Map<String, dynamic>;
        final newMessages = (data['messages'] as List?)
            ?.map((m) => Message.fromJson(m))
            .toList() ?? [];

        if (newMessages.isNotEmpty) {
          _processNewMessages(newMessages);
        }
      }
    } catch (e) {
      if (AppConfig.enableLogging) {
        debugPrint('❌ Polling error: $e');
      }
    }
  }

  // Get messages for a specific conversation
  Future<ApiResponse<List<Message>>> getMessages({
    String? visitorId,
    int page = 1,
    int limit = 20,
  }) async {
    final conversationKey = visitorId ?? 'all';
    
    if (_loadingConversations.contains(conversationKey)) {
      return ApiResponse<List<Message>>(
        success: false,
        message: 'Already loading messages',
        data: [],
        timestamp: DateTime.now().toIso8601String(),
      );
    }

    _loadingConversations.add(conversationKey);

    try {
      final queryParams = <String, dynamic>{
        'page': page,
        'limit': limit,
      };

      if (visitorId != null) {
        queryParams['visitor_id'] = visitorId;
      }

      final response = await _apiService.get(
        '/messages/get.php',
        queryParameters: queryParams,
      );

      if (response.isSuccess && response.data != null) {
        final data = response.data as Map<String, dynamic>;
        final messagesList = (data['messages'] as List?)
            ?.map((m) => Message.fromJson(m))
            .toList() ?? [];

        // Store in conversation cache
        if (visitorId != null) {
          if (page == 1) {
            _conversationMessages[visitorId] = messagesList;
          } else {
            _conversationMessages[visitorId]?.addAll(messagesList);
          }
        } else {
          if (page == 1) {
            _messages.clear();
          }
          _messages.addAll(messagesList);
        }

        notifyListeners();

        return ApiResponse<List<Message>>(
          success: true,
          message: response.message,
          data: messagesList,
          timestamp: response.timestamp,
          pagination: response.pagination,
        );
      }

      return ApiResponse<List<Message>>(
        success: false,
        message: response.message,
        data: [],
        timestamp: response.timestamp,
      );
    } catch (e) {
      if (AppConfig.enableLogging) {
        debugPrint('❌ Get messages error: $e');
      }
      
      return ApiResponse<List<Message>>(
        success: false,
        message: 'Failed to load messages',
        data: [],
        timestamp: DateTime.now().toIso8601String(),
      );
    } finally {
      _loadingConversations.remove(conversationKey);
    }
  }

  // Send a message
  Future<ApiResponse<Message>> sendMessage({
    required String visitorId,
    required String message,
    String? widgetId,
    File? file,
  }) async {
    try {
      if (file != null) {
        // Send message with file
        final response = await _apiService.uploadFile(
          '/messages/send.php',
          file: file,
          data: {
            'visitor_id': visitorId,
            'message': message,
            if (widgetId != null) 'widget_id': widgetId,
          },
        );

        if (response.isSuccess && response.data != null) {
          final sentMessage = Message.fromJson(response.data['message']);
          _addMessageToConversation(visitorId, sentMessage);
          await _storage.updateUsageStats(messagesSent: 1);
          
          return ApiResponse<Message>(
            success: true,
            message: response.message,
            data: sentMessage,
            timestamp: response.timestamp,
          );
        }
      } else {
        // Send text message
        final response = await _apiService.post(
          '/messages/send.php',
          data: {
            'visitor_id': visitorId,
            'message': message,
            if (widgetId != null) 'widget_id': widgetId,
          },
        );

        if (response.isSuccess && response.data != null) {
          final sentMessage = Message.fromJson(response.data['message']);
          _addMessageToConversation(visitorId, sentMessage);
          await _storage.updateUsageStats(messagesSent: 1);
          
          return ApiResponse<Message>(
            success: true,
            message: response.message,
            data: sentMessage,
            timestamp: response.timestamp,
          );
        }
      }

      return ApiResponse<Message>(
        success: false,
        message: 'Failed to send message',
        data: null,
        timestamp: DateTime.now().toIso8601String(),
      );
    } catch (e) {
      if (AppConfig.enableLogging) {
        debugPrint('❌ Send message error: $e');
      }

      // Store message for retry when back online
      await _storage.storeOfflineMessage({
        'visitor_id': visitorId,
        'message': message,
        'widget_id': widgetId,
        'type': 'text',
      });

      return ApiResponse<Message>(
        success: false,
        message: 'Message will be sent when connection is restored',
        data: null,
        timestamp: DateTime.now().toIso8601String(),
      );
    }
  }

  // Mark messages as read
  Future<void> markMessagesAsRead(String visitorId) async {
    try {
      await _apiService.post(
        '/messages/mark_read.php',
        data: {'visitor_id': visitorId},
      );

      // Update local messages
      final messages = _conversationMessages[visitorId];
      if (messages != null) {
        for (final message in messages) {
          if (message.isFromVisitor && !message.isRead) {
            // Create updated message (immutable)
            final updatedMessage = Message(
              id: message.id,
              userId: message.userId,
              visitorId: message.visitorId,
              widgetId: message.widgetId,
              message: message.message,
              senderType: message.senderType,
              isRead: true, // Mark as read
              createdAt: message.createdAt,
              filePath: message.filePath,
              fileName: message.fileName,
              fileSize: message.fileSize,
              fileType: message.fileType,
              fileInfo: message.fileInfo,
              visitorName: message.visitorName,
              visitorEmail: message.visitorEmail,
            );
            
            // Replace in list
            final index = messages.indexOf(message);
            if (index != -1) {
              messages[index] = updatedMessage;
            }
          }
        }
        notifyListeners();
      }
    } catch (e) {
      if (AppConfig.enableLogging) {
        debugPrint('❌ Mark messages as read error: $e');
      }
    }
  }

  // Get messages for a specific conversation
  List<Message> getConversationMessages(String visitorId) {
    return _conversationMessages[visitorId] ?? [];
  }

  // Handle new message from WebSocket or polling
  void _handleNewMessage(Map<String, dynamic> data) {
    try {
      final message = Message.fromJson(data);
      _addMessageToConversation(message.visitorId, message);
      _newMessageController.add(message);
    } catch (e) {
      if (AppConfig.enableLogging) {
        debugPrint('❌ Error handling new message: $e');
      }
    }
  }

  // Handle message read status update
  void _handleMessageRead(Map<String, dynamic> data) {
    final messageId = data['message_id']?.toString();
    if (messageId != null) {
      _messageStatusController.add('read_$messageId');
    }
  }

  // Handle visitor online status
  void _handleVisitorOnline(Map<String, dynamic> data) {
    // This can trigger visitor status updates in UI
  }

  // Handle visitor offline status
  void _handleVisitorOffline(Map<String, dynamic> data) {
    // This can trigger visitor status updates in UI
  }

  // Add message to conversation
  void _addMessageToConversation(String visitorId, Message message) {
    if (!_conversationMessages.containsKey(visitorId)) {
      _conversationMessages[visitorId] = [];
    }
    
    // Check if message already exists to avoid duplicates
    final exists = _conversationMessages[visitorId]!
        .any((m) => m.id == message.id);
    
    if (!exists) {
      _conversationMessages[visitorId]!.insert(0, message);
      notifyListeners();
    }
  }

  // Process new messages from polling
  void _processNewMessages(List<Message> newMessages) {
    for (final message in newMessages) {
      _addMessageToConversation(message.visitorId, message);
      _newMessageController.add(message);
    }
  }

  // Handle connection error
  void _handleConnectionError(dynamic error) {
    _isConnected = false;
    _isConnecting = false;
    _connectionStatusController.add(false);
    notifyListeners();

    if (_reconnectAttempts < _maxReconnectAttempts) {
      _scheduleReconnect();
    } else {
      // Fall back to polling
      _usePolling = true;
      _startPolling();
    }
  }

  // Schedule reconnect attempt
  void _scheduleReconnect() {
    _reconnectTimer?.cancel();
    
    final delay = Duration(seconds: AppConfig.websocketReconnectDelay * (_reconnectAttempts + 1));
    _reconnectTimer = Timer(delay, () {
      _reconnectAttempts++;
      _connectWebSocket();
    });
  }

  // Handle connectivity restored
  void _handleConnectivityRestored() {
    if (AppConfig.enableLogging) {
      debugPrint('🌐 Connectivity restored');
    }
    
    _reconnectAttempts = 0;
    _initializeConnection();
    _retrySendOfflineMessages();
  }

  // Handle connectivity lost
  void _handleConnectivityLost() {
    if (AppConfig.enableLogging) {
      debugPrint('🌐 Connectivity lost');
    }
    
    _disconnect();
  }

  // Retry sending offline messages
  Future<void> _retrySendOfflineMessages() async {
    final offlineMessages = await _storage.getOfflineMessages();
    
    if (offlineMessages.isNotEmpty) {
      if (AppConfig.enableLogging) {
        debugPrint('📤 Retrying ${offlineMessages.length} offline messages');
      }
      
      for (final messageData in offlineMessages) {
        try {
          await sendMessage(
            visitorId: messageData['visitor_id'],
            message: messageData['message'],
            widgetId: messageData['widget_id'],
          );
        } catch (e) {
          if (AppConfig.enableLogging) {
            debugPrint('❌ Failed to retry offline message: $e');
          }
          break; // Stop retrying if one fails
        }
      }
      
      // Clear offline messages after successful retry
      await _storage.clearOfflineMessages();
    }
  }

  // Disconnect from WebSocket
  void _disconnect() {
    _webSocketSubscription?.cancel();
    _webSocketChannel?.sink.close();
    _heartbeatTimer?.cancel();
    _reconnectTimer?.cancel();
    _stopPolling();
    
    _isConnected = false;
    _isConnecting = false;
    _connectionStatusController.add(false);
    notifyListeners();
  }

  // Dispose
  @override
  void dispose() {
    _disconnect();
    _newMessageController.close();
    _messageStatusController.close();
    _connectionStatusController.close();
    super.dispose();
  }
}