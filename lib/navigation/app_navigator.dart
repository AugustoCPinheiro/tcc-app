import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tcc/model/patient.dart';
import 'package:tcc/pages/charts/chart_page.dart';
import 'package:tcc/pages/home/home.dart';
import 'package:tcc/pages/patient_details/patient_details.dart';

class AppNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: [
        true
            ? MaterialPage(key: ValueKey("home"), child: ChartPage())
            : MaterialPage(
                key: ValueKey("login"),
                child: PatientDetailsPage(
                  patient: Patient.asTest(),
                ))
      ],
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case "Home":
            return buildRoute(Home());

          case "Login":
            return buildRoute(PatientDetailsPage(
              patient: Patient.asTest(),
            ));

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
