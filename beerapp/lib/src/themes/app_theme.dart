import 'package:flutter/material.dart';
import 'colors.dart';

class AppCustomTheme {
  static const colors = AppColors();
  static ThemeData get lightTheme {
    return ThemeData(
      fontFamily: 'IBMPlexSans',
    );
  }
}
