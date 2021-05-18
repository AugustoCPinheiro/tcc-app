import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tcc/util/strings/strings.dart';
import 'package:tcc/util/theme/custom_theme.dart';

class ConfigurationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: CustomTheme.getSpacing(2)),
      child: Flex(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
              onPressed: () {},
              child: Text(Strings.CONFIGURATIONS_LOGOUT_BUTTON_TEXT)),
        ],
      ),
    );
  }
}
