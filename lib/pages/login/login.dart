import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcc/components/custom_card.dart';
import 'package:tcc/components/page_body_container.dart';
import 'package:tcc/navigation/app_navigator_bloc.dart';
import 'package:tcc/navigation/app_navigator_event.dart';
import 'package:tcc/pages/login/login_bloc.dart';
import 'package:tcc/pages/login/login_event.dart';
import 'package:tcc/pages/login/login_state.dart';
import 'package:tcc/util/strings/strings.dart';
import 'package:tcc/util/theme/custom_theme.dart';
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
  bool _idFilled = false;
  bool _passwordFilled = false;
  String _id = "";
  String _password = "";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(),
      child: PageBodyContainer(
        padding: EdgeInsets.symmetric(
            vertical: 0.0, horizontal: CustomTheme.getSpacing(2)),
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state.status == LoginStatus.ACCEPTED) {
              BlocProvider.of<AppNavigatorBloc>(context).add(HomeCalled());
            }
          },
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
                          textInputAction: TextInputAction.next,
                          validator: EmailValidator().validate,
                          decoration:
                              InputDecoration(labelText: Strings.LOGIN_ID_HINT),
                          onChanged: (value) {
                            setState(() {
                              _idFilled = value.isNotEmpty;
                              _id = value;
                            });
                          },
                        ),
                        TextFormField(
                            textInputAction: TextInputAction.done,
                            validator: PasswordValidator().validate,
                            decoration: InputDecoration(
                                labelText: Strings.LOGIN_PASSWORD_HINT),
                            obscureText: true,
                            onChanged: (value) {
                              setState(() {
                                _passwordFilled = value.isNotEmpty;
                                _password = value;
                              });
                            }),
                        Padding(
                            padding:
                                EdgeInsets.only(top: CustomTheme.getSpacing(2)),
                            child: BlocBuilder<LoginBloc, LoginState>(
                              builder: (context, state) {
                                // if (!snapshot.hasData) {
                                //   return CircularProgressIndicator();
                                // }
                                return ElevatedButton(
                                    onPressed: _idFilled && _passwordFilled
                                        ? _onElevatedButtonPressed()
                                        : null,
                                    child: Text(Strings.LOGIN_BUTTON));
                              },
                            ))
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _onElevatedButtonPressed() {
    if (_formKey.currentState.validate()) {
      BlocProvider.of<LoginBloc>(context).add(LoginSubmit(_id, _password));
    }
  }
}
