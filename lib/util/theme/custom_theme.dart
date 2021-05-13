import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class CustomTheme {
  static const COLOR_PRIMARY = 0xFF3FA7D6;
  static const DEFAULT_ELEVATION = 2.0;
  static const _DEFAULT_SPACING = 4.0;
  static Color getColor(int colorValue) {
    return Color(colorValue);
  }

  static ThemeData getTheme() {
    return ThemeData(
        primaryColor: CustomTheme.getColor(CustomTheme.COLOR_PRIMARY));
  }

  static double getSpacing(int amount) {
    return _DEFAULT_SPACING * amount;
  }
}
