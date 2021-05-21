import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tcc/util/strings/strings.dart';
import 'package:tcc/util/theme/custom_theme.dart';

class ConfigurationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(bottom: CustomTheme.getSpacing(2)),
        child: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    CustomTheme.getColor(CustomTheme.COLOR_RED))),
            child: Text(Strings.CONFIGURATIONS_LOGOUT_BUTTON_TEXT)),
      ),
    );
  }
}
