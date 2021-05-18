import 'package:tcc/model/bed_occupation.dart';

class Patient {
  String _patientCode;
  String _name;
  BedOccupation _bedOccupation;

  Patient(this._name, this._patientCode, this._bedOccupation);

  Patient.fromJson(Map<String, dynamic> json)
      : _patientCode = json["patientCode"],
        _name = json["name"],
        _bedOccupation = BedOccupation.fromJson(json["bedOccupation"]);

  Patient.asTest() {
    this._name = "Paciente de teste";
    this._patientCode = "123";
    this._bedOccupation = BedOccupation(DateTime(2020), DateTime(2021), "123");
  }

  String get patientCode => _patientCode;

  String get name => _name;

  BedOccupation get bedOccupation => _bedOccupation;

  Map<String, dynamic> toJson() => {
        "patientCode": _patientCode,
        "name": _name,
        "bedOccupation": _bedOccupation.toJson()
      };

  @override
  String toString() {
    return "name: $_name patientCode: $_patientCode bedOccupation: $_bedOccupation";
  }
}
