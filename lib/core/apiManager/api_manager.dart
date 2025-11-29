import 'dart:convert';
import 'package:dio/dio.dart';
import '../handleErrors/exaption_handler.dart';
import '../handleErrors/result_pattern.dart';
import 'dio_client.dart';

class ApiService {

  static Future<dynamic> request({
    required String endpoint,
    String method = "GET",
    Map<String, dynamic>? queryParameters,
    dynamic data,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await DioClient.dio!.request(
        endpoint,
        data: data,
        queryParameters: queryParameters,

        options: Options(method: method,


        ),
      );

      final res = response.data;

      // لو الرجوع success = false
      if (res is Map && res["success"] == false) {
        final error =
            (res["errors"] != null
                ? res["errors"].values.first.first ?? res["message"]
                : "Unknown error");

        return Result.failure(error);
      }

      return res;

    } on DioException catch (e) {
      final exception = ExceptionHandler.handleDioException(e);
      final failure = ExceptionHandler.exceptionToFailure(exception);

      return Result.failure(failure.message);
    }
  }}