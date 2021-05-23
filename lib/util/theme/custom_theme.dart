import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:tcc/util/theme/theme_color.dart';
import 'package:tcc/util/theme/theme_colors.dart';

class CustomTheme {
  static const COLOR_PRIMARY = ThemeColors.BLUE;

  static const DEFAULT_ELEVATION = 2.0;
  static const _DEFAULT_SPACING = 4.0;
  static const DEFAULT_BORDER_RADIUS = 10.0;

  static Color getColor(ThemeColor color) {
    return Color(color.value);
  }

  static ThemeData getTheme() {
    return ThemeData(
        primaryColor: CustomTheme.getColor(CustomTheme.COLOR_PRIMARY),
        appBarTheme: AppBarTheme(
            color: Colors.white, iconTheme: IconThemeData.fallback()));
  }

  static double getSpacing(int amount) {
    return _DEFAULT_SPACING * amount;
  }
}
