import 'package:flutter/widgets.dart';

class ThemeColor extends Color {
  final int _value;

  const ThemeColor(this._value) : super(_value);

  int get value => _value;
}
