import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../config/app_config.dart';
import '../models/api_response.dart';
import 'storage_service.dart';

class ApiService {
  static final ApiService _instance = ApiService._internal();
  factory ApiService() => _instance;
  ApiService._internal();

  late final Dio _dio;
  final StorageService _storage = StorageService();

  void initialize() {
    _dio = Dio(BaseOptions(
      baseUrl: AppConfig.apiUrl,
      connectTimeout: const Duration(seconds: AppConfig.apiTimeout),
      receiveTimeout: const Duration(seconds: AppConfig.apiTimeout),
      sendTimeout: const Duration(seconds: AppConfig.apiTimeout),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ));

    // Add interceptors
    _dio.interceptors.add(AuthInterceptor());
    _dio.interceptors.add(LoggingInterceptor());
    _dio.interceptors.add(ErrorInterceptor());
  }

  // Generic GET request
  Future<ApiResponse<T>> get<T>(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    T Function(dynamic)? fromJson,
  }) async {
    try {
      final response = await _dio.get(
        endpoint,
        queryParameters: queryParameters,
      );

      return _handleResponse<T>(response, fromJson);
    } catch (e) {
      return _handleError<T>(e);
    }
  }

  // Generic POST request
  Future<ApiResponse<T>> post<T>(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    T Function(dynamic)? fromJson,
  }) async {
    try {
      final response = await _dio.post(
        endpoint,
        data: data,
        queryParameters: queryParameters,
      );

      return _handleResponse<T>(response, fromJson);
    } catch (e) {
      return _handleError<T>(e);
    }
  }

  // Generic PUT request
  Future<ApiResponse<T>> put<T>(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    T Function(dynamic)? fromJson,
  }) async {
    try {
      final response = await _dio.put(
        endpoint,
        data: data,
        queryParameters: queryParameters,
      );

      return _handleResponse<T>(response, fromJson);
    } catch (e) {
      return _handleError<T>(e);
    }
  }

  // Generic DELETE request
  Future<ApiResponse<T>> delete<T>(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    T Function(dynamic)? fromJson,
  }) async {
    try {
      final response = await _dio.delete(
        endpoint,
        queryParameters: queryParameters,
      );

      return _handleResponse<T>(response, fromJson);
    } catch (e) {
      return _handleError<T>(e);
    }
  }

  // File upload request
  Future<ApiResponse<T>> uploadFile<T>(
    String endpoint, {
    required File file,
    Map<String, dynamic>? data,
    String fileFieldName = 'file',
    T Function(dynamic)? fromJson,
    ProgressCallback? onSendProgress,
  }) async {
    try {
      final fileName = file.path.split('/').last;
      final formData = FormData.fromMap({
        ...?data,
        fileFieldName: await MultipartFile.fromFile(
          file.path,
          filename: fileName,
        ),
      });

      final response = await _dio.post(
        endpoint,
        data: formData,
        onSendProgress: onSendProgress,
      );

      return _handleResponse<T>(response, fromJson);
    } catch (e) {
      return _handleError<T>(e);
    }
  }

  // Handle successful response
  ApiResponse<T> _handleResponse<T>(Response response, T Function(dynamic)? fromJson) {
    final responseData = response.data;
    
    if (responseData is Map<String, dynamic>) {
      T? data;
      if (fromJson != null && responseData['data'] != null) {
        data = fromJson(responseData['data']);
      }
      
      return ApiResponse<T>(
        success: responseData['success'] ?? true,
        message: responseData['message'] ?? 'Success',
        data: data ?? responseData['data'],
        timestamp: responseData['timestamp'] ?? DateTime.now().toIso8601String(),
        pagination: responseData['pagination'],
        statusCode: response.statusCode,
      );
    }

    return ApiResponse<T>(
      success: true,
      message: 'Success',
      data: responseData as T?,
      timestamp: DateTime.now().toIso8601String(),
      statusCode: response.statusCode,
    );
  }

  // Handle errors
  ApiResponse<T> _handleError<T>(dynamic error) {
    String message = 'An error occurred';
    int? statusCode;

    if (error is DioException) {
      statusCode = error.response?.statusCode;
      
      if (error.response?.data is Map<String, dynamic>) {
        final responseData = error.response!.data as Map<String, dynamic>;
        message = responseData['message'] ?? message;
      } else {
        switch (error.type) {
          case DioExceptionType.connectTimeout:
          case DioExceptionType.receiveTimeout:
          case DioExceptionType.sendTimeout:
            message = 'Request timeout. Please check your internet connection.';
            break;
          case DioExceptionType.badResponse:
            message = 'Server error occurred.';
            break;
          case DioExceptionType.cancel:
            message = 'Request cancelled.';
            break;
          case DioExceptionType.unknown:
            message = 'Network error. Please check your internet connection.';
            break;
          default:
            message = 'An unexpected error occurred.';
        }
      }
    }

    if (AppConfig.enableLogging) {
      debugPrint('API Error: $message (Status: $statusCode)');
    }

    return ApiResponse<T>(
      success: false,
      message: message,
      data: null,
      timestamp: DateTime.now().toIso8601String(),
      statusCode: statusCode,
    );
  }
}

