import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    const token = 'token';

    options.headers['token'] = token;

    handler.next(options);

    // Deixei comentado para exemplificar como ficaria uma lógica de token
    // armazenado no SharedPreferences;

    // final prefs = await SharedPreferences.getInstance();
    // final token = prefs.getString('token');
    // if (token != null) {
    //   options.headers['Authorization'] = 'Bearer $token';
    // }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();
    }

    handler.next(err);
  }
}
