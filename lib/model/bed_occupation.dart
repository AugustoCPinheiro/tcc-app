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
        _patientCode = json["patientCode"],
        _bed = Bed.fromJson(json["bed"]);

  DateTime get startDate => _startDate;

  DateTime get endDate => _endDate;

  String get patientCode => _patientCode;

  Bed get bed => _bed;

  Map<String, dynamic> toJson() => {
        "startDate": _startDate.toString(),
        "endDate": _endDate.toString(),
        "patientCode": _patientCode
      };

  @override
  String toString() {
    return "startDate: ${this.startDate}, endDate: ${this.endDate}, patientCode: ${this.patientCode}, bed: ${this.bed}";
  }
}
