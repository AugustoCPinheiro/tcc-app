import 'package:tcc/util/validation/validators.dart';

class EmailValidator extends Validator {
  @override
  String validate(String value) {
    if (value != null) {
      return null;
    }
    return "erro";
  }
}
