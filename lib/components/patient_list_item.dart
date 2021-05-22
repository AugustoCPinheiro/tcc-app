import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tcc/model/patient_status.dart';

class PatientListItem extends StatelessWidget {
  final String title;
  final PatientStatus patientStatus;
  final GestureTapCallback onTap;

  PatientListItem({Key key, this.title, this.patientStatus, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: ListTile(
        onTap: this.onTap,
        leading: patientStatus == PatientStatus.Normal
            ? Icon(Icons.close)
            : Icon(
                Icons.announcement_sharp,
                color: Colors.red,
              ),
        title: Text(title),
      ),
    );
  }
}
