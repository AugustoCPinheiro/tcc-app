import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tcc/util/theme/custom_theme.dart';
import 'package:tcc/util/theme/theme_colors.dart';

class Story extends StatelessWidget {
  final StoryType type;
  final GestureTapCallback onTap;

  Story({this.type, this.onTap});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onTap,
      fillColor: CustomTheme.getColor(ThemeColors.BLUE_DARKER),
      elevation: CustomTheme.DEFAULT_ELEVATION,
      shape: CircleBorder(),
      child: Icon(Icons.account_tree_rounded),
      padding: EdgeInsets.all(CustomTheme.getSpacing(3)),
    );
  }
}

enum StoryType { CHART }
