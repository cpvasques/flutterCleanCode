import 'package:dio/io.dart';
import 'package:dio/dio.dart';
import 'package:flutter_clean_code/core/network/interceptors/auth_interceptor.dart';

import '/core/config/environment_config.dart';

late AuthInterceptor _authInterceptor;

class CustomDio extends DioForNative {
  CustomDio()
      : super(
          BaseOptions(
            baseUrl: EnvironmentConfig.apiUrl,
            connectTimeout: const Duration(seconds: 30),
            receiveTimeout: const Duration(seconds: 60),
          ),
        ) {
    interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
    );
  }

  CustomDio auth() {
    _authInterceptor = AuthInterceptor();
    if (interceptors
        .where((element) => element.runtimeType == AuthInterceptor)
        .isNotEmpty) {
      return this;
    }
    interceptors.add(_authInterceptor);
    return this;
  }

  CustomDio unauth() {
    clearIntercepetors();
    interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
    );
    return this;
  }

  clearIntercepetors() {
    interceptors.clear();
    return;
  }
}
