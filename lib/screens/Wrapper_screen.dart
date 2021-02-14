import 'package:flutter/material.dart';
import 'package:haya/screens/add_event_screen.dart';
import 'package:haya/screens/browse_events_screen.dart';
import 'package:haya/screens/home_screen.dart';
import 'package:haya/screens/profile_screen.dart';

class WrapperScreen extends StatefulWidget {
  static const routeName = '/wrapper';
  @override
  _WrapperScreenState createState() => _WrapperScreenState();
}

class _WrapperScreenState extends State<WrapperScreen> {
  // used to navigate and change the current screen content
  int _currentScreenIndex = 0;

  // screen list that will be re rendered when clicking on navbar items
  final _screens = [
    HomeScreen(),
    BrowseEventsScreen(),
    ProfileScreen(),
  ];

  // displayed icons inside the navbar
  final _navBarItems = [
    BottomNavigationBarItem(
      title: Text("Home"),
      icon: Icon(
        Icons.home,
        size: 30,
      ),
    ),
    BottomNavigationBarItem(
      title: Text("Join"),
      icon: Icon(
        Icons.search,
        size: 30,
      ),
    ),
    BottomNavigationBarItem(
      title: Text("Profile"),
      icon: Icon(
        Icons.person,
        size: 30,
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentScreenIndex,
          items: _navBarItems,
          onTap: (i) {
            // updating the screen content through these lines
            setState(() {
              _currentScreenIndex = i;
            });
          },
        ),
        body: _screens[_currentScreenIndex]);
  }
}
