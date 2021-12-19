import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcc/navigation/app_navigator_bloc.dart';
import 'package:tcc/navigation/app_navigator_event.dart';
import 'package:tcc/util/strings/strings.dart';
import 'package:tcc/util/theme/custom_theme.dart';
import 'package:tcc/util/theme/theme_colors.dart';

class ConfigurationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(bottom: CustomTheme.getSpacing(2)),
        child: ElevatedButton(
            onPressed: () {
              BlocProvider.of<AppNavigatorBloc>(context).add(LoginCalled());
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(ThemeColors.RED)),
            child: Text(Strings.CONFIGURATIONS_LOGOUT_BUTTON_TEXT)),
      ),
    );
  }
}
