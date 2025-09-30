import 'package:dio/dio.dart';
import '../config/app_config.dart';
import '../constants/app_constants.dart';

class NetworkService {
  static final NetworkService _instance = NetworkService._internal();
  late Dio _dio;
  
  factory NetworkService() => _instance;
  
  NetworkService._internal() {
    _dio = Dio();
    _setupInterceptors();
  }
  
  void _setupInterceptors() {
    _dio.options = BaseOptions(
      baseUrl: AppConfig.baseUrl,
      connectTimeout: Duration(milliseconds: AppConfig.connectionTimeout),
      receiveTimeout: Duration(milliseconds: AppConfig.receiveTimeout),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
    
    // Request Interceptor
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // Add auth token if available
        // final token = getIt<SharedPreferences>().getString(AppConfig.userTokenKey);
        // if (token != null) {
        //   options.headers['Authorization'] = 'Bearer $token';
        // }
        handler.next(options);
      },
      onResponse: (response, handler) {
        handler.next(response);
      },
      onError: (error, handler) {
        _handleError(error);
        handler.next(error);
      },
    ));
    
    // Logging Interceptor (only in debug mode)
    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
      requestHeader: true,
      responseHeader: false,
    ));
  }
  
  void _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw Exception(AppConstants.timeoutErrorMessage);
      case DioExceptionType.connectionError:
        throw Exception(AppConstants.networkErrorMessage);
      case DioExceptionType.badResponse:
        _handleHttpError(error);
        break;
      default:
        throw Exception(AppConstants.genericErrorMessage);
    }
  }
  
  void _handleHttpError(DioException error) {
    final statusCode = error.response?.statusCode;
    switch (statusCode) {
      case 401:
        throw Exception(AppConstants.unauthorizedErrorMessage);
      case 404:
        throw Exception('Resource not found');
      case 500:
        throw Exception('Internal server error');
      default:
        throw Exception(AppConstants.genericErrorMessage);
    }
  }
  
  // HTTP Methods
  Future<Response> get(String path, {Map<String, dynamic>? queryParameters}) {
    return _dio.get(path, queryParameters: queryParameters);
  }
  
  Future<Response> post(String path, {dynamic data, Map<String, dynamic>? queryParameters}) {
    return _dio.post(path, data: data, queryParameters: queryParameters);
  }
  
  Future<Response> put(String path, {dynamic data, Map<String, dynamic>? queryParameters}) {
    return _dio.put(path, data: data, queryParameters: queryParameters);
  }
  
  Future<Response> delete(String path, {Map<String, dynamic>? queryParameters}) {
    return _dio.delete(path, queryParameters: queryParameters);
  }
  
  Future<Response> patch(String path, {dynamic data, Map<String, dynamic>? queryParameters}) {
    return _dio.patch(path, data: data, queryParameters: queryParameters);
  }
}