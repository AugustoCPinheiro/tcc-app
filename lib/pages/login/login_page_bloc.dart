import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:tcc/model/user_auth.dart';
import 'package:tcc/pages/login/login_event.dart';
import 'package:tcc/pages/login/login_state.dart';
import 'package:tcc/resources/repository.dart';

class LoginPageBloc extends Bloc<LoginEvent, LoginState> {
  final Repository _repository = Repository();

  LoginPageBloc() : super(LoginState());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginAccepted) {
      yield state.copyWith(status: LoginStatus.ACCEPTED);
    }
    if (event is LoginDenied) {
      yield state.copyWith(status: LoginStatus.DENIED);
    }
    if (event is LoginSubmit) {
      authUser(event.id, event.password);
      yield state.copyWith(status: LoginStatus.LOADING);
    }
  }

  authUser(String id, String password) async {
    dynamic response = await _repository.authUser(UserAuth(id, password));
    if (response) {
      add(LoginAccepted());
    } else {
      add(LoginDenied());
    }
    return response;
  }
}
