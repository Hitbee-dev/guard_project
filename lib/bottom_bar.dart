import 'package:flutter/material.dart';
import 'package:guard_project/home_page.dart';
import 'package:guard_project/real_map.dart';
import 'package:url_launcher/url_launcher.dart';

import 'constants/screen_size.dart';

class BottomBar extends StatefulWidget {
  BottomBar({
    Key key,
  }) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  List<BottomNavigationBarItem> btmNavItems = [
    BottomNavigationBarItem(icon: Icon(Icons.location_on), title: Text("")),
    BottomNavigationBarItem(icon: Icon(Icons.notifications_active), title: Text("")),
    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("")),
    BottomNavigationBarItem(icon: Icon(Icons.perm_device_information), title: Text("")),
    BottomNavigationBarItem(icon: Icon(Icons.phone_in_talk), title: Text(""))
  ];

  int _selectedNavItems = 2;

  List<Widget> _screen = <Widget>[
    RealMap(),
    Container(color: Colors.orange),
    HomePage(),
    Container(color: Colors.green),
    Container(color: Colors.blue),
    // ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    if (size == null) size = MediaQuery.of(context).size;

    /// Data가 null일 때 Device에서 사용중인 해상도를 가져온다.
    return Scaffold(
      body: _screen[_selectedNavItems],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: btmNavItems,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        currentIndex: _selectedNavItems,
        onTap: _btmNavClick,
      ),
    );
  }

  void _btmNavClick(int index) {
    setState(() {
      _selectedNavItems = index;
    });
  }
}
