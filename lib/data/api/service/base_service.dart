import 'package:dio/dio.dart' as dio;
import 'package:liquid_demo/data/api/exception/api_exception.dart';
import 'package:liquid_demo/di/locator.dart';

import '../rest_client.dart';

abstract class BaseService {
  final _restClient = locator<RestClient>();

  Future<dynamic> get(String path, {Map<String, dynamic>? params}) async {
    final response = await _restClient.dio.get(path, queryParameters: params);
    return _handleResponse(response);
  }

  Future<dynamic> post(String path, {Map<String, dynamic>? data}) async {
    final response = await _restClient.dio.post(path, data: data);
    return _handleResponse(response);
  }

  dynamic _handleResponse(dio.Response response) {
    if (response.statusCode != 200) {
      throw ApiException(statusCode: response.statusCode);
    }
    return response.data;
  }
}
