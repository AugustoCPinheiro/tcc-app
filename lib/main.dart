import 'package:flutter/material.dart';
import 'package:tcc/pages/home/home.dart';
import 'package:tcc/pages/login/login.dart';
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
      //Adicionar lógica para trocar entrada dependendo do login
      home: SafeArea(
          child: Navigator(
        // initialRoute: true ? "home" : "login",
        pages: [
          MaterialPage(key: ValueKey("home"), child: Home()),
          MaterialPage(key: ValueKey("login"), child: Login())
        ],
        onPopPage: (route, result) => route.didPop(result),
      )),
    );
  }
}
