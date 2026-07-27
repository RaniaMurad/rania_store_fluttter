import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    Duration timeout = const Duration(minutes: 1);

    if (dio == null) {
      dio = Dio();

      dio!
        ..options.connectTimeout = timeout
        ..options.receiveTimeout = timeout
        ..options.sendTimeout = timeout;

      addDioHeaders();
      addInterceptor();
    }

    return dio!;
  }

  static void addDioHeaders() {
    dio!.options.headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      // 'Authorization': 'Bearer $token',
    };
  }

  static void addInterceptor() {
    dio!.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
      ),
    );
  }
}
