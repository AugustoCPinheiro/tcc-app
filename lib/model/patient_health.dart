class PatientHealth {
  String _dataType;
  String _patientCode;
  List<HealthData> _healthData;

  PatientHealth.fromJson(Map<String, dynamic> json)
      : _dataType = json["dataType"],
        _patientCode = json["patientCode"],
        _healthData = List.from((json["healthData"] as List)
            .map<HealthData>((e) => HealthData.fromJson(e)));

  String get patientCode => _patientCode;

  List<HealthData> get healthData => _healthData;

  String get dataType => _dataType;
}

class HealthData {
  DateTime _date;
  String _bpm;
  String _sat;
  String _sysPressure;
  String _diasPressure;
  String _temperature;

  HealthData.fromJson(Map<String, dynamic> json)
      : _bpm = json["heart_rate"],
        _sat = json["saturation"],
        _sysPressure = json["systolic_pressure"],
        _diasPressure = json["diastolic_pressure"],
        _date = DateTime.parse(json["date"]),
        _temperature = json["temperature"];

  Map<String, String> toIterable() => {
        "BPM": _bpm,
        "SAT": _sat,
        "SP": _sysPressure,
        "DP": _diasPressure,
        "TEMP": _temperature.substring(0, _temperature.indexOf(".") + 2)
      };

  String get sat => _sat;

  String get bpm => _bpm;

  String get diasPressure => _diasPressure;

  String get sysPressure => _sysPressure;

  DateTime get date => _date;

  String get temperature => _temperature;
}
