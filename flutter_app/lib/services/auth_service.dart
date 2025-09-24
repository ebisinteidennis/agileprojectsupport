import 'dart:convert';
import 'package:flutter/foundation.dart';
import '../models/user.dart' hide ApiResponse;
import '../models/api_response.dart';
import '../config/app_config.dart';
import 'api_service.dart';
import 'storage_service.dart';

class AuthService extends ChangeNotifier {
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();

  final ApiService _apiService = ApiService();
  final StorageService _storage = StorageService();

  User? _currentUser;
  String? _authToken;
  bool _isLoading = false;
  bool _isLoggedIn = false;

  // Getters
  User? get currentUser => _currentUser;
  String? get authToken => _authToken;
  bool get isLoading => _isLoading;
  bool get isLoggedIn => _isLoggedIn;
  bool get hasActiveSubscription => _currentUser?.hasActiveSubscription ?? false;
  bool get isAuthenticated => _currentUser != null;

  // Initialize auth service
  Future<void> initialize() async {
    _setLoading(true);
    
    try {
      // Load cached auth data
      await _loadCachedAuthData();
      
      // Validate token if exists
      if (_authToken != null) {
        await _validateToken();
      }
    } catch (e) {
      if (AppConfig.enableLogging) {
        debugPrint('Auth initialization error: $e');
      }
      await clearAuthData();
    } finally {
      _setLoading(false);
    }
  }

  // Login user
  Future<ApiResponse<Map<String, dynamic>>> login({
    required String email,
    required String password,
  }) async {
    _setLoading(true);

    try {
      final response = await _apiService.post(
        '/auth/login.php',
        data: {
          'email': email.trim().toLowerCase(),
          'password': password,
        },
      );

      if (response.isSuccess && response.data != null) {
        final data = response.data as Map<String, dynamic>;
        
        if (data['token'] != null && data['user'] != null) {
          _authToken = data['token'];
          _currentUser = User.fromJson(data['user']);
          _isLoggedIn = true;

          // Cache auth data
          await _storage.setToken(_authToken!);
          await _storage.setUser(_currentUser!);

          notifyListeners();
          
          return ApiResponse<Map<String, dynamic>>(
            success: true,
            message: response.message,
            data: data,
            timestamp: response.timestamp,
          );
        }
      }

      return ApiResponse<Map<String, dynamic>>(
        success: false,
        message: response.message.isNotEmpty ? response.message : 'Login failed',
        data: null,
        timestamp: response.timestamp,
      );
    } catch (e) {
      if (AppConfig.enableLogging) {
        debugPrint('Login error: $e');
      }
      
      return ApiResponse<Map<String, dynamic>>(
        success: false,
        message: 'Login failed. Please try again.',
        data: null,
        timestamp: DateTime.now().toIso8601String(),
      );
    } finally {
      _setLoading(false);
    }
  }

  // Register user
  Future<ApiResponse<Map<String, dynamic>>> register({
    required String name,
    required String email,
    required String password,
  }) async {
    _setLoading(true);

    try {
      final response = await _apiService.post(
        '/auth/register.php',
        data: {
          'name': name.trim(),
          'email': email.trim().toLowerCase(),
          'password': password,
        },
      );

      if (response.isSuccess && response.data != null) {
        final data = response.data as Map<String, dynamic>;
        
        if (data['token'] != null && data['user'] != null) {
          _authToken = data['token'];
          _currentUser = User.fromJson(data['user']);
          _isLoggedIn = true;

          // Cache auth data
          await _storage.setToken(_authToken!);
          await _storage.setUser(_currentUser!);

          notifyListeners();
          
          return ApiResponse<Map<String, dynamic>>(
            success: true,
            message: response.message,
            data: data,
            timestamp: response.timestamp,
          );
        }
      }

      return ApiResponse<Map<String, dynamic>>(
        success: false,
        message: response.message.isNotEmpty ? response.message : 'Registration failed',
        data: null,
        timestamp: response.timestamp,
      );
    } catch (e) {
      if (AppConfig.enableLogging) {
        debugPrint('Registration error: $e');
      }
      
      return ApiResponse<Map<String, dynamic>>(
        success: false,
        message: 'Registration failed. Please try again.',
        data: null,
        timestamp: DateTime.now().toIso8601String(),
      );
    } finally {
      _setLoading(false);
    }
  }

  // Logout user
  Future<void> logout() async {
    _setLoading(true);

    try {
      // Call logout endpoint (optional)
      await _apiService.post('/auth/logout.php');
    } catch (e) {
      if (AppConfig.enableLogging) {
        debugPrint('Logout API error (ignored): $e');
      }
    } finally {
      // Always clear local auth data
      await clearAuthData();
      _setLoading(false);
    }
  }

  // Clear authentication data
  Future<void> clearAuthData() async {
    _authToken = null;
    _currentUser = null;
    _isLoggedIn = false;
    
    await _storage.clearAuthData();
    notifyListeners();
  }

