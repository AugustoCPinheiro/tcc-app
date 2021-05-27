import 'dart:async';

import 'package:tcc/model/user_auth.dart';
import 'package:tcc/resources/repository.dart';

class LoginBloc {
  final Repository _repository = Repository();
  final _authController = StreamController();

  saveUser() {}
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
