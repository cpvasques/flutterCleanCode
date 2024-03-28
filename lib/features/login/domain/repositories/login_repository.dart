import 'package:flutter_clean_code/features/login/domain/entities/User.dart';

abstract class LoginRepository {
  Future<User> login(String email, String password);
}
