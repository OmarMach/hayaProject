import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:haya/config.dart';
import 'package:haya/screens/browse_events_screen.dart';
import 'package:haya/screens/features_screen.dart';
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
    FeaturesScreen()
  ];

  // displayed icons inside the navbar
  final _navBarItems = [
    Icon(
      Icons.home,
      color: Colors.white,
      size: 30,
    ),
    Icon(
      Icons.search,
      color: Colors.white,
      size: 30,
    ),
    Icon(
      Icons.person,
      color: Colors.white,
      size: 30,
    ),
    Icon(
      Icons.star_border,
      color: Colors.white,
      size: 30,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          animationDuration: Duration(milliseconds: 400),
          index: _currentScreenIndex,
          onTap: (i) {
            // updating the screen content through these lines
            setState(() {
              _currentScreenIndex = i;
            });
          },
          height: 50,
          color: primColor,
          backgroundColor: backgroundColor,
          buttonBackgroundColor: primColor,
          items: _navBarItems,
        ),
        body: Container(
          child: _screens[_currentScreenIndex],
        ));
  }
}
