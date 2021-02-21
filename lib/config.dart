import 'package:flutter/material.dart';
import 'package:haya/screens/add_club_screen.dart';
import 'package:haya/screens/add_event_screen.dart';
import 'package:haya/screens/browse_regions_screen.dart';
import 'package:haya/screens/splash_screen.dart';

import 'screens/Wrapper_screen.dart';
import 'screens/browse_events_screen.dart';
import 'screens/features_screen.dart';
import 'screens/login_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/register_screen.dart';
import 'screens/selected_event_screen.dart';

// These are Basil Color themes from Material design

final titleColor = Color(0xFFFF3C00);
final backgroundColor = Color(0xFFB9E4C9);
final primColor = Color(0xFF356859);
final lighterBackGroundColor = Color(0xFFFFBE6);
final lighterprimColor = Color(0xFF37966F);
final redColor = Color(0xFFF25260);
final greyColor = Color(0xFFE9ECF2);
final greenColor = Color(0xFF41D992);
final lightBlueColor = Color(0xFFAEF2D3);
final yellowColor = Color(0xFFF2B44A);

final titleStyle = TextStyle(
  fontSize: 15,
);
final darkText = TextStyle(
  color: Colors.black,
);
final darkTitle = TextStyle(
  fontSize: 13,
  color: Colors.black,
);

final placeHolderText =
    'Lo vulputate, sapien augue gravida neque, in ullamcorper quam metus ut lorem. Aenean nisl diam, blandit semper purus vitae, varius malesuada odio';

final routes = {
  BrowseRegionsScreen.routeName: (context) => BrowseRegionsScreen(),
  BrowseEventsScreen.routeName: (context) => BrowseEventsScreen(),
  SelectedEventScreen.routeName: (context) => SelectedEventScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  FeaturesScreen.routeName: (context) => FeaturesScreen(),
  WrapperScreen.routeName: (context) => WrapperScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  RegisterScreen.routeName: (context) => RegisterScreen(),
  SplashScreen.routeName: (context) => SplashScreen(),
  AddEventScreen.routeName: (context) => AddEventScreen(),
  AddClubScreen.routeName: (context) => AddClubScreen(),
};
