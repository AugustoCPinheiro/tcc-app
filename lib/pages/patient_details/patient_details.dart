import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tcc/components/patient_profile.dart';
import 'package:tcc/components/story_list.dart';
import 'package:tcc/model/patient.dart';
import 'package:tcc/util/theme/custom_theme.dart';

class PatientDetailsPage extends StatefulWidget {
  final Patient patient;

  const PatientDetailsPage({Key key, this.patient}) : super(key: key);

  @override
  _PatientDetailsPageState createState() {
    return _PatientDetailsPageState();
  }
}

class _PatientDetailsPageState extends State<PatientDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(CustomTheme.getSpacing(1)),
        child: Column(
          children: [
            PatientProfile(
              name: widget.patient.name,
            ),
            StoryList(),
            Flex(
              direction: Axis.vertical,
              children: [
                Card(
                  child: Column(children: [Text("Teste")]),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
