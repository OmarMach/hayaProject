import 'dart:ui';

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

final placeHolderText =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean non quam varius, gravida tellus sit amet, tincidunt augue. Nunc posuere vitae dolor quis porta. Vivamus elementum purus eget ligula sagittis, id viverra leo luctus. Pellentesque maximus purus sed lorem viverra consectetur. Sed gravida, lectus lacinia facilisis vulputate, sapien augue gravida neque, in ullamcorper quam metus ut lorem. Aenean nisl diam, blandit semper purus vitae, varius malesuada odio';

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
};
