import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_clean_code/core/network/interceptors/auth_interceptor.dart';

import '/core/config/env_config.dart';

@lazySingleton
class CustomDio {
  late Dio _dio;
  late AuthInterceptor _authInterceptor;

  CustomDio() {
    _dio = Dio(
      BaseOptions(
        baseUrl: EnvConfig.apiUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 60),
      ),
    );
    _dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
    );
  }

  Dio auth() {
    _authInterceptor = AuthInterceptor();
    if (_dio.interceptors
        .where((element) => element.runtimeType == AuthInterceptor)
        .isEmpty) {
      _dio.interceptors.add(_authInterceptor);
    }
    return _dio;
  }

  Dio unauth() {
    clearInterceptors();
    _dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
    );
    return _dio;
  }

  void clearInterceptors() {
    _dio.interceptors.clear();
  }

  Dio get dio => _dio;
}
