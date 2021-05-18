import 'package:flutter/material.dart';
import 'package:tcc/navigation/app_navigator.dart';
import 'package:tcc/persistence/controller/patient_persistence_file_controller.dart';
import 'package:tcc/persistence/facade/persistence_facade.dart';
import 'package:tcc/util/theme/custom_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final PersistenceFacade persistenceFacade =
      PatientPersistenceFileController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TCC',
      theme: CustomTheme.getTheme(),
      home: SafeArea(child: AppNavigator()),
    );
  }
}
