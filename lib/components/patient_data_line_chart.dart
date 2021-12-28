import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tcc/model/linear_chart_data.dart';
import 'package:tcc/model/linear_chart_data_wrapper.dart';
import 'package:tcc/model/linear_chart_series.dart';

typedef Tap = void Function();

class PatientDataTimeSeriesChart extends StatelessWidget {
  final LinearChartDataWrapper dataWrapper;
  final bool animate;
  final Tap onTap;
  final bool isBar;

  PatientDataTimeSeriesChart(this.dataWrapper,
      {this.animate, this.onTap, this.isBar = false});

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
        SizedBox(
          child: ListView.builder(
            itemCount: dataWrapper.dataSeries.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Flex(
                  direction: Axis.horizontal,
                  children: [
                    Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        color: getSubtitleColorByIndex(index),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 3.0),
                      child: Text(dataWrapper.dataSeries[index].id),
                    )
                  ],
                ),
              );
            },
          ),
          height: 30,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 1.3,
          child: charts.TimeSeriesChart(
            dataWrapper.dataSeries
                .map<charts.Series<TimeChartData, DateTime>>(
                    (e) => convertSeries(e, dataWrapper.dataSeries.indexOf(e)))
                .toList(),
            animate: animate,
            behaviors: [charts.PanAndZoomBehavior()],
            defaultRenderer: isBar
                ? charts.BarRendererConfig()
                : charts.LineRendererConfig(),
            primaryMeasureAxis: charts.NumericAxisSpec(
                tickProviderSpec: charts.BasicNumericTickProviderSpec(
                    desiredTickCount: 25,
                    desiredMinTickCount: 10,
                    desiredMaxTickCount: 30)),
            domainAxis: DateTimeAxisSpecWorkaround(
                tickProviderSpec: charts.AutoDateTimeTickProviderSpec(),
                tickFormatterSpec: charts.AutoDateTimeTickFormatterSpec(
                    day: charts.TimeFormatterSpec(
                        format: "hh", transitionFormat: "hh"))),
          ),
        )
      ],
    );
  }

  charts.Series convertSeries(TimeChartSeries linearSeries, int index) {
    return charts.Series<TimeChartData, DateTime>(
        id: linearSeries.id,
        domainFn: (TimeChartData data, _) => data.xAxis,
        measureFn: (TimeChartData data, _) => data.yAxis,
        data: linearSeries.data,
        colorFn: (TimeChartData chartData, _) => getChartColorByIndex(index));
  }

  String getColorByIndex(int index) {
    return [
      "#FF0000",
      "#0000FF",
      "#00FF00",
      "#00C5FF",
      "#549B52",
      "#FFFF00"
    ][index];
  }

  charts.Color getChartColorByIndex(int index) {
    return charts.Color.fromHex(code: getColorByIndex(index));
  }

  Color getSubtitleColorByIndex(int index) {
    return fromHex(getColorByIndex(index));
  }

  Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
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

class ValueRenderer extends charts.CustomSymbolRenderer {
  @override
  Widget build(BuildContext context,
      {Color color, Size size, bool enabled = true}) {
    return Container(
      height: size.height,
      width: size.width,
      decoration: BoxDecoration(
        color: color,
      ),
    );
  }
}

class DateTimeAxisSpecWorkaround extends charts.DateTimeAxisSpec {
  const DateTimeAxisSpecWorkaround({
    charts.RenderSpec<DateTime> renderSpec,
    charts.DateTimeTickProviderSpec tickProviderSpec,
    charts.DateTimeTickFormatterSpec tickFormatterSpec,
    bool showAxisLine,
  }) : super(
            renderSpec: renderSpec,
            tickProviderSpec: tickProviderSpec,
            tickFormatterSpec: tickFormatterSpec,
            showAxisLine: showAxisLine);

  @override
  configure(charts.Axis<DateTime> axis, charts.ChartContext context,
      charts.GraphicsFactory graphicsFactory) {
    super.configure(axis, context, graphicsFactory);
    axis.autoViewport = false;
  }
}
