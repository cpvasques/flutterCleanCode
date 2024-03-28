import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/login_model.dart';

class LoginDataSource {
  Future<LoginResponseModel> authenticate(String email, String password) async {
    final response = await http.post(
      Uri.parse('https://your-api-url.com/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      return LoginResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to login');
    }
  }
}
