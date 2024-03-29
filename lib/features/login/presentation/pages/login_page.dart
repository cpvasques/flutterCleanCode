import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_code/core/network/api_client.dart';
import 'package:flutter_clean_code/core/presentation/base_state.dart';
import 'package:flutter_clean_code/features/login/data/datasources/login_datasource.dart';
import 'package:flutter_clean_code/features/login/data/repositories/login_repository_impl.dart';
import 'package:flutter_clean_code/features/login/domain/usecases/login_usecase.dart';
import 'package:flutter_clean_code/features/login/presentation/bloc/login_bloc.dart';
import 'package:flutter_clean_code/features/login/presentation/bloc/login_event.dart';
import 'package:flutter_clean_code/features/login/presentation/bloc/login_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends BaseState<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginDataSource = LoginDataSource(dio: CustomDio());
    final loginRepository = LoginRepositoryImpl(loginDataSource);
    final loginUseCase = LoginUseCase(loginRepository);

    return BlocProvider(
      create: (context) => LoginBloc(loginUseCase: loginUseCase),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state.isLoading) {
                showLoader();
              } else {
                hideLoader();
              }

              if (state.isError) {
                showError(message: state.errorMessage);
                BlocProvider.of<LoginBloc>(context).add(ErrorDisplayed());
              }
            },
            child: Builder(builder: (context) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (email) => BlocProvider.of<LoginBloc>(context)
                        .add(EmailChanged(email)),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Senha',
                    ),
                    obscureText: true,
                    onChanged: (password) => BlocProvider.of<LoginBloc>(context)
                        .add(PasswordChanged(password)),
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () =>
                        BlocProvider.of<LoginBloc>(context).add(Submitted()),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: const Text('Login'),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
