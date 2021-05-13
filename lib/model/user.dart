class User {
  String _name;
  String _username;

  User.fromJson(Map<String, dynamic> json)
      : _name = json["name"],
        _username = json["username"];

  String get username => _username;

  String get name => _name;
}
