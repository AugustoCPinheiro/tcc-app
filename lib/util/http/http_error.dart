import 'dart:io';

import 'package:tcc/util/http/http_status.dart';

abstract class HttpError {
  int statusCode;

  HttpError(this.statusCode);
}

class BadRequestError extends HttpError {
  BadRequestError() : super(HttpStatus.BAD_REQUEST);
}

class InternalServerError extends HttpError {
  InternalServerError() : super(HttpStatus.INTERNAL_SERVER_ERROR);
}
