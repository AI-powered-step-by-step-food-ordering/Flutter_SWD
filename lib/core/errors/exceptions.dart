// Custom Exception Classes
abstract class AppException implements Exception {
  final String message;
  final String? code;
  
  const AppException(this.message, [this.code]);
  
  @override
  String toString() => message;
}

class NetworkException extends AppException {
  const NetworkException(super.message, [super.code]);
}

class ServerException extends AppException {
  const ServerException(super.message, [super.code]);
}

class CacheException extends AppException {
  const CacheException(super.message, [super.code]);
}

class AuthException extends AppException {
  const AuthException(super.message, [super.code]);
}

class ValidationException extends AppException {
  const ValidationException(super.message, [super.code]);
}

class AIException extends AppException {
  const AIException(super.message, [super.code]);
}

// Failure Classes
abstract class Failure {
  final String message;
  final String? code;
  
  const Failure(this.message, [this.code]);
  
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Failure && runtimeType == other.runtimeType && message == other.message;
  
  @override
  int get hashCode => message.hashCode;
}

class NetworkFailure extends Failure {
  const NetworkFailure(super.message, [super.code]);
}

class ServerFailure extends Failure {
  const ServerFailure(super.message, [super.code]);
}

class CacheFailure extends Failure {
  const CacheFailure(super.message, [super.code]);
}

class AuthFailure extends Failure {
  const AuthFailure(super.message, [super.code]);
}

class ValidationFailure extends Failure {
  const ValidationFailure(super.message, [super.code]);
}

class AIFailure extends Failure {
  const AIFailure(super.message, [super.code]);
}