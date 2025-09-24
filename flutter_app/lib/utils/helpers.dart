import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'constants.dart';

class AppHelpers {
  // Date Formatting
  static String formatDate(DateTime date) {
    return DateFormat('MMM dd, yyyy').format(date);
  }

  static String formatTime(DateTime time) {
    return DateFormat('HH:mm').format(time);
  }

  static String formatDateTime(DateTime dateTime) {
    return DateFormat('MMM dd, yyyy HH:mm').format(dateTime);
  }

  static String formatRelativeTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 7) {
      return formatDate(dateTime);
    } else if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }

  // String Utilities
  static String capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }

  static String formatFileSize(int bytes) {
    if (bytes <= 0) return '0 B';
    const suffixes = ['B', 'KB', 'MB', 'GB', 'TB'];
    final i = (log(bytes) / log(1024)).floor();
    return '${(bytes / pow(1024, i)).toStringAsFixed(2)} ${suffixes[i]}';
  }

  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) return text;
    return '${text.substring(0, maxLength)}...';
  }

  static String generateRandomString(int length) {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final random = Random();
    return String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => chars.codeUnitAt(random.nextInt(chars.length)),
      ),
    );
  }

  // Color Utilities
  static Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'success':
      case 'completed':
      case 'active':
        return AppConstants.successColor;
      case 'pending':
      case 'in_progress':
        return AppConstants.warningColor;
      case 'error':
      case 'failed':
      case 'cancelled':
        return AppConstants.errorColor;
      default:
        return Colors.grey;
    }
  }

  static Color getPriorityColor(String priority) {
    switch (priority.toLowerCase()) {
      case 'high':
      case 'urgent':
        return Colors.red;
      case 'medium':
        return Colors.orange;
      case 'low':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  // Validation Utilities
  static bool isValidEmail(String email) {
    return AppConstants.emailRegex.hasMatch(email);
  }

  static bool isValidPhone(String phone) {
    return AppConstants.phoneRegex.hasMatch(phone);
  }

  static bool isValidPassword(String password) {
    return AppConstants.passwordRegex.hasMatch(password);
  }

  // File Utilities
  static String getFileExtension(String fileName) {
    return fileName.split('.').last.toLowerCase();
  }

  static bool isImageFile(String fileName) {
    final extension = getFileExtension(fileName);
    return ['jpg', 'jpeg', 'png', 'gif', 'webp'].contains(extension);
  }

  static bool isVideoFile(String fileName) {
    final extension = getFileExtension(fileName);
    return ['mp4', 'avi', 'mov', 'wmv', 'flv', 'webm'].contains(extension);
  }

  static bool isAudioFile(String fileName) {
    final extension = getFileExtension(fileName);
    return ['mp3', 'wav', 'flac', 'aac', 'ogg', 'm4a'].contains(extension);
  }

  static bool isDocumentFile(String fileName) {
    final extension = getFileExtension(fileName);
    return ['pdf', 'doc', 'docx', 'txt', 'rtf', 'xls', 'xlsx', 'ppt', 'pptx']
        .contains(extension);
  }

  // UI Utilities
  static void showSnackBar(BuildContext context, String message, {
    SnackBarType type = SnackBarType.info,
    Duration duration = const Duration(seconds: 3),
  }) {
    Color backgroundColor;
    IconData icon;

    switch (type) {
      case SnackBarType.success:
        backgroundColor = AppConstants.successColor;
        icon = Icons.check_circle;
        break;
      case SnackBarType.warning:
        backgroundColor = AppConstants.warningColor;
        icon = Icons.warning;
        break;
      case SnackBarType.error:
        backgroundColor = AppConstants.errorColor;
        icon = Icons.error;
        break;
      case SnackBarType.info:
      default:
        backgroundColor = AppConstants.primaryColor;
        icon = Icons.info;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: AppConstants.paddingSmall),
            Expanded(child: Text(message)),
          ],
        ),
        backgroundColor: backgroundColor,
        duration: duration,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
        ),
      ),
    );
  }

  static Future<bool> showConfirmDialog(
    BuildContext context,
    String title,
    String message,
  ) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Confirm'),
          ),
        ],
      ),
    );
    return result ?? false;
  }

  static void showLoadingDialog(BuildContext context, {String? message}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(),
            if (message != null) ...[
              const SizedBox(height: AppConstants.paddingMedium),
              Text(message),
            ],
          ],
        ),
      ),
    );
  }

  static void hideLoadingDialog(BuildContext context) {
    Navigator.of(context).pop();
  }

  // Network Utilities
  static bool isNetworkError(dynamic error) {
    return error is SocketException ||
           error.toString().contains('Network is unreachable') ||
           error.toString().contains('Failed host lookup');
  }

  // Platform Utilities
  static bool get isMobile => Platform.isAndroid || Platform.isIOS;
  static bool get isDesktop => Platform.isWindows || Platform.isMacOS || Platform.isLinux;
  static bool get isAndroid => Platform.isAndroid;
  static bool get isIOS => Platform.isIOS;

  // Math Utilities
  static double calculatePercentage(num value, num total) {
    if (total == 0) return 0;
    return (value / total) * 100;
  }

  static num roundToDecimalPlaces(num value, int decimalPlaces) {
    final factor = pow(10, decimalPlaces);
    return (value * factor).round() / factor;
  }

  // List Utilities
  static List<T> removeDuplicates<T>(List<T> list) {
    return list.toSet().toList();
  }

  static List<List<T>> chunk<T>(List<T> list, int chunkSize) {
    final chunks = <List<T>>[];
    for (int i = 0; i < list.length; i += chunkSize) {
      chunks.add(list.sublist(i, min(i + chunkSize, list.length)));
    }
    return chunks;
  }
}

// Extension methods
extension StringExtension on String {
  bool get isValidEmail => AppHelpers.isValidEmail(this);
  bool get isValidPhone => AppHelpers.isValidPhone(this);
  bool get isValidPassword => AppHelpers.isValidPassword(this);
  String get capitalize => AppHelpers.capitalize(this);
  String truncate(int maxLength) => AppHelpers.truncateText(this, maxLength);
}

extension DateTimeExtension on DateTime {
  String get formatted => AppHelpers.formatDate(this);
  String get timeFormatted => AppHelpers.formatTime(this);
  String get dateTimeFormatted => AppHelpers.formatDateTime(this);
  String get relativeTime => AppHelpers.formatRelativeTime(this);
}

extension ListExtension<T> on List<T> {
  List<T> get removeDuplicates => AppHelpers.removeDuplicates(this);
  List<List<T>> chunk(int chunkSize) => AppHelpers.chunk(this, chunkSize);
}