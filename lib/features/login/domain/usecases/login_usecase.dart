import 'package:flutter_clean_code/features/login/domain/entities/User.dart'
    as user;
import '../repositories/login_repository.dart';

class LoginUseCase {
  final LoginRepository repository;

  LoginUseCase(this.repository);

  Future<user.User> execute(
      {required String email, required String password}) async {
    return await repository.login(email, password);
  }
}
