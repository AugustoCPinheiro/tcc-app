import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class CustomTheme {
  static const COLOR_PRIMARY = 0xFF3FA7D6;

  static Color getColor(int colorValue) {
    return Color(colorValue);
  }

  static ThemeData getTheme() {
    return ThemeData(
        primaryColor: CustomTheme.getColor(CustomTheme.COLOR_PRIMARY));
  }
}
