// Base Response Model
class BaseResponse<T> {
  final bool success;
  final String? message;
  final T? data;
  final String? error;
  final int? statusCode;
  
  const BaseResponse({
    required this.success,
    this.message,
    this.data,
    this.error,
    this.statusCode,
  });
  
  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic)? fromJsonT,
  ) {
    return BaseResponse<T>(
      success: json['success'] ?? false,
      message: json['message'],
      data: json['data'] != null && fromJsonT != null 
          ? fromJsonT(json['data']) 
          : json['data'],
      error: json['error'],
      statusCode: json['statusCode'],
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': data,
      'error': error,
      'statusCode': statusCode,
    };
  }
}

// User Model
class User {
  final String id;
  final String email;
  final String name;
  final String? phone;
  final String? avatar;
  final DateTime createdAt;
  final DateTime updatedAt;
  final UserPreferences? preferences;
  
  const User({
    required this.id,
    required this.email,
    required this.name,
    this.phone,
    this.avatar,
    required this.createdAt,
    required this.updatedAt,
    this.preferences,
  });
  
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      phone: json['phone'],
      avatar: json['avatar'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      preferences: json['preferences'] != null 
          ? UserPreferences.fromJson(json['preferences'])
          : null,
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'phone': phone,
      'avatar': avatar,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'preferences': preferences?.toJson(),
    };
  }
  
  User copyWith({
    String? id,
    String? email,
    String? name,
    String? phone,
    String? avatar,
    DateTime? createdAt,
    DateTime? updatedAt,
    UserPreferences? preferences,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      avatar: avatar ?? this.avatar,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      preferences: preferences ?? this.preferences,
    );
  }
}

// User Preferences Model
class UserPreferences {
  final List<String> dietaryRestrictions;
  final List<String> allergies;
  final List<String> favoriteCategories;
  final String? preferredCuisine;
  final bool notifications;
  final bool darkMode;
  
  const UserPreferences({
    required this.dietaryRestrictions,
    required this.allergies,
    required this.favoriteCategories,
    this.preferredCuisine,
    required this.notifications,
    required this.darkMode,
  });
  
  factory UserPreferences.fromJson(Map<String, dynamic> json) {
    return UserPreferences(
      dietaryRestrictions: List<String>.from(json['dietaryRestrictions'] ?? []),
      allergies: List<String>.from(json['allergies'] ?? []),
      favoriteCategories: List<String>.from(json['favoriteCategories'] ?? []),
      preferredCuisine: json['preferredCuisine'],
      notifications: json['notifications'] ?? true,
      darkMode: json['darkMode'] ?? false,
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'dietaryRestrictions': dietaryRestrictions,
      'allergies': allergies,
      'favoriteCategories': favoriteCategories,
      'preferredCuisine': preferredCuisine,
      'notifications': notifications,
      'darkMode': darkMode,
    };
  }
}

// Food Item Model
class FoodItem {
  final String id;
  final String name;
  final String description;
  final double price;
  final String? image;
  final String category;
  final List<String> ingredients;
  final List<String> allergens;
  final NutritionalInfo? nutritionalInfo;
  final bool isVegetarian;
  final bool isVegan;
  final bool isGlutenFree;
  final double rating;
  final int reviewCount;
  final bool isAvailable;
  final int preparationTime; // in minutes
  
  const FoodItem({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    this.image,
    required this.category,
    required this.ingredients,
    required this.allergens,
    this.nutritionalInfo,
    required this.isVegetarian,
    required this.isVegan,
    required this.isGlutenFree,
    required this.rating,
    required this.reviewCount,
    required this.isAvailable,
    required this.preparationTime,
  });
  
  factory FoodItem.fromJson(Map<String, dynamic> json) {
    return FoodItem(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'].toDouble(),
      image: json['image'],
      category: json['category'],
      ingredients: List<String>.from(json['ingredients'] ?? []),
      allergens: List<String>.from(json['allergens'] ?? []),
      nutritionalInfo: json['nutritionalInfo'] != null 
          ? NutritionalInfo.fromJson(json['nutritionalInfo'])
          : null,
      isVegetarian: json['isVegetarian'] ?? false,
      isVegan: json['isVegan'] ?? false,
      isGlutenFree: json['isGlutenFree'] ?? false,
      rating: json['rating']?.toDouble() ?? 0.0,
      reviewCount: json['reviewCount'] ?? 0,
      isAvailable: json['isAvailable'] ?? true,
      preparationTime: json['preparationTime'] ?? 0,
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'image': image,
      'category': category,
      'ingredients': ingredients,
      'allergens': allergens,
      'nutritionalInfo': nutritionalInfo?.toJson(),
      'isVegetarian': isVegetarian,
      'isVegan': isVegan,
      'isGlutenFree': isGlutenFree,
      'rating': rating,
      'reviewCount': reviewCount,
      'isAvailable': isAvailable,
      'preparationTime': preparationTime,
    };
  }
}

// Nutritional Information Model
class NutritionalInfo {
  final int calories;
  final double protein; // in grams
  final double carbs; // in grams
  final double fat; // in grams
  final double fiber; // in grams
  final double sugar; // in grams
  final double sodium; // in mg
  
  const NutritionalInfo({
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fat,
    required this.fiber,
    required this.sugar,
    required this.sodium,
  });
  
