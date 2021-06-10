class Bed {
  String _code;

  Bed(this._code);

  Bed.fromJson(Map<String, dynamic> json) : this._code = json["code"];

  String get code => _code;
}
