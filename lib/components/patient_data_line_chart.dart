import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tcc/model/linear_chart_data.dart';
import 'package:tcc/model/linear_chart_data_wrapper.dart';
import 'package:tcc/model/linear_chart_series.dart';

class PatientDataTimeSeriesChart extends StatelessWidget {
  final LinearChartDataWrapper dataWrapper;
  final bool animate;

  PatientDataTimeSeriesChart(this.dataWrapper, {this.animate});

  /// Creates a [LineChart] with sample data and no transition.
  // factory PatientDataLineChart.withSampleData() {
  //   return PatientDataLineChart(
  //     _createSampleData(),
  //     // Disable animations for image tests.
  //     animate: false,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              Text("BPM"),
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  color: Colors.red,
                ),
              ),
              Text("SAT")
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 1.5,
          child: charts.TimeSeriesChart(
            dataWrapper.dataSeries
                .map<charts.Series<TimeChartData, DateTime>>(
                    (e) => convertSeries(e))
                .toList(),
            animate: animate,
            domainAxis: charts.DateTimeAxisSpec(
                tickFormatterSpec: charts.AutoDateTimeTickFormatterSpec(
                    day: charts.TimeFormatterSpec(
                        format: "hh mm ss", transitionFormat: "hh "))),
          ),
        )
      ],
    );
  }

  charts.Series convertSeries(TimeChartSeries linearSeries) {
    return charts.Series<TimeChartData, DateTime>(
      id: linearSeries.id,
      domainFn: (TimeChartData data, _) => data.xAxis,
      measureFn: (TimeChartData data, _) => data.yAxis,
      data: linearSeries.data,
    );
  }

  /// Create three series with sample hard coded data.
  // static LinearChartDataWrapper _createSampleData() {
  //   final myFakeDesktopData = [
  //     new TimeChartData(0, 5),
  //     new TimeChartData(1, 25),
  //     new TimeChartData(2, 100),
  //     new TimeChartData(3, 75),
  //   ];
  //
  //   var myFakeTabletData = [
  //     new TimeChartData(0, 10),
  //     new TimeChartData(1, 50),
  //     new TimeChartData(2, 200),
  //     new TimeChartData(3, 150),
  //   ];
  //
  //   var myFakeMobileData = [
  //     new TimeChartData(0, 15),
  //     new TimeChartData(1, 75),
  //     new TimeChartData(2, 300),
  //     new TimeChartData(3, 225),
  //   ];
  //
  //   return LinearChartDataWrapper([
  //     TimeChartSeries("Desktop", myFakeDesktopData),
  //     TimeChartSeries("Tablet", myFakeTabletData),
  //     TimeChartSeries("Mobile", myFakeMobileData)
  //   ]);
  // }
}
