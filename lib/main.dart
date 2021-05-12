import 'package:flutter/material.dart';
import 'package:tcc/navigation/app_navigator.dart';
import 'package:tcc/util/theme/custom_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: CustomTheme.getTheme(),
      home: SafeArea(child: AppNavigator()),
    );
  }
}
