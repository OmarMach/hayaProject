import 'package:flutter/material.dart';
import 'package:haya/screens/browse_events_screen.dart';
import 'package:haya/screens/browse_regions_screen.dart';
import 'package:haya/screens/features_screen.dart';
import 'package:haya/screens/login_screen.dart';
import 'package:haya/screens/profile_screen.dart';
import 'package:haya/screens/splash_screen.dart';
import 'package:haya/widgets/ClipGridItem.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.all(15.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'TESTING MENU',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 40),
                  ),
                ),
                SizedBox(height: 20),
                GridView.count(
                  shrinkWrap: true,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  crossAxisCount: 2,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    ClipGridItem(
                      category: 'Profile',
                      routeName: ProfileScreen.routeName,
                      icon: Icons.person,
                    ),
                    ClipGridItem(
                      category: 'Events',
                      routeName: BrowseEventsScreen.routeName,
                      icon: Icons.event,
                    ),
                    ClipGridItem(
                      category: 'Regions',
                      routeName: BrowseRegionsScreen.routeName,
                      icon: Icons.map,
                    ),
                    ClipGridItem(
                      category: 'Featured events',
                      routeName: FeaturesScreen.routeName,
                      icon: Icons.star,
                    ),
                    ClipGridItem(
                      category: 'Logout',
                      routeName: LoginScreen.routeName,
                      icon: Icons.remove_circle_outline,
                    ),
                    ClipGridItem(
                      category: 'Splash screen',
                      routeName: SplashScreen.routeName,
                      icon: Icons.watch_later,
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
