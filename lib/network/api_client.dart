import 'dart:developer';

import 'package:bloc_project/network/base_response.dart';
import 'package:bloc_project/utils/logger/api_logger.dart';
import 'package:dio/dio.dart';

class ApiClient {
  static final ApiClient _apiClient = ApiClient._internal();

  factory ApiClient() {
    return _apiClient;
  }

  ApiClient._internal();

  late Dio _dio;

  Future<void> initializeClient() async {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.escuelajs.co/api/v1',
        connectTimeout: Duration(minutes: 1),
        responseType: ResponseType.json,
        contentType: 'application/json',
      ),
    );
    _dio.interceptors.add(
        ApiInterceptor(),
    );
  }

  Future<BaseResponse> get({
    required String path,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return BaseResponse.success(
          response.data,
        );
      } else {
        return BaseResponse.error(
          response.data,
          message: response.statusMessage ?? 'Something Went Wrong',
        );
      }
    } catch (e) {
      log('Api Error ${e.toString()}');
      return BaseResponse.error('Something Went Wrong');
    }
  }
}
