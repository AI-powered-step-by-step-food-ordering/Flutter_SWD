// App Constants
class AppConstants {
  // UI Constants
  static const double defaultPadding = 16.0;
  static const double smallPadding = 8.0;
  static const double largePadding = 24.0;
  static const double borderRadius = 12.0;
  static const double smallBorderRadius = 8.0;
  static const double largeBorderRadius = 16.0;
  
  // Animation Durations
  static const Duration shortAnimationDuration = Duration(milliseconds: 200);
  static const Duration mediumAnimationDuration = Duration(milliseconds: 300);
  static const Duration longAnimationDuration = Duration(milliseconds: 500);
  
  // Image Paths
  static const String logoPath = 'assets/images/logo.png';
  static const String placeholderImagePath = 'assets/images/placeholder.png';
  static const String emptyCartPath = 'assets/animations/empty_cart.json';
  static const String loadingPath = 'assets/animations/loading.json';
  
  // API Endpoints
  static const String loginEndpoint = '/auth/login';
  static const String registerEndpoint = '/auth/register';
  static const String menuEndpoint = '/menu';
  static const String ordersEndpoint = '/orders';
  static const String userProfileEndpoint = '/user/profile';
  static const String aiRecommendationsEndpoint = '/ai/recommendations';
  
  // Error Messages
  static const String genericErrorMessage = 'Something went wrong. Please try again.';
  static const String networkErrorMessage = 'No internet connection. Please check your network.';
  static const String timeoutErrorMessage = 'Request timeout. Please try again.';
  static const String unauthorizedErrorMessage = 'Unauthorized access. Please login again.';
  
  // Success Messages
  static const String loginSuccessMessage = 'Login successful!';
  static const String orderPlacedSuccessMessage = 'Order placed successfully!';
  static const String profileUpdatedSuccessMessage = 'Profile updated successfully!';
  
  // Validation
  static const int minPasswordLength = 6;
  static const int maxNameLength = 50;
  static const int maxAddressLength = 200;
  
  // Pagination
  static const int defaultPageSize = 20;
  static const int maxPageSize = 50;
  
  // AI Prompts
  static const String aiRecommendationPrompt = 
      "Based on the user's order history and preferences, recommend 3 food items that they might enjoy.";
  static const String aiDietaryPrompt = 
      "Analyze the nutritional content of this meal and provide dietary recommendations.";
}