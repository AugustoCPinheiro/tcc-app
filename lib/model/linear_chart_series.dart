import 'package:tcc/model/linear_chart_data.dart';

class LinearChartSeries {
  List<LinearChartData> _data;
  String _id;

  LinearChartSeries(this._id, this._data);

  List<LinearChartData> get data => _data;

  String get id => _id;
}
