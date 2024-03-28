import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_code/features/login/data/datasources/login_datasource.dart';
import 'package:flutter_clean_code/features/login/data/repositories/login_repository_impl.dart';
import 'package:flutter_clean_code/features/login/domain/usecases/login_usecase.dart';
import 'package:flutter_clean_code/features/login/presentation/bloc/login_bloc.dart';
import 'package:flutter_clean_code/features/login/presentation/bloc/login_event.dart';
import 'package:flutter_clean_code/features/login/presentation/bloc/login_state.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginDataSource = LoginDataSource();
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
              if (state.isSubmitting) {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) =>
                      const Center(child: CircularProgressIndicator()),
                );
              } else if (state.isSuccess) {
                Navigator.pop(context);
              } else if (state.isError) {
                Navigator.pop(
                  context,
                );
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                      const SnackBar(content: Text('Erro de login')));
              }
            },
            child: Column(
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
            ),
          ),
        ),
      ),
    );
  }
}
