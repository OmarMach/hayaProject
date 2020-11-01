import 'package:flutter/material.dart';
import 'package:haya/config.dart';
import 'package:haya/screens/login_screen.dart';
import 'package:haya/utils/MaterialColorGenerator.dart';

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
        fontFamily: 'ProductSans',
        brightness: Brightness.dark,
        primaryColor: generateMaterialColor(lightBlueColor),
        errorColor: generateMaterialColor(redColor),
        accentColor: generateMaterialColor(yellowColor),
      ),
      home: LoginScreen(),
    );
  }
}
