class PatientHealth {
  String _dataType;
  String _patientCode;
  List<HealthData> _healthData;

  PatientHealth.fromJson(Map<String, dynamic> json)
      : _dataType = json["dataType"],
        _patientCode = json["patientCode"],
        _healthData = (json["healthData"] as List)
            .map<HealthData>((e) => HealthData.fromJson(e));

  String get patientCode => _patientCode;

  List<HealthData> get healthData => _healthData;

  String get dataType => _dataType;
}

class HealthData {
  int _bpm;
  int _sat;

  HealthData.fromJson(Map<String, dynamic> json)
      : _bpm = json["bpm"],
        _sat = json["sat"];

  int get sat => _sat;

  int get bpm => _bpm;
}
