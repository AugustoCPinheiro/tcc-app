import 'package:tcc/model/linear_chart_series.dart';

class LinearChartDataWrapper {
  List<TimeChartSeries> _dataSeries;
  String xAxisLabel;
  String yAxisLabel;

  LinearChartDataWrapper(this._dataSeries,
      {this.xAxisLabel = "x", this.yAxisLabel = "y"});

  List<TimeChartSeries> get dataSeries => _dataSeries;
}
