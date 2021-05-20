import 'package:tcc/model/linear_chart_series.dart';

class LinearChartDataWrapper {
  List<LinearChartSeries> _dataSeries;
  String xAxisLabel;
  String yAxisLabel;

  LinearChartDataWrapper(this._dataSeries,
      {this.xAxisLabel = "x", this.yAxisLabel = "y"});

  List<LinearChartSeries> get dataSeries => _dataSeries;
}
