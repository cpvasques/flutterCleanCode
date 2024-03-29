import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_code/core/error/repository_exception.dart';
import 'package:flutter_clean_code/features/login/domain/usecases/login_usecase.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;

  LoginBloc({required this.loginUseCase}) : super(const LoginState()) {
    on<EmailChanged>((event, emit) => emit(state.copyWith(email: event.email)));
    on<PasswordChanged>(
        (event, emit) => emit(state.copyWith(password: event.password)));
    on<Submitted>(onSubmitted);
    on<ErrorDisplayed>((event, emit) => emit(state.copyWith(isError: false)));
  }

  Future<void> onSubmitted(Submitted event, Emitter<LoginState> emit) async {
    emit(state.copyWith(isLoading: true));

    try {
      await loginUseCase.execute(
        email: state.email,
        password: state.password,
      );

      emit(state.copyWith(isSuccess: true, isLoading: false));
    } on RepositoryException catch (e) {
      emit(
        state.copyWith(
          isError: true,
          isLoading: false,
          errorMessage: e.message,
        ),
      );
    }
  }
}
