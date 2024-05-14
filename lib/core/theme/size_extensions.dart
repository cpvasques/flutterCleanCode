import 'package:flutter/material.dart';

extension SizeExtensions on BuildContext {
  // Device dimension
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
  bool get isDesktop => MediaQuery.of(this).size.width > 992;

  // Device percent dimension
  double percentWidth(double percent) => screenWidth * percent;
  double percentHeight(double percent) => screenHeight * percent;
}
