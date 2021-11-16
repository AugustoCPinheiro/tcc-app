import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcc/model/patient.dart';
import 'package:tcc/model/patient_health.dart';
import 'package:tcc/navigation/app_navigator_bloc.dart';
import 'package:tcc/navigation/app_navigator_state.dart';
import 'package:tcc/pages/charts/chart_page.dart';
import 'package:tcc/pages/home/home.dart';
import 'package:tcc/pages/login/login.dart';
import 'package:tcc/pages/patient_details/patient_details.dart';

class AppNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AppNavigatorBloc(AppNavigatorState(NavigatorStatus.LOGIN)),
      child: BlocBuilder<AppNavigatorBloc, AppNavigatorState>(
        builder: (context, state) {
          return Navigator(
            pages: [
              if (state.status == NavigatorStatus.LOGIN)
                MaterialPage(key: ValueKey("login"), child: Login())
              else if (state.status == NavigatorStatus.HOME)
                MaterialPage(key: ValueKey("home"), child: Home())
              else if (state.status == NavigatorStatus.PATIENT_DETAILS) ...[
                MaterialPage(key: ValueKey("home"), child: Home()),
                MaterialPage(
                    key: ValueKey("patient_details"),
                    child: PatientDetailsPage(
                      patient: state.payload,
                    ))
              ] else if (state.status == NavigatorStatus.CHARTS) ...[
                MaterialPage(key: ValueKey("home"), child: Home()),
                MaterialPage(
                    key: ValueKey("patient_details"),
                    child: PatientDetailsPage(
                      patient: state.payload["currentPatient"],
                    )),
                MaterialPage(
                    key: ValueKey("charts"),
                    child: ChartPage(
                      patient: state.payload["currentPatient"] as Patient,
                      health: state.payload["currentPatientHealth"]
                          as PatientHealth,
                    ))
              ]
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
        },
      ),
    );
  }

  MaterialPageRoute buildRoute(Widget widget) =>
      MaterialPageRoute(builder: (context) => widget);
}
