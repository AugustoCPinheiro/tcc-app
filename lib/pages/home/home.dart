import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tcc/components/app_bottom_navigation_bar.dart';
import 'package:tcc/components/page_body_container.dart';
import 'package:tcc/pages/configurations/configurations.dart';
import 'package:tcc/pages/patients/patients.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  List<Widget> _homePages = [PatientsPage(), ConfigurationsPage()];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageBodyContainer(child: _homePages.elementAt(_selectedIndex)),
      bottomNavigationBar: AppBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
