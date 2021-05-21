import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tcc/components/chart_filter.dart';
import 'package:tcc/model/linear_chart_data.dart';
import 'package:tcc/model/linear_chart_data_wrapper.dart';
import 'package:tcc/model/linear_chart_series.dart';

class PatientDataLineChart extends StatelessWidget {
  final LinearChartDataWrapper dataWrapper;
  final bool animate;

  PatientDataLineChart(this.dataWrapper, {this.animate});

  /// Creates a [LineChart] with sample data and no transition.
  factory PatientDataLineChart.withSampleData() {
    return PatientDataLineChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ChartFilter(
          chartDataIds: [
            "Ala",
            "Ola",
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 2.5,
          child: charts.LineChart(
            dataWrapper.dataSeries
                .map<charts.Series<LinearChartData, double>>(
                    (e) => convertSeries(e))
                .toList(),
            animate: animate,
          ),
        )
      ],
    );
  }

  charts.Series convertSeries(LinearChartSeries linearSeries) {
    return charts.Series<LinearChartData, double>(
      id: linearSeries.id,
      domainFn: (LinearChartData data, _) => data.xAxis,
      measureFn: (LinearChartData data, _) => data.yAxis,
      data: linearSeries.data,
    );
  }

  /// Create three series with sample hard coded data.
  static LinearChartDataWrapper _createSampleData() {
    final myFakeDesktopData = [
      new LinearChartData(0, 5),
      new LinearChartData(1, 25),
      new LinearChartData(2, 100),
      new LinearChartData(3, 75),
    ];

    var myFakeTabletData = [
      new LinearChartData(0, 10),
      new LinearChartData(1, 50),
      new LinearChartData(2, 200),
      new LinearChartData(3, 150),
    ];

    var myFakeMobileData = [
      new LinearChartData(0, 15),
      new LinearChartData(1, 75),
      new LinearChartData(2, 300),
      new LinearChartData(3, 225),
    ];

    return LinearChartDataWrapper([
      LinearChartSeries("Desktop", myFakeDesktopData),
      LinearChartSeries("Tablet", myFakeTabletData),
      LinearChartSeries("Mobile", myFakeMobileData)
    ]);
  }
}
