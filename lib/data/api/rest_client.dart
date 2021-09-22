import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

typedef ApiErrorCallback = Function(
    DioError e, ErrorInterceptorHandler handler);

class RestClient {
  static const TIMEOUT = 20000;

  Map<String, dynamic> _headers = {};
  late Dio dio;

  void init({required String baseApiUrl, ApiErrorCallback? errorCallback}) {
    dio = Dio(BaseOptions(
      baseUrl: baseApiUrl,
      connectTimeout: TIMEOUT,
      receiveTimeout: TIMEOUT,
      headers: _headers,
      responseType: ResponseType.json,
    ));
    dio.httpClientAdapter = DefaultHttpClientAdapter();
    if (!kReleaseMode) {
      dio.interceptors.add(LogInterceptor(
        requestBody: true,
        responseBody: true,
      ));
    }
    dio.interceptors.add(
      InterceptorsWrapper(
        onError: (dioError, handler) {
          if (errorCallback != null) {
            errorCallback(dioError, handler);
          } else {
            handler.next(dioError);
          }
        },
      ),
    );
  }
}
