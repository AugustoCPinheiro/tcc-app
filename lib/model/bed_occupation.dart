import 'package:tcc/model/bed.dart';

class BedOccupation {
  DateTime _startDate;
  DateTime _endDate;
  String _patientCode;
  Bed _bed;

  BedOccupation(this._startDate, this._endDate, this._patientCode);

  BedOccupation.fromJson(Map<String, dynamic> json)
      : _startDate = DateTime.parse(json["startDate"]),
        _endDate = DateTime.parse(json["endDate"]),
        _patientCode = json["patientCode"];

  DateTime get startDate => _startDate;

  DateTime get endDate => _endDate;

  String get patientCode => _patientCode;

  Map<String, dynamic> toJson() => {
        "startDate": _startDate.toString(),
        "endDate": _endDate.toString(),
        "patientCode": _patientCode
      };
}
