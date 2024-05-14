import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static AppColors? _instance;

  static AppColors get instance {
    _instance ??= AppColors._();
    return _instance!;
  }

  Color get black => const Color(0Xff000000);
  Color get gray => const Color(0Xff79747E);
  Color get white => const Color(0Xffffffff);
}

extension ColrosAppExtensions on BuildContext {
  AppColors get colors => AppColors.instance;
}
