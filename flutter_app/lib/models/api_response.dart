import 'package:json_annotation/json_annotation.dart';
part 'api_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ApiResponse<T> {
  final bool success;
  final String message;
  final T? data;
  final String timestamp;
  final Map<String, dynamic>? pagination;
  final int? statusCode;
  final List<String>? errors;

  ApiResponse({
    required this.success,
    required this.message,
    this.data,
    required this.timestamp,
    this.pagination,
    this.statusCode,
    this.errors,
  });

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$ApiResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$ApiResponseToJson(this, toJsonT);

  // Success response
  factory ApiResponse.success({
    required String message,
    T? data,
    Map<String, dynamic>? pagination,
    int? statusCode,
  }) {
    return ApiResponse<T>(
      success: true,
      message: message,
      data: data,
      timestamp: DateTime.now().toIso8601String(),
      pagination: pagination,
      statusCode: statusCode,
    );
  }

  // Error response
  factory ApiResponse.error({
    required String message,
    List<String>? errors,
    int? statusCode,
  }) {
    return ApiResponse<T>(
      success: false,
      message: message,
      data: null,
      timestamp: DateTime.now().toIso8601String(),
      errors: errors,
      statusCode: statusCode,
    );
  }

  // Check if response is successful
  bool get isSuccess => success;

  // Check if response has data
  bool get hasData => data != null;

  // Check if response has errors
  bool get hasErrors => errors != null && errors!.isNotEmpty;

  // Check if response has pagination
  bool get hasPagination => pagination != null;
}

@JsonSerializable()
class PaginationInfo {
  final int currentPage;
  final int totalPages;
  final int totalItems;
  final int itemsPerPage;
  final bool hasNextPage;
  final bool hasPreviousPage;

  PaginationInfo({
    required this.currentPage,
    required this.totalPages,
    required this.totalItems,
    required this.itemsPerPage,
    required this.hasNextPage,
    required this.hasPreviousPage,
  });

  factory PaginationInfo.fromJson(Map<String, dynamic> json) =>
      _$PaginationInfoFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationInfoToJson(this);
}