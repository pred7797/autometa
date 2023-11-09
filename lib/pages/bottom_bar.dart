import 'package:autom/pages/qrscanner.dart';
import 'package:autom/pages/text_input_page.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedState = 2;
  static final List<Widget> _widgetOptions = <Widget>[
    QRScanner(),
    TextInputPage(),
    const Text("Account")
  ];

  void _onItemTaped(int index) {
    setState(() {
      _selectedState = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions[_selectedState]),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedState,
          onTap: _onItemTaped,
          elevation: 10,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.blueGrey,
          unselectedItemColor: const Color(0xFF526480),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(FluentSystemIcons.ic_fluent_qr_code_regular),
                activeIcon: Icon(FluentSystemIcons.ic_fluent_qr_code_filled),
                label: "QR"),
            BottomNavigationBarItem(
                icon: Icon(FluentSystemIcons.ic_fluent_notebook_regular),
                activeIcon: Icon(FluentSystemIcons.ic_fluent_notebook_filled),
                label: "History"),
            BottomNavigationBarItem(
                icon: Icon(FluentSystemIcons.ic_fluent_person_regular),
                activeIcon: Icon(FluentSystemIcons.ic_fluent_person_filled),
                label: "Profile")
          ]),
    );
  }
}
