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
    return BottomNavigationBar(
      unselectedItemColor: Colors.black,
      selectedItemColor: Colors.deepOrangeAccent,
      backgroundColor: Colors.white,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.cable),
            label: "Cable",
            backgroundColor: Colors.white),
        BottomNavigationBarItem(
          icon: Icon(Icons.abc_sharp),
          backgroundColor: Colors.white,
          label: "Abc",
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit_outlined),
            label: "Outlined",
            backgroundColor: Colors.white),
      ],
      type: BottomNavigationBarType.shifting,
      showUnselectedLabels: true,
      elevation: 100,
      currentIndex: _selectedTab,
      onTap: (index) {
        _changeTab(index);
        print("index: $index");
      },
    );
  }
}
