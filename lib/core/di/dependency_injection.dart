import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../network/network_service.dart';

final GetIt getIt = GetIt.instance;

class DependencyInjection {
  static Future<void> init() async {
    // External Dependencies
    final sharedPreferences = await SharedPreferences.getInstance();
    getIt.registerLazySingleton(() => sharedPreferences);
    
    // Core Services
    getIt.registerLazySingleton(() => NetworkService());
    
    // Data Sources (to be added when implementing features)
    // getIt.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl());
    // getIt.registerLazySingleton<MenuRemoteDataSource>(() => MenuRemoteDataSourceImpl());
    // getIt.registerLazySingleton<CartLocalDataSource>(() => CartLocalDataSourceImpl());
    // getIt.registerLazySingleton<OrderRemoteDataSource>(() => OrderRemoteDataSourceImpl());
    // getIt.registerLazySingleton<AIRemoteDataSource>(() => AIRemoteDataSourceImpl());
    
    // Repositories (to be added when implementing features)
    // getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
    //   remoteDataSource: getIt(),
    //   localDataSource: getIt(),
    // ));
    // getIt.registerLazySingleton<MenuRepository>(() => MenuRepositoryImpl(
    //   remoteDataSource: getIt(),
    //   localDataSource: getIt(),
    // ));
    // getIt.registerLazySingleton<CartRepository>(() => CartRepositoryImpl(
    //   localDataSource: getIt(),
    // ));
    // getIt.registerLazySingleton<OrderRepository>(() => OrderRepositoryImpl(
    //   remoteDataSource: getIt(),
    //   localDataSource: getIt(),
    // ));
    // getIt.registerLazySingleton<AIRepository>(() => AIRepositoryImpl(
    //   remoteDataSource: getIt(),
    // ));
    
    // Use Cases (to be added when implementing features)
    // Authentication Use Cases
    // getIt.registerLazySingleton(() => LoginUseCase(getIt()));
    // getIt.registerLazySingleton(() => RegisterUseCase(getIt()));
    // getIt.registerLazySingleton(() => LogoutUseCase(getIt()));
    // getIt.registerLazySingleton(() => GetCurrentUserUseCase(getIt()));
    
    // Menu Use Cases
    // getIt.registerLazySingleton(() => GetMenuItemsUseCase(getIt()));
    // getIt.registerLazySingleton(() => GetMenuItemByIdUseCase(getIt()));
    // getIt.registerLazySingleton(() => SearchMenuItemsUseCase(getIt()));
    
    // Cart Use Cases
    // getIt.registerLazySingleton(() => AddToCartUseCase(getIt()));
    // getIt.registerLazySingleton(() => RemoveFromCartUseCase(getIt()));
    // getIt.registerLazySingleton(() => GetCartItemsUseCase(getIt()));
    // getIt.registerLazySingleton(() => ClearCartUseCase(getIt()));
    
    // Order Use Cases
    // getIt.registerLazySingleton(() => PlaceOrderUseCase(getIt()));
    // getIt.registerLazySingleton(() => GetOrdersUseCase(getIt()));
    // getIt.registerLazySingleton(() => GetOrderByIdUseCase(getIt()));
    
    // AI Use Cases
    // getIt.registerLazySingleton(() => GetAIRecommendationsUseCase(getIt()));
    // getIt.registerLazySingleton(() => AnalyzeDietaryNeedsUseCase(getIt()));
    
    // Blocs (to be added when implementing features)
    // getIt.registerFactory(() => AuthBloc(
    //   loginUseCase: getIt(),
    //   registerUseCase: getIt(),
    //   logoutUseCase: getIt(),
    //   getCurrentUserUseCase: getIt(),
    // ));
    // getIt.registerFactory(() => MenuBloc(
    //   getMenuItemsUseCase: getIt(),
    //   getMenuItemByIdUseCase: getIt(),
    //   searchMenuItemsUseCase: getIt(),
    // ));
    // getIt.registerFactory(() => CartBloc(
    //   addToCartUseCase: getIt(),
    //   removeFromCartUseCase: getIt(),
    //   getCartItemsUseCase: getIt(),
    //   clearCartUseCase: getIt(),
    // ));
    // getIt.registerFactory(() => OrderBloc(
    //   placeOrderUseCase: getIt(),
    //   getOrdersUseCase: getIt(),
    //   getOrderByIdUseCase: getIt(),
    // ));
    // getIt.registerFactory(() => AIBloc(
    //   getAIRecommendationsUseCase: getIt(),
    //   analyzeDietaryNeedsUseCase: getIt(),
    // ));
  }
}