import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tcc/util/theme/custom_theme.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  CustomCard({this.child});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: CustomTheme.DEFAULT_ELEVATION,
      shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(CustomTheme.DEFAULT_BORDER_RADIUS)),
      child: this.child,
    );
  }
}
