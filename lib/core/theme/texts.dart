// Flutter Packages
import 'package:flutter/material.dart';

// Core
import 'package:flutter_clean_code/core/theme/colors.dart';

class TextStyles {
  // Avoid self isntance
  TextStyles._();
  static TextStyles? _instance;
  static TextStyles get instance {
    _instance ??= TextStyles._();
    return _instance!;
  }

  TextStyle get textLight => TextStyle(
        fontWeight: FontWeight.w300,
        color: AppColors.instance.black,
      );

  TextStyle get textRegular => TextStyle(
        fontWeight: FontWeight.w400,
        color: AppColors.instance.black,
      );

  TextStyle get textMedium => TextStyle(
        fontWeight: FontWeight.w500,
        color: AppColors.instance.black,
      );

  TextStyle get textSemiBold => TextStyle(
        fontWeight: FontWeight.w600,
        color: AppColors.instance.black,
      );

  TextStyle get textBold => TextStyle(
        fontWeight: FontWeight.w700,
        color: AppColors.instance.black,
      );

  TextStyle get textExtraBold => TextStyle(
        fontWeight: FontWeight.w800,
        color: AppColors.instance.black,
      );
}

extension TextStylesExtensions on BuildContext {
  TextStyles get textStyles => TextStyles.instance;
}
