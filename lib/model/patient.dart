import 'package:tcc/model/bed_occupation.dart';

class Patient {
  String _patientCode;
  String _name;
  BedOccupation _bedOccupation;

  Patient(this._name);

  Patient.fromJson(Map<String, dynamic> json)
      : _patientCode = json["patientCode"],
        _name = json["nome"],
        _bedOccupation = BedOccupation.fromJson(json["bedOccupation"]);

  String get patientCode => _patientCode;

  String get name => _name;

  BedOccupation get bedOccupation => _bedOccupation;
}