  factory NutritionalInfo.fromJson(Map<String, dynamic> json) {
    return NutritionalInfo(
      calories: json['calories'] ?? 0,
      protein: json['protein']?.toDouble() ?? 0.0,
      carbs: json['carbs']?.toDouble() ?? 0.0,
      fat: json['fat']?.toDouble() ?? 0.0,
      fiber: json['fiber']?.toDouble() ?? 0.0,
      sugar: json['sugar']?.toDouble() ?? 0.0,
      sodium: json['sodium']?.toDouble() ?? 0.0,
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'calories': calories,
      'protein': protein,
      'carbs': carbs,
      'fat': fat,
      'fiber': fiber,
      'sugar': sugar,
      'sodium': sodium,
    };
  }
}

// Cart Item Model
class CartItem {
  final String id;
  final FoodItem foodItem;
  final int quantity;
  final List<String> customizations;
  final String? specialInstructions;
  final DateTime addedAt;
  
  const CartItem({
    required this.id,
    required this.foodItem,
    required this.quantity,
    required this.customizations,
    this.specialInstructions,
    required this.addedAt,
  });
  
  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'],
      foodItem: FoodItem.fromJson(json['foodItem']),
      quantity: json['quantity'],
      customizations: List<String>.from(json['customizations'] ?? []),
      specialInstructions: json['specialInstructions'],
      addedAt: DateTime.parse(json['addedAt']),
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'foodItem': foodItem.toJson(),
      'quantity': quantity,
      'customizations': customizations,
      'specialInstructions': specialInstructions,
      'addedAt': addedAt.toIso8601String(),
    };
  }
  
  double get totalPrice => foodItem.price * quantity;
  
  CartItem copyWith({
    String? id,
    FoodItem? foodItem,
    int? quantity,
    List<String>? customizations,
    String? specialInstructions,
    DateTime? addedAt,
  }) {
    return CartItem(
      id: id ?? this.id,
      foodItem: foodItem ?? this.foodItem,
      quantity: quantity ?? this.quantity,
      customizations: customizations ?? this.customizations,
      specialInstructions: specialInstructions ?? this.specialInstructions,
      addedAt: addedAt ?? this.addedAt,
    );
  }
}

// Order Model
class Order {
  final String id;
  final String userId;
  final List<CartItem> items;
  final double subtotal;
  final double tax;
  final double deliveryFee;
  final double total;
  final OrderStatus status;
  final String? deliveryAddress;
  final DateTime orderTime;
  final DateTime? estimatedDeliveryTime;
  final DateTime? actualDeliveryTime;
  final String? paymentMethod;
  final String? specialInstructions;
  
  const Order({
    required this.id,
    required this.userId,
    required this.items,
    required this.subtotal,
    required this.tax,
    required this.deliveryFee,
    required this.total,
    required this.status,
    this.deliveryAddress,
    required this.orderTime,
    this.estimatedDeliveryTime,
    this.actualDeliveryTime,
    this.paymentMethod,
    this.specialInstructions,
  });
  
  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      userId: json['userId'],
      items: (json['items'] as List)
          .map((item) => CartItem.fromJson(item))
          .toList(),
      subtotal: json['subtotal'].toDouble(),
      tax: json['tax'].toDouble(),
      deliveryFee: json['deliveryFee'].toDouble(),
      total: json['total'].toDouble(),
      status: OrderStatus.values.firstWhere(
        (e) => e.toString().split('.').last == json['status'],
        orElse: () => OrderStatus.pending,
      ),
      deliveryAddress: json['deliveryAddress'],
      orderTime: DateTime.parse(json['orderTime']),
      estimatedDeliveryTime: json['estimatedDeliveryTime'] != null
          ? DateTime.parse(json['estimatedDeliveryTime'])
          : null,
      actualDeliveryTime: json['actualDeliveryTime'] != null
          ? DateTime.parse(json['actualDeliveryTime'])
          : null,
      paymentMethod: json['paymentMethod'],
      specialInstructions: json['specialInstructions'],
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'items': items.map((item) => item.toJson()).toList(),
      'subtotal': subtotal,
      'tax': tax,
      'deliveryFee': deliveryFee,
      'total': total,
      'status': status.toString().split('.').last,
      'deliveryAddress': deliveryAddress,
      'orderTime': orderTime.toIso8601String(),
      'estimatedDeliveryTime': estimatedDeliveryTime?.toIso8601String(),
      'actualDeliveryTime': actualDeliveryTime?.toIso8601String(),
      'paymentMethod': paymentMethod,
      'specialInstructions': specialInstructions,
    };
  }
}

// Order Status Enum
enum OrderStatus {
  pending,
  confirmed,
  preparing,
  ready,
  outForDelivery,
  delivered,
  cancelled,
}

// AI Recommendation Model
class AIRecommendation {
  final String id;
  final FoodItem foodItem;
  final double confidenceScore;
  final String reason;
  final DateTime generatedAt;
  
  const AIRecommendation({
    required this.id,
    required this.foodItem,
    required this.confidenceScore,
    required this.reason,
    required this.generatedAt,
  });
  
  factory AIRecommendation.fromJson(Map<String, dynamic> json) {
    return AIRecommendation(
      id: json['id'],
      foodItem: FoodItem.fromJson(json['foodItem']),
      confidenceScore: json['confidenceScore'].toDouble(),
      reason: json['reason'],
      generatedAt: DateTime.parse(json['generatedAt']),
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'foodItem': foodItem.toJson(),
      'confidenceScore': confidenceScore,
      'reason': reason,
      'generatedAt': generatedAt.toIso8601String(),
    };
  }
}