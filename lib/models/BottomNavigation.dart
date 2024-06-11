import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  _BottomSheetNavigation createState() => _BottomSheetNavigation();
}

class _BottomSheetNavigation extends State {
  int _selectedTab = 0;

  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return   BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.black,
      selectedItemColor: Colors.deepOrangeAccent,
      backgroundColor: Colors.white,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: Colors.white),
        BottomNavigationBarItem(
          icon: Icon(Icons.request_page_rounded),
          backgroundColor: Colors.white,
          label: "Requests",
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.design_services),
            label: "Self Service",
            backgroundColor: Colors.white),
      ],
      showUnselectedLabels: true,
      elevation: 100,
      currentIndex: _selectedTab,
      onTap: (index) {
        _changeTab(index);
        if (kDebugMode) {
          print("index: $index");
        }
      },
    );
  }
}
