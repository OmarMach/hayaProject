import 'package:flutter/material.dart';
import 'package:haya/screens/Wrapper_screen.dart';
import 'package:haya/screens/browse_events_screen.dart';
import 'package:haya/screens/browse_regions_screen.dart';
import 'package:haya/screens/features_screen.dart';
import 'package:haya/screens/login_screen.dart';
import 'package:haya/screens/profile_screen.dart';
import 'package:haya/screens/register_screen.dart';
import 'package:haya/screens/selected_event_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        BrowseRegionsScreen.routeName: (context) => BrowseRegionsScreen(),
        BrowseEventsScreen.routeName: (context) => BrowseEventsScreen(),
        SelectedEventScreen.routeName: (context) => SelectedEventScreen(),
        ProfileScreen.routeName: (context) => ProfileScreen(),
        FeaturesScreen.routeName: (context) => FeaturesScreen(),
        WrapperScreen.routeName: (context) => WrapperScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        RegisterScreen.routeName: (context) => RegisterScreen(),
      },
      title: 'Hayya, let\'s get lost..',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'ProductSans',
        // brightness: Brightness.dark,
      ),
      home: RegisterScreen(),
    );
  }
}
