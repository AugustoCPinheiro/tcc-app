import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tcc/model/patient_status.dart';

class PatientListItem extends StatelessWidget {
  final String title;
  final PatientStatus patientStatus;
  const PatientListItem({Key key, this.title, this.patientStatus})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: patientStatus == PatientStatus.Normal
          ? Icon(Icons.close)
          : Icon(Icons.announcement_sharp),
      title: Text(title),
    );
  }
}
