import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_clean_code/core/error/repository_exception.dart';
import 'package:flutter_clean_code/core/network/api_client.dart';

import '../models/login_model.dart';

class LoginDataSource {
  final CustomDio dio;

  LoginDataSource({required this.dio});

  Future<LoginResponseModel> authenticate(String email, String password) async {
    final payload = {'email': email, 'password': password};

    try {
      final response = await dio.unauth().post(
            'auth/login',
            data: jsonEncode(payload),
          );

      if (response.statusCode == 200) {
        return LoginResponseModel.fromJson(json.decode(response.data));
      } else {
        throw Exception('Failed to login');
      }
    } on DioException catch (e) {
      throw RepositoryException.fromDioError(e);
    }
  }
}