  // Refresh user data
  Future<bool> refreshUserData() async {
    if (!_isLoggedIn || _authToken == null) {
      return false;
    }

    try {
      final response = await _apiService.get('/user/profile.php');
      
      if (response.isSuccess && response.data != null) {
        _currentUser = User.fromJson(response.data);
        await _storage.setUser(_currentUser!);
        notifyListeners();
        return true;
      }
    } catch (e) {
      if (AppConfig.enableLogging) {
        debugPrint('Refresh user data error: $e');
      }
    }

    return false;
  }

  // ✅ Fixed updateProfile method to return proper ApiResponse<User>
  Future<ApiResponse<User>> updateProfile({
    String? name,
    String? email,
    String? phone,
    String? bio,
    String? currentPassword,
    String? newPassword,
  }) async {
    if (!_isLoggedIn) {
      return ApiResponse<User>(
        success: false,
        message: 'Not authenticated',
        data: null,
        timestamp: DateTime.now().toIso8601String(),
      );
    }

    _setLoading(true);

    try {
      final data = <String, dynamic>{};
      
      if (name != null) data['name'] = name.trim();
      if (email != null) data['email'] = email.trim().toLowerCase();
      if (phone != null) data['phone'] = phone.trim();
      if (bio != null) data['bio'] = bio.trim();
      if (currentPassword != null) data['current_password'] = currentPassword;
      if (newPassword != null) data['new_password'] = newPassword;

      final response = await _apiService.put(
        '/user/profile.php',
        data: data,
      );

      if (response.isSuccess && response.data != null) {
        _currentUser = User.fromJson(response.data);
        await _storage.setUser(_currentUser!);
        notifyListeners();
        
        return ApiResponse<User>(
          success: true,
          message: response.message,
          data: _currentUser,
          timestamp: response.timestamp,
        );
      }

      return ApiResponse<User>(
        success: false,
        message: response.message,
        data: null,
        timestamp: response.timestamp,
      );
    } catch (e) {
      if (AppConfig.enableLogging) {
        debugPrint('Update profile error: $e');
      }
      
      return ApiResponse<User>(
        success: false,
        message: 'Failed to update profile',
        data: null,
        timestamp: DateTime.now().toIso8601String(),
      );
    } finally {
      _setLoading(false);
    }
  }

  // Change password
  Future<ApiResponse<bool>> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    return await updateProfile(
      currentPassword: currentPassword,
      newPassword: newPassword,
    ).then((response) => ApiResponse<bool>(
      success: response.success,
      message: response.message,
      data: response.success,
      timestamp: response.timestamp,
    ));
  }

  // Validate token with server
  Future<bool> _validateToken() async {
    if (_authToken == null) return false;

    try {
      final response = await _apiService.get('/user/profile.php');
      
      if (response.isSuccess && response.data != null) {
        _currentUser = User.fromJson(response.data);
        _isLoggedIn = true;
        await _storage.setUser(_currentUser!);
        notifyListeners();
        return true;
      } else {
        // Token is invalid
        await clearAuthData();
        return false;
      }
    } catch (e) {
      if (AppConfig.enableLogging) {
        debugPrint('Token validation error: $e');
      }
      await clearAuthData();
      return false;
    }
  }

  // Load cached authentication data
  Future<void> _loadCachedAuthData() async {
    _authToken = await _storage.getToken();
    _currentUser = await _storage.getUser();
    _isLoggedIn = _authToken != null && _currentUser != null;
    
    if (_isLoggedIn) {
      notifyListeners();
    }
  }

  // Set loading state
  void _setLoading(bool loading) {
    if (_isLoading != loading) {
      _isLoading = loading;
      notifyListeners();
    }
  }

  // Validate email format
  bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  // Validate password strength
  Map<String, dynamic> validatePassword(String password) {
    final result = {
      'isValid': false,
      'errors': <String>[],
      'strength': 'weak',
    };

    if (password.length < 6) {
      (result['errors'] as List<String>).add('Password must be at least 6 characters long');
    }

    if (!RegExp(r'^(?=.*[a-zA-Z])(?=.*\d)').hasMatch(password)) {
      (result['errors'] as List<String>).add('Password must contain at least one letter and one number');
    }

    if (password.length >= 8 && 
        RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])').hasMatch(password)) {
      result['strength'] = 'strong';
    } else if (password.length >= 6 && 
               RegExp(r'^(?=.*[a-zA-Z])(?=.*\d)').hasMatch(password)) {
      result['strength'] = 'medium';
    }

    result['isValid'] = (result['errors'] as List<String>).isEmpty;
    return result;
  }

  // Check if subscription is expiring soon
  bool isSubscriptionExpiringSoon({int days = 7}) {
    if (_currentUser?.subscriptionExpiry == null) return false;
    
    final expiryDate = DateTime.parse(_currentUser!.subscriptionExpiry!);
    final now = DateTime.now();
    final difference = expiryDate.difference(now).inDays;
    
    return difference <= days && difference >= 0;
  }

  // Get days until subscription expires
  int getDaysUntilExpiry() {
    if (_currentUser?.subscriptionExpiry == null) return 0;
    
    final expiryDate = DateTime.parse(_currentUser!.subscriptionExpiry!);
    final now = DateTime.now();
    final difference = expiryDate.difference(now).inDays;
    
    return difference > 0 ? difference : 0;
  }
}