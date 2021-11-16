class TimeChartData {
  DateTime _xAxis;
  double _yAxis;

  TimeChartData(this._xAxis, this._yAxis);

  double get yAxis => _yAxis;

  DateTime get xAxis => _xAxis;
}
