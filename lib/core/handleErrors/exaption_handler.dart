import 'package:dio/dio.dart';

import 'app_exception.dart';
import 'error_model.dart';
import 'failures.dart';

class ExceptionHandler {
  /// Handle DioException and convert to appropriate exception
  ///
  /// معالجة DioException وتحويلها إلى AppException مناسبة
  /// يدعم أنواع الأخطاء التالية:
  /// - connectionTimeout: انتهاء مهلة الاتصال
  /// - sendTimeout: انتهاء مهلة الإرسال
  /// - receiveTimeout: انتهاء مهلة الاستقبال
  /// - connectionError: خطأ في الاتصال
  /// - cancel: إلغاء الطلب
  /// - badCertificate: خطأ في الشهادة
  /// - badResponse: خطأ في الاستجابة (4xx, 5xx)
  /// - unknown: خطأ غير معروف
  static AppException handleDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return NetworkException(
          message: 'Connection timeout. Please check your internet connection.',
          code: 'TIMEOUT',
          originalError: e,
        );

      case DioExceptionType.connectionError:
        return NetworkException(
          message:
          'No internet connection. Please check your network settings.',
          code: 'NO_CONNECTION',
          originalError: e,
        );

      case DioExceptionType.cancel:
        return NetworkException(
          message: 'Request was cancelled',
          code: 'CANCELLED',
          originalError: e,
        );

      case DioExceptionType.badCertificate:
        return NetworkException(
          message: 'Security certificate error',
          code: 'BAD_CERTIFICATE',
          originalError: e,
        );

      case DioExceptionType.badResponse:
        return _handleBadResponse(e);

      case DioExceptionType.unknown:
        return NetworkException(
          message: 'An unexpected error occurred: ${e.message}',
          code: 'UNKNOWN',
          originalError: e,
        );
    }
  }

  /// Handle bad response errors
  static AppException _handleBadResponse(DioException e) {
    final response = e.response;
    final statusCode = response?.statusCode;

    // Try to extract error from response data
    ErrorModel errorModel;
    try {
      errorModel = ErrorModel.fromJson(response?.data ?? {});
    } catch (_) {
      errorModel = ErrorModel(
        message: _getDefaultErrorMessage(statusCode),
        status: statusCode?.toString(),
      );
    }

    return ServerException(
      errorModel: errorModel,
      code: statusCode?.toString(),
      originalError: e,
    );
  }

  /// Get default error message based on status code
  static String _getDefaultErrorMessage(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'Bad request. Please check your input.';
      case 401:
        return 'Unauthorized. Please login again.';
      case 403:
        return 'Forbidden. You don\'t have permission to access this resource.';
      case 404:
        return 'Resource not found.';
      case 422:
        return 'Validation error. Please check your input.';
      case 500:
        return 'Internal server error. Please try again later.';
      case 502:
        return 'Bad gateway. Please try again later.';
      case 503:
        return 'Service unavailable. Please try again later.';
      default:
        return 'Server error ($statusCode). Please try again later.';
    }
  }

  /// Convert exception to failure
  static Failure exceptionToFailure(AppException exception) {
    if (exception is ServerException) {
      return ServerFailure(
        message: exception.errorModel?.userMessage ?? exception.message,
        errorModel: exception.errorModel,
        code: exception.code,
        originalError: exception.originalError,
      );
    }
    else if (exception is NetworkException) {
      return NetworkFailure(message: exception.message);
    } else if (exception is CacheException) {
      return CacheFailure(message: exception.message);
    } else if (exception is ValidationException) {
      return ValidationFailure(message: exception.message);
    } else {
      return UnknownFailure(message: exception.message);
    }
  }
}

/// Legacy function for backward compatibility
@Deprecated('Use ExceptionHandler.handleDioException instead')
void handelDioException(DioException e) {
  throw ExceptionHandler.handleDioException(e);
}
