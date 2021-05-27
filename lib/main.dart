import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:tcc/navigation/app_navigator.dart';
import 'package:tcc/util/simple_bloc_observer.dart';
import 'package:tcc/util/theme/custom_theme.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TCC',
      theme: CustomTheme.getTheme(),
      home: SafeArea(child: AppNavigator()),
    );
  }
}
