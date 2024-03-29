import 'package:flutter/material.dart';
import '../features/login/presentation/pages/login_page.dart';

class AppRoutes {
  static const String loginPage = '/login';

  static Map<String, WidgetBuilder> routes = {
    loginPage: (context) => const LoginPage(),
  };
}
