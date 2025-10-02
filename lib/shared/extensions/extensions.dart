import 'package:flutter/material.dart';

// String Extensions
extension StringExtensions on String {
  // Capitalize first letter of each word
  String toTitleCase() {
    return split(' ')
        .map(
          (word) => word.isNotEmpty
              ? '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}'
              : '',
        )
        .join(' ');
  }

  // Check if string is valid email
  bool get isValidEmail {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(this);
  }

  // Check if string is valid phone number
  bool get isValidPhoneNumber {
    return RegExp(r'^\+?[\d\s\-\(\)]+$').hasMatch(this);
  }

  // Remove special characters
  String removeSpecialCharacters() {
    return replaceAll(RegExp(r'[^a-zA-Z0-9\s]'), '');
  }

  // Convert to slug
  String toSlug() {
    return toLowerCase()
        .replaceAll(RegExp(r'[^a-z0-9\s]'), '')
        .replaceAll(RegExp(r'\s+'), '-');
  }

  // Truncate string with ellipsis
  String truncate(int maxLength) {
    if (length <= maxLength) return this;
    return '${substring(0, maxLength)}...';
  }

  // Check if string is null or empty
  bool get isNullOrEmpty => isEmpty;

  // Check if string is not null and not empty
  bool get isNotNullAndNotEmpty => isNotEmpty;
}

// DateTime Extensions
extension DateTimeExtensions on DateTime {
  // Format as readable date
  String toReadableDate() {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inDays == 0) {
      return 'Today';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else {
      return '$day/$month/$year';
    }
  }

  // Format as readable time
  String toReadableTime() {
    final hour = this.hour.toString().padLeft(2, '0');
    final minute = this.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  // Check if date is today
  bool get isToday {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  // Check if date is yesterday
  bool get isYesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return year == yesterday.year &&
        month == yesterday.month &&
        day == yesterday.day;
  }

  // Get time ago string
  String get timeAgo {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inSeconds < 60) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} min ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hours ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else {
      return toReadableDate();
    }
  }
}

// Double Extensions
extension DoubleExtensions on double {
  // Format as currency
  String toCurrency({String symbol = '\$'}) {
    return '$symbol${toStringAsFixed(2)}';
  }

  // Format as percentage
  String toPercentage({int decimals = 1}) {
    return '${(this * 100).toStringAsFixed(decimals)}%';
  }

  // Round to specific decimal places
  double roundToDecimal(int decimals) {
    final factor = 1 / decimals;
    return (this * factor).round() / factor;
  }
}

// List Extensions
extension ListExtensions<T> on List<T> {
  // Get random element
  T? get randomElement {
    if (isEmpty) return null;
    final random = DateTime.now().millisecondsSinceEpoch % length;
    return this[random];
  }

  // Check if list is null or empty
  bool get isNullOrEmpty => isEmpty;

  // Check if list is not null and not empty
  bool get isNotNullAndNotEmpty => isNotEmpty;

  // Add item if not already present
  void addIfNotExists(T item) {
    if (!contains(item)) {
      add(item);
    }
  }

  // Remove nulls from list
  List<T> removeNulls() {
    return where((item) => item != null).toList();
  }
}

// BuildContext Extensions
extension BuildContextExtensions on BuildContext {
  // Theme shortcuts
  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => theme.colorScheme;
  TextTheme get textTheme => theme.textTheme;

  // MediaQuery shortcuts
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  Size get screenSize => mediaQuery.size;
  double get screenWidth => screenSize.width;
  double get screenHeight => screenSize.height;
  EdgeInsets get padding => mediaQuery.padding;
  bool get isKeyboardOpen => mediaQuery.viewInsets.bottom > 0;

  // Navigation shortcuts
  NavigatorState get navigator => Navigator.of(this);

  void pop([Object? result]) => navigator.pop(result);

  Future<T?> pushNamed<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) {
    return navigator.pushNamed<T>(routeName, arguments: arguments);
  }

  Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    Object? arguments,
    TO? result,
  }) {
    return navigator.pushReplacementNamed<T, TO>(
      routeName,
      arguments: arguments,
      result: result,
    );
  }

  Future<T?> pushNamedAndRemoveUntil<T extends Object?>(
    String newRouteName,
    bool Function(Route<dynamic>) predicate, {
    Object? arguments,
  }) {
    return navigator.pushNamedAndRemoveUntil<T>(
      newRouteName,
      predicate,
      arguments: arguments,
    );
  }

  // Show SnackBar
  void showSnackBar(
    String message, {
    Duration duration = const Duration(seconds: 3),
    Color? backgroundColor,
    Color? textColor,
    SnackBarAction? action,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message, style: TextStyle(color: textColor)),
        duration: duration,
        backgroundColor: backgroundColor,
        action: action,
      ),
    );
  }

  // Hide current SnackBar
  void hideSnackBar() {
    ScaffoldMessenger.of(this).hideCurrentSnackBar();
  }

  // Device type checks
  bool get isMobile => screenWidth < 768;
  bool get isTablet => screenWidth >= 768 && screenWidth < 1024;
  bool get isDesktop => screenWidth >= 1024;

  // Orientation checks
  bool get isPortrait => mediaQuery.orientation == Orientation.portrait;
  bool get isLandscape => mediaQuery.orientation == Orientation.landscape;

  // Dark mode check
  bool get isDarkMode => theme.brightness == Brightness.dark;
}
