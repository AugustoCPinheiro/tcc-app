class UserAuth {
  String email;
  String password;

  UserAuth(this.email, this.password);

  Map<String, dynamic> toJson() => {"email": email, "password": password};
}
