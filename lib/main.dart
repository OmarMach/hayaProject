import 'package:flutter/material.dart';
import 'package:haya/config.dart';
import 'package:haya/screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
      title: 'Hayya, let\'s get lost..',
      theme: ThemeData(
        // canvasColor: Colors.transparent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'ProductSans',
        // brightness: Brightness.dark,
      ),
      home: LoginScreen(),
    );
  }
}
