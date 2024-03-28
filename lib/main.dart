import 'package:flutter/material.dart';
import 'routes/app_routes.dart';

void main() {
  runApp(const FlutterCleanCode());
}

class FlutterCleanCode extends StatelessWidget {
  const FlutterCleanCode({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Clean Architecture',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppRoutes.loginPage,
      routes: AppRoutes.routes,
    );
  }
}
