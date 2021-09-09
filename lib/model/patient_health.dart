class PatientHealth {
  String _patientCode;
  HealthData _healthData;

  PatientHealth.fromJson(Map<String, dynamic> json)
      : _patientCode = json["patientCode"],
        _healthData = HealthData.fromJson(json["healthData"]);

  String get patientCode => _patientCode;

  HealthData get healthData => _healthData;
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
