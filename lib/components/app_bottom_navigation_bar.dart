import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final void Function(int) onItemTapped;

  const AppBottomNavigationBar({Key key, this.selectedIndex = 0, this.onItemTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.announcement_sharp), label: "Pacientes"),
        BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit_outlined), label: "Configurações")
      ],
      currentIndex: selectedIndex,
      onTap: onItemTapped,
    );
  }
}
