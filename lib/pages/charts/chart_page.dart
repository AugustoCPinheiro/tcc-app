import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tcc/components/custom_card.dart';
import 'package:tcc/components/page_body_container.dart';
import 'package:tcc/components/patient_data_line_chart.dart';
import 'package:tcc/util/theme/custom_theme.dart';

class ChartPage extends StatefulWidget {
  @override
  _ChartPageState createState() {
    return _ChartPageState();
  }
}

class _ChartPageState extends State<ChartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Nome do paciente",
        ),
      ),
      body: PageBodyContainer(
        padding: EdgeInsets.fromLTRB(
            CustomTheme.getSpacing(1),
            CustomTheme.getSpacing(5),
            CustomTheme.getSpacing(1),
            CustomTheme.getSpacing(1)),
        child: CustomCard(child: PatientDataLineChart.withSampleData()),
      ),
    );
  }
}
