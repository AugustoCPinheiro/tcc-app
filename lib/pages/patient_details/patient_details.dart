import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tcc/model/patient.dart';

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
      appBar: AppBar(
        title: Text(""),
      ),
      body: Container(
        child: Text(widget.patient.name),
      ),
    );
  }
}
