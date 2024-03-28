import 'package:flutter_clean_code/features/login/domain/entities/user.dart';

class LoginResponseModel {
  final String token;
  final User user;

  LoginResponseModel({required this.token, required this.user});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      token: json['token'],
      user: User(
        id: json['user']['id'],
        name: json['user']['name'],
        email: json['user']['email'],
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'user': {
        'id': user.id,
        'name': user.name,
        'email': user.email,
      },
    };
  }
}
