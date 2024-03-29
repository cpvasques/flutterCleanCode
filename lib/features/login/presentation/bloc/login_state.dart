import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final String email;
  final String password;
  final String errorMessage;
  final bool isSuccess;
  final bool isError;
  final bool isLoading;

  const LoginState({
    this.email = '',
    this.password = '',
    this.errorMessage = '',
    this.isSuccess = false,
    this.isError = false,
    this.isLoading = false,
  });

  LoginState copyWith({
    String? email,
    String? password,
    String? errorMessage,
    bool? isSuccess,
    bool? isError,
    bool? isLoading,
  }) {
    return LoginState(
        email: email ?? this.email,
        password: password ?? this.password,
        errorMessage: errorMessage ?? this.errorMessage,
        isSuccess: isSuccess ?? this.isSuccess,
        isError: isError ?? this.isError,
        isLoading: isLoading ?? this.isLoading);
  }

  @override
  List<Object> get props =>
      [email, password, errorMessage, isSuccess, isError, isLoading];
}
