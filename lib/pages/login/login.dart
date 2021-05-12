import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:tcc/util/validation/email_validator.dart';
import 'package:tcc/util/validation/password_validator.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                validator: EmailValidator().validate,
              ),
              TextFormField(
                validator: PasswordValidator().validate,
                inputFormatters: [
                  TextInputFormatter.withFunction((oldValue, newValue) => null)
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {}
                  },
                  child: Text(""))
            ],
          ),
        ),
      ),
    );
  }
}
