import 'dart:convert';

import 'package:tcc/model/user.dart';
import 'package:tcc/model/user_auth.dart';
import 'package:tcc/resources/base_api_provider.dart';
import 'package:tcc/util/http/http_error.dart';
import 'package:tcc/util/http/http_status.dart';

class AuthApiProvider extends BaseApiProvider {
  Future<User> authorize(UserAuth userAuth) async {
    print(jsonEncode(userAuth.toJson()));
    final response = await client.post(buildUrl("auth"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(userAuth.toJson()));
    switch (response.statusCode) {
      case HttpStatus.OK:
        return User.fromJson(json.decode(response.body));

      case HttpStatus.BAD_REQUEST:
        return Future.error(BadRequestError());

      default:
        throw Exception("Untreated status");
        break;
    }
  }
}
