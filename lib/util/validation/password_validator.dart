import 'package:tcc/util/validation/validator.dart';

class PasswordValidator extends Validator {
  @override
  String validate(String value) {
    if (value != null) {
      return null;
    }
    return "erro";
  }
}
