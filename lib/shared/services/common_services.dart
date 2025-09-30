import 'package:flutter/foundation.dart';

// Logger Service
class LoggerService {
  static const String _tag = 'AI_FOOD_ORDERING';
  
  static void debug(String message, [String? tag]) {
    if (kDebugMode) {
      print('🐛 ${tag ?? _tag}: $message');
    }
  }
  
  static void info(String message, [String? tag]) {
    if (kDebugMode) {
      print('ℹ️ ${tag ?? _tag}: $message');
    }
  }
  
  static void warning(String message, [String? tag]) {
    if (kDebugMode) {
      print('⚠️ ${tag ?? _tag}: $message');
    }
  }
  
  static void error(String message, [String? tag, Object? error]) {
    if (kDebugMode) {
      print('❌ ${tag ?? _tag}: $message');
      if (error != null) {
        print('Error details: $error');
      }
    }
  }
  
  static void success(String message, [String? tag]) {
    if (kDebugMode) {
      print('✅ ${tag ?? _tag}: $message');
    }
  }
  
  static void api(String method, String url, {Map<String, dynamic>? data}) {
    if (kDebugMode) {
      print('🌐 API: $method $url');
      if (data != null) {
        print('Data: $data');
      }
    }
  }
  
  static void navigation(String route, [Map<String, dynamic>? arguments]) {
    if (kDebugMode) {
      print('🧭 Navigation: $route');
      if (arguments != null) {
        print('Arguments: $arguments');
      }
    }
  }
}

// Cache Service (basic implementation)
class CacheService {
  static final Map<String, dynamic> _cache = {};
  
  static void put(String key, dynamic value) {
    _cache[key] = value;
    LoggerService.debug('Cache PUT: $key');
  }
  
  static T? get<T>(String key) {
    final value = _cache[key] as T?;
    LoggerService.debug('Cache GET: $key ${value != null ? '(HIT)' : '(MISS)'}');
    return value;
  }
  
  static void remove(String key) {
    _cache.remove(key);
    LoggerService.debug('Cache REMOVE: $key');
  }
  
  static void clear() {
    _cache.clear();
    LoggerService.debug('Cache CLEAR: All items removed');
  }
  
  static bool containsKey(String key) {
    return _cache.containsKey(key);
  }
  
  static int get size => _cache.length;
}

// Validation Service
class ValidationService {
  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email is required';
    }
    
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      return 'Please enter a valid email address';
    }
    
    return null;
  }
  
  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password is required';
    }
    
    if (password.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    
    return null;
  }
  
  static String? validateName(String? name) {
    if (name == null || name.isEmpty) {
      return 'Name is required';
    }
    
    if (name.length < 2) {
      return 'Name must be at least 2 characters long';
    }
    
    if (name.length > 50) {
      return 'Name must be less than 50 characters';
    }
    
    return null;
  }
  
  static String? validatePhone(String? phone) {
    if (phone == null || phone.isEmpty) {
      return 'Phone number is required';
    }
    
    if (!RegExp(r'^\+?[\d\s\-\(\)]+$').hasMatch(phone)) {
      return 'Please enter a valid phone number';
    }
    
    return null;
  }
  
  static String? validateRequired(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }
  
  static String? validateMinLength(String? value, int minLength, String fieldName) {
    if (value == null || value.length < minLength) {
      return '$fieldName must be at least $minLength characters long';
    }
    return null;
  }
  
  static String? validateMaxLength(String? value, int maxLength, String fieldName) {
    if (value != null && value.length > maxLength) {
      return '$fieldName must be less than $maxLength characters';
    }
    return null;
  }
  
  static String? validateNumeric(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    
    if (double.tryParse(value) == null) {
      return '$fieldName must be a valid number';
    }
    
    return null;
  }
}

// Image Service (basic implementation)
class ImageService {
  static String getPlaceholderImage(int width, int height) {
    return 'https://via.placeholder.com/${width}x$height';
  }
  
  static String getFoodImagePlaceholder() {
    return 'assets/images/food_placeholder.png';
  }
  
  static String getUserAvatarPlaceholder() {
    return 'assets/images/avatar_placeholder.png';
  }
  
  static bool isValidImageUrl(String? url) {
    if (url == null || url.isEmpty) return false;
    
    final validExtensions = ['jpg', 'jpeg', 'png', 'gif', 'bmp', 'webp'];
    final extension = url.split('.').last.toLowerCase();
    
    return validExtensions.contains(extension) || url.startsWith('http');
  }
  
  static String getImageUrl(String? imageUrl) {
    if (isValidImageUrl(imageUrl)) {
      return imageUrl!;
    }
    return getFoodImagePlaceholder();
  }
}

// Device Service
class DeviceService {
  static bool get isWeb => kIsWeb;
  
  static bool get isDebugMode => kDebugMode;
  
  static bool get isReleaseMode => kReleaseMode;
  
  static bool get isProfileMode => kProfileMode;
  
  static String get deviceType {
    if (kIsWeb) return 'Web';
    
    // Note: In a real app, you'd use a package like device_info_plus
    // to get actual device information
    return 'Mobile';
  }
  
  static void logDeviceInfo() {
    LoggerService.info('Device Type: $deviceType');
    LoggerService.info('Debug Mode: $isDebugMode');
    LoggerService.info('Web Platform: $isWeb');
  }
}