# AI Food Ordering App

A Flutter application for AI-powered food ordering with step-by-step recommendations and personalized suggestions.

## 🏗️ Project Structure

This project follows **Clean Architecture** principles with a feature-based folder structure:

```
lib/
├── core/                          # Core functionality
│   ├── config/                    # App configuration
│   │   └── app_config.dart        # API keys, URLs, timeouts
│   ├── constants/                 # App constants
│   │   └── app_constants.dart     # UI constants, endpoints, messages
│   ├── di/                        # Dependency Injection
│   │   └── dependency_injection.dart
│   ├── errors/                    # Error handling
│   │   └── exceptions.dart        # Custom exceptions and failures
│   ├── network/                   # Network layer
│   │   └── network_service.dart   # HTTP client configuration
│   ├── routes/                    # App routing
│   │   └── app_router.dart        # GoRouter configuration
│   ├── theme/                     # App theming
│   │   └── app_theme.dart         # Light/Dark themes, colors
│   └── utils/                     # Utilities
│       └── app_utils.dart         # Helper functions
├── features/                      # Feature modules
│   ├── authentication/            # User authentication
│   │   ├── data/
│   │   │   ├── datasources/       # Remote/Local data sources
│   │   │   ├── models/            # Data models (JSON serialization)
│   │   │   └── repositories/      # Repository implementations
│   │   ├── domain/
│   │   │   ├── entities/          # Business entities
│   │   │   ├── repositories/      # Repository interfaces
│   │   │   └── usecases/          # Business logic
│   │   └── presentation/
│   │       ├── bloc/              # State management (BLoC)
│   │       ├── pages/             # UI screens
│   │       └── widgets/           # Feature-specific widgets
│   ├── menu/                      # Food menu & items
│   ├── cart/                      # Shopping cart
│   ├── orders/                    # Order management
│   ├── ai_recommendations/        # AI-powered recommendations
│   ├── user_profile/              # User profile & preferences
│   └── home/                      # Home dashboard
├── shared/                        # Shared components
│   ├── extensions/                # Dart extensions
│   │   └── extensions.dart        # String, DateTime, BuildContext extensions
│   ├── models/                    # Common data models
│   │   └── common_models.dart     # User, FoodItem, Order, etc.
│   ├── services/                  # Common services
│   │   └── common_services.dart   # Logger, Cache, Validation, etc.
│   └── widgets/                   # Reusable UI components
│       └── custom_widgets.dart    # Buttons, TextFields, Loading, etc.
└── main.dart                      # App entry point
```

## 🚀 Features

- **🔐 Authentication**: Email/Password, Google Sign-In
- **🍽️ Menu Management**: Browse food items with detailed information
- **🛒 Shopping Cart**: Add/remove items, customizations
- **📋 Order Tracking**: Real-time order status updates
- **🤖 AI Recommendations**: Personalized food suggestions
- **👤 User Profile**: Preferences, dietary restrictions, order history
- **🎨 Modern UI**: Material Design 3, Dark/Light themes
- **📱 Responsive**: Works on mobile, tablet, and desktop

## 🛠️ Technology Stack

- **Flutter**: UI framework
- **BLoC**: State management
- **GoRouter**: Navigation
- **Dio**: HTTP client
- **GetIt**: Dependency injection
- **Hive**: Local database
- **Firebase**: Authentication & backend
- **Material Design 3**: UI components

## 📦 Dependencies

### Production Dependencies
- `flutter_bloc`: State management
- `dio`: HTTP client
- `go_router`: Navigation
- `get_it`: Dependency injection
- `shared_preferences`: Local storage
- `hive`: NoSQL database
- `firebase_auth`: Authentication
- `cached_network_image`: Image caching
- `lottie`: Animations

### Development Dependencies
- `flutter_test`: Testing framework
- `build_runner`: Code generation
- `json_serializable`: JSON serialization
- `freezed`: Data classes

## 🎯 Getting Started

### Prerequisites
- Flutter SDK (3.9.0 or higher)
- Dart SDK
- Android Studio / VS Code
- Firebase project (for authentication)

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd ai_food_ordering
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure Firebase**
   - Create a Firebase project
   - Add your Android/iOS apps
   - Download `google-services.json` (Android) and `GoogleService-Info.plist` (iOS)
   - Place them in the appropriate directories

4. **Update configuration**
   - Edit `lib/core/config/app_config.dart`
   - Add your API keys and endpoints

5. **Run the app**
   ```bash
   flutter run
   ```

## 🏭 Building for Production

```bash
# Android
flutter build apk --release
flutter build appbundle --release

# iOS
flutter build ios --release

# Web
flutter build web --release
```

## 🧪 Testing

```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage

# Run integration tests
flutter drive --target=test_driver/app.dart
```

## 📁 Code Generation

When you add new models or modify existing ones:

```bash
# Generate code for JSON serialization, freezed classes, etc.
flutter packages pub run build_runner build

# Watch for changes and auto-generate
flutter packages pub run build_runner watch
```

## 🎨 UI/UX Guidelines

- Follow Material Design 3 principles
- Use predefined colors from `AppColors`
- Implement consistent spacing using `AppConstants`
- Ensure accessibility compliance
- Support both light and dark themes

## 🔧 Configuration

### Environment Variables
Set these in your `lib/core/config/app_config.dart`:

```dart
static const String baseUrl = 'YOUR_API_BASE_URL';
static const String openAiApiKey = 'YOUR_OPENAI_API_KEY';
static const String firebaseProjectId = 'YOUR_FIREBASE_PROJECT_ID';
```

### Feature Flags
Enable/disable features in `app_config.dart`:

```dart
static const bool enableAiRecommendations = true;
static const bool enablePushNotifications = true;
static const bool enableAnalytics = true;
```

## 📋 Development Workflow

1. **Create a new feature**:
   - Add feature folder under `lib/features/`
   - Implement data layer (models, repositories, data sources)
   - Implement domain layer (entities, use cases)
   - Implement presentation layer (BLoC, pages, widgets)
   - Register dependencies in `dependency_injection.dart`

2. **Add a new screen**:
   - Create page in appropriate feature's `pages/` folder
   - Add route in `app_router.dart`
   - Implement BLoC if needed

3. **Add shared components**:
   - Add to `lib/shared/widgets/`
   - Follow naming convention: `Custom*Widget`
   - Document usage in widget comments

## 🤝 Contributing

1. Follow the established folder structure
2. Use meaningful commit messages
3. Add tests for new features
4. Update documentation when needed
5. Follow Dart/Flutter best practices

## 📖 Additional Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [BLoC Pattern](https://bloclibrary.dev/)
- [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
- [Material Design 3](https://m3.material.io/)

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

---

**Happy Coding! 🚀**
