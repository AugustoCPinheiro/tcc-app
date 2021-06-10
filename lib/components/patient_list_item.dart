import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tcc/model/patient_health_status.dart';
import 'package:tcc/util/theme/custom_theme.dart';

class PatientListItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final PatientHealthStatus patientStatus;
  final GestureTapCallback onTap;

  PatientListItem(
      {Key key, this.title, this.subtitle, this.patientStatus, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      margin: EdgeInsets.only(bottom: CustomTheme.getSpacing(3)),
      child: ListTile(
        subtitle: Text("Leito ${this.subtitle}"),
        onTap: this.onTap,
        leading: patientStatus == PatientHealthStatus.Normal
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
