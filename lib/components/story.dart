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
      onPressed: () {
        switch (type) {
          case StoryType.CHART:
            print("add chart page");
            break;
          default:
            throw Exception("Untreated case");
        }
        if (onTap != null) {
          onTap();
        }
      },
      fillColor: ThemeColors.BLUE_DARKER,
      elevation: CustomTheme.DEFAULT_ELEVATION,
      constraints: BoxConstraints(minHeight: 40.0, minWidth: 40.0),
      shape: CircleBorder(),
      child: Center(
        child: Icon(
          Icons.account_tree_rounded,
          color: Colors.white,
        ),
      ),
    );
  }
}

enum StoryType { CHART }
