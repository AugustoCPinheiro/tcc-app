import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tcc/pages/home/home.dart';
import 'package:tcc/pages/login/login.dart';

class AppNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: [
        false
            ? MaterialPage(key: ValueKey("home"), child: Home())
            : MaterialPage(key: ValueKey("login"), child: Login())
      ],
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case "Home":
            return buildRoute(Home());

          case "Login":
            return buildRoute(Login());

          default:
            throw Exception("");
        }
      },
      onPopPage: (route, result) => route.didPop(result),
    );
  }

  MaterialPageRoute buildRoute(Widget widget) =>
      MaterialPageRoute(builder: (context) => widget);
}
