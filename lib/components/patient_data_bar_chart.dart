import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/widgets.dart';
import 'package:tcc/model/linear_chart_data.dart';
import 'package:tcc/model/linear_chart_data_wrapper.dart';
import 'package:tcc/model/linear_chart_series.dart';

class PatientDataBarChart extends StatelessWidget {
  final LinearChartDataWrapper dataWrapper;

  PatientDataBarChart(this.dataWrapper);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.5,
      child: charts.TimeSeriesChart(
        dataWrapper.dataSeries
            .map<charts.Series<TimeChartData, DateTime>>(
                (e) => convertSeries(e, dataWrapper.dataSeries.indexOf(e)))
            .toList(),
        defaultRenderer: charts.BarRendererConfig<DateTime>(),
        behaviors: [charts.PanAndZoomBehavior()],
      ),
    );
  }

  charts.Series convertSeries(TimeChartSeries linearSeries, int index) {
    return charts.Series<TimeChartData, DateTime>(
        id: linearSeries.id,
        domainFn: (TimeChartData data, _) => data.xAxis,
        measureFn: (TimeChartData data, _) => data.yAxis,
        data: linearSeries.data,
        colorFn: (TimeChartData chartData, _) => charts.Color.black);
  }
}
