import 'dart:convert';

import 'package:tcc/model/user.dart';
import 'package:tcc/model/user_auth.dart';
import 'package:tcc/resources/base_api_provider.dart';
import 'package:tcc/util/http/http_status.dart';

class AuthApiProvider extends BaseApiProvider {
  Future<User> authorize(UserAuth userAuth) async {
    final response = await client.post(buildUrl("auth"));
    switch (response.statusCode) {
      case HttpStatus.OK:
        return User.fromJson(json.decode(response.body));
    }
  }
}
