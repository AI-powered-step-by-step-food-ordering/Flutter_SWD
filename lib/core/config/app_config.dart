// App Configuration
class AppConfig {
  static const String appName = 'AI Food Ordering';
  static const String appVersion = '1.0.0';
  
  // API Configuration
  static const String baseUrl = 'https://api.example.com';
  static const String aiApiUrl = 'https://ai-api.example.com';
  
  // Timeouts
  static const int connectionTimeout = 30000;
  static const int receiveTimeout = 30000;
  
  // Storage Keys
  static const String userTokenKey = 'user_token';
  static const String userDataKey = 'user_data';
  static const String cartDataKey = 'cart_data';
  static const String preferencesKey = 'user_preferences';
  
  // AI Configuration
  static const String openAiApiKey = 'your_openai_api_key';
  static const String aiModel = 'gpt-3.5-turbo';
  
  // Firebase Configuration
  static const String firebaseProjectId = 'your_firebase_project_id';
  
  // Feature Flags
  static const bool enableAiRecommendations = true;
  static const bool enablePushNotifications = true;
  static const bool enableAnalytics = true;
}