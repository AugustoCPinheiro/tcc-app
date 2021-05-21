import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tcc/components/custom_card.dart';
import 'package:tcc/components/page_body_container.dart';
import 'package:tcc/pages/login/login_page_bloc.dart';
import 'package:tcc/util/strings/strings.dart';
import 'package:tcc/util/theme/custom_theme.dart';
import 'package:tcc/util/validation/email_validator.dart';
import 'package:tcc/util/validation/password_validator.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  final LoginPageBloc _bloc = LoginPageBloc();
  final _formKey = GlobalKey<FormState>();
  bool _idFilled = false;
  bool _passwordFilled = false;

  @override
  Widget build(BuildContext context) {
    return PageBodyContainer(
      padding: EdgeInsets.symmetric(
          vertical: 0.0, horizontal: CustomTheme.getSpacing(2)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomCard(
            child: Padding(
              padding: EdgeInsets.all(CustomTheme.getSpacing(4)),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: EmailValidator().validate,
                      decoration:
                          InputDecoration(labelText: Strings.LOGIN_ID_HINT),
                      onChanged: (value) {
                        setState(() {
                          _idFilled = value.isNotEmpty;
                        });
                      },
                    ),
                    TextFormField(
                        validator: PasswordValidator().validate,
                        decoration: InputDecoration(
                            labelText: Strings.LOGIN_PASSWORD_HINT),
                        obscureText: true,
                        onChanged: (value) {
                          setState(() {
                            _passwordFilled = value.isNotEmpty;
                          });
                        }),
                    Padding(
                      padding: EdgeInsets.only(top: CustomTheme.getSpacing(2)),
                      child: ElevatedButton(
                          onPressed: _idFilled && _passwordFilled
                              ? onElevatedButtonPressed
                              : null,
                          child: Text(Strings.LOGIN_BUTTON)),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  onElevatedButtonPressed() {
    if (_formKey.currentState.validate()) {
      _bloc.saveUser();
      Navigator.pushNamed(context, "Home");
    }
  }
}
