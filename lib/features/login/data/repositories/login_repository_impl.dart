import 'package:flutter_clean_code/features/login/data/models/login_model.dart';
import 'package:flutter_clean_code/features/login/domain/entities/User.dart';
import 'package:flutter_clean_code/features/login/data/datasources/login_datasource.dart';
import 'package:flutter_clean_code/features/login/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDataSource dataSource;

  LoginRepositoryImpl(this.dataSource);

  @override
  Future<User> login(String email, String password) async {
    LoginResponseModel responseModel =
        await dataSource.authenticate(email, password);

    return User(
      id: responseModel.user.id,
      name: responseModel.user.name,
      email: responseModel.user.email,
    );
  }
}
