class BedOccupation {
  DateTime _startDate;
  DateTime _endDate;
  String _patientCode;

  BedOccupation.fromJson(Map<String, dynamic> json)
      : _startDate = json["startDate"],
        _endDate = json["endDate"],
        _patientCode = json["patientCode"];

  DateTime get startDate => _startDate;

  DateTime get endDate => _endDate;

  String get patientCode => _patientCode;
}
