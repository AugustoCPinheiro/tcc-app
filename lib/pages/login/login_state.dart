enum LoginStatus { INITIAL, LOADING, ACCEPTED, DENIED }

class LoginState {
  final LoginStatus status;

  const LoginState({this.status = LoginStatus.INITIAL});

  LoginState copyWith({LoginStatus status}) => LoginState(status: status);
}
