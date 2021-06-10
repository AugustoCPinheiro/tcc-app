import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tcc/components/custom_card.dart';
import 'package:tcc/util/theme/custom_theme.dart';
import 'package:tcc/util/theme/theme_colors.dart';

class HealthDataItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [ThemeColors.BLUE_DARKER, ThemeColors.BLUE_DARK])),
        padding: EdgeInsets.symmetric(
            horizontal: CustomTheme.getSpacing(3),
            vertical: CustomTheme.getSpacing(2)),
        child: Flex(
          crossAxisAlignment: CrossAxisAlignment.start,
          direction: Axis.vertical,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: CustomTheme.getSpacing(2)),
              child: Text(
                "O2",
                style: TextStyle(color: Colors.white, fontSize: 24.0),
              ),
            ),
            Container(
              padding:
                  EdgeInsets.symmetric(horizontal: CustomTheme.getSpacing(3)),
              child: Text(
                "99",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
