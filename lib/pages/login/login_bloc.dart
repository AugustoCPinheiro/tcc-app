import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:tcc/model/user_auth.dart';
import 'package:tcc/pages/login/login_event.dart';
import 'package:tcc/pages/login/login_state.dart';
import 'package:tcc/resources/repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final Repository _repository = Repository();
  final _authController = StreamController();

  LoginBloc() : super(LoginState());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginAccepted) {
      yield state.copyWith(status: LoginStatus.ACCEPTED);
    }
    if (event is LoginDenied) {
      yield state.copyWith(status: LoginStatus.DENIED);
    }
    if (event is LoginSubmit) {
      _repository.authUser(UserAuth(event.id, event.password));
    }
  }

  authUser(String id, String password) async {
    _authController.sink.add(null);
    dynamic response = await _repository.authUser(UserAuth(id, password));
    _authController.sink.add(response);
    return response;
  }

  Stream getAuthStream() => _authController.stream;

  dispose() {
    _authController.close();
  }
}
