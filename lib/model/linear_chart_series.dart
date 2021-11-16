import 'package:tcc/model/linear_chart_data.dart';

class TimeChartSeries {
  List<TimeChartData> _data;
  String _id;

  TimeChartSeries(this._id, this._data);

  List<TimeChartData> get data => _data;

  String get id => _id;
}
