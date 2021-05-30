abstract class LoginEvent {}

class LoginAccepted extends LoginEvent {}

class LoginDenied extends LoginEvent {}

class LoginSubmit extends LoginEvent {
  String id;
  String password;

  LoginSubmit(this.id, this.password);
}
