import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tcc/util/strings/strings.dart';

class AppBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final void Function(int) onItemTapped;

  const AppBottomNavigationBar(
      {Key key, this.selectedIndex = 0, this.onItemTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.face),
            label: Strings.BOTTOM_NAVIGATION_PATIENTS_LABEL),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings_applications_outlined),
            label: Strings.BOTTOM_NAVIGATION_CONFIGURATIONS_LABEL)
      ],
      currentIndex: selectedIndex,
      onTap: onItemTapped,
    );
  }
}
