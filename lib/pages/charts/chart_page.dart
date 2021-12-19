import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tcc/components/custom_card.dart';
import 'package:tcc/components/page_body_container.dart';
import 'package:tcc/components/patient_data_line_chart.dart';
import 'package:tcc/model/linear_chart_data.dart';
import 'package:tcc/model/linear_chart_data_wrapper.dart';
import 'package:tcc/model/linear_chart_series.dart';
import 'package:tcc/model/patient.dart';
import 'package:tcc/model/patient_health.dart';
import 'package:tcc/util/theme/custom_theme.dart';

class ChartPage extends StatefulWidget {
  final Patient patient;
  final PatientHealth health;

  const ChartPage({Key key, this.patient, this.health}) : super(key: key);
  @override
  _ChartPageState createState() {
    return _ChartPageState();
  }
}

class _ChartPageState extends State<ChartPage> {
  List<TimeChartSeries> chartData = [];
  @override
  void initState() {
    super.initState();
    chartData = [
      buildBPMData(),
      buildSATData(),
      buildSPRData(),
      buildDPRData(),
      buildTEMPData()
    ];
  }

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
        child: CustomCard(
            child: PatientDataTimeSeriesChart(
          LinearChartDataWrapper(chartData),
          isBar: false,
        )),
      ),
    );
  }

  TimeChartSeries buildBPMData() {
    return TimeChartSeries(
        "BPM",
        widget.health.healthData
            .getRange(widget.health.healthData.length - 100,
                widget.health.healthData.length)
            .map<TimeChartData>((e) {
          double bpm = e.bpm.isNotEmpty ? double.parse(e.bpm) : 0.0;
          return TimeChartData(e.date, bpm);
        }).toList());
  }

  TimeChartSeries buildSATData() {
    return TimeChartSeries(
        "SAT",
        widget.health.healthData
            .getRange(widget.health.healthData.length - 100,
                widget.health.healthData.length)
            .map<TimeChartData>((e) {
          double sat = e.sat.isNotEmpty ? double.parse(e.sat) : 0.0;
          return TimeChartData(e.date, sat);
        }).toList());
  }

  TimeChartSeries buildSPRData() {
    return TimeChartSeries(
        "SPR",
        widget.health.healthData
            .getRange(widget.health.healthData.length - 100,
                widget.health.healthData.length)
            .map<TimeChartData>((e) {
          double spr =
              e.sysPressure.isNotEmpty ? double.parse(e.sysPressure) : 0.0;
          return TimeChartData(e.date, spr);
        }).toList());
  }

  TimeChartSeries buildDPRData() {
    return TimeChartSeries(
        "DPR",
        widget.health.healthData
            .getRange(widget.health.healthData.length - 100,
                widget.health.healthData.length)
            .map<TimeChartData>((e) {
          double dpr =
              e.diasPressure.isNotEmpty ? double.parse(e.diasPressure) : 0.0;
          return TimeChartData(e.date, dpr);
        }).toList());
  }

  TimeChartSeries buildTEMPData() {
    return TimeChartSeries(
        "TEMP",
        widget.health.healthData
            .getRange(widget.health.healthData.length - 100,
                widget.health.healthData.length)
            .map<TimeChartData>((e) {
          double temperature =
              e.temperature.isNotEmpty ? double.parse(e.temperature) : 0.0;
          return TimeChartData(e.date, temperature);
        }).toList());
  }
}