// Auth Interceptor - Adds authorization token to requests
class AuthInterceptor extends Interceptor {
  final StorageService _storage = StorageService();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await _storage.getToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      // Token expired or invalid, clear stored auth data
      await _storage.clearAuthData();
      // You might want to redirect to login screen here
    }
    handler.next(err);
  }
}

// Logging Interceptor - Logs requests and responses in debug mode
class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (AppConfig.enableLogging) {
      debugPrint('🚀 REQUEST: ${options.method} ${options.path}');
      debugPrint('📝 Data: ${options.data}');
      debugPrint('🔍 Query: ${options.queryParameters}');
      debugPrint('📋 Headers: ${options.headers}');
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (AppConfig.enableLogging) {
      debugPrint('✅ RESPONSE: ${response.statusCode} ${response.requestOptions.path}');
      debugPrint('📄 Data: ${response.data}');
    }
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (AppConfig.enableLogging) {
      debugPrint('❌ ERROR: ${err.message}');
      debugPrint('📍 Path: ${err.requestOptions.path}');
      debugPrint('📊 Status: ${err.response?.statusCode}');
      debugPrint('📄 Data: ${err.response?.data}');
    }
    handler.next(err);
  }
}

// Error Interceptor - Handles common errors
class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Handle specific error cases
    switch (err.response?.statusCode) {
      case ApiStatusCodes.unauthorized:
        // Handle unauthorized access
        _handleUnauthorized();
        break;
      case ApiStatusCodes.forbidden:
        // Handle forbidden access
        _handleForbidden();
        break;
      case ApiStatusCodes.tooManyRequests:
        // Handle rate limiting
        _handleRateLimit();
        break;
      case ApiStatusCodes.internalServerError:
        // Handle server errors
        _handleServerError();
        break;
    }
    
    handler.next(err);
  }

  void _handleUnauthorized() {
    // Clear auth data and redirect to login
    StorageService().clearAuthData();
  }

  void _handleForbidden() {
    // Handle forbidden access (e.g., subscription expired)
  }

  void _handleRateLimit() {
    // Handle rate limiting
  }

  void _handleServerError() {
    // Handle server errors
  }
}

// Retry Interceptor - Retries failed requests
class RetryInterceptor extends Interceptor {
  final int maxRetries;
  final Duration delay;

  RetryInterceptor({
    this.maxRetries = AppConfig.maxRetries,
    this.delay = const Duration(seconds: 1),
  });

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (_shouldRetry(err) && err.requestOptions.extra['retries'] == null) {
      err.requestOptions.extra['retries'] = 0;
    }

    final retries = err.requestOptions.extra['retries'] ?? 0;
    
    if (retries < maxRetries && _shouldRetry(err)) {
      err.requestOptions.extra['retries'] = retries + 1;
      
      await Future.delayed(delay * (retries + 1)); // Exponential backoff
      
      try {
        final response = await Dio().fetch(err.requestOptions);
        handler.resolve(response);
      } catch (e) {
        handler.next(err);
      }
    } else {
      handler.next(err);
    }
  }

  bool _shouldRetry(DioException err) {
    return err.type == DioExceptionType.connectTimeout ||
           err.type == DioExceptionType.receiveTimeout ||
           err.type == DioExceptionType.sendTimeout ||
           err.response?.statusCode == 500;
  }
}