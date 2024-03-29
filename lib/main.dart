import 'package:flutter/material.dart';
import 'package:flutter_clean_code/core/config/environment_config.dart';
import 'routes/app_routes.dart';

void main() {
  EnvironmentConfig.setEnvironment(Environment.dev);
  runApp(const FlutterCleanCode());
}

class FlutterCleanCode extends StatelessWidget {
  const FlutterCleanCode({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterCleanCode',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppRoutes.loginPage,
      routes: AppRoutes.routes,
    );
  }
}
