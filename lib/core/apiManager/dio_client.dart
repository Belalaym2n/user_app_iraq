import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:path_provider/path_provider.dart';

class DioClient {
  static PersistCookieJar? cookieJar;
  static Dio? dio;

  // لازم تنادي init() أول ما الاب يفتح
  static Future<void> init() async {
    Directory dir = await getApplicationDocumentsDirectory();

    cookieJar = PersistCookieJar(storage: FileStorage("${dir.path}/cookies"));

    dio =
        Dio(
            BaseOptions(
              baseUrl: "https://api.jeeteak.com/api/v1",
              connectTimeout: const Duration(seconds: 10),
              receiveTimeout: const Duration(seconds: 10),
              sendTimeout: const Duration(seconds: 10),
              headers: {
                "Accept": "application/json",
                "Content-Type": "application/json",
              },
            ),
          )
          ..interceptors.addAll([
            LogInterceptor(responseBody: true, requestBody: true),
            CookieManager(cookieJar!), // أهم حاجة هنا
          ]);

    (dio!.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      final client = HttpClient();
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }
}
