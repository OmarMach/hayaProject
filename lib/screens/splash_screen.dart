import 'package:flutter/material.dart';
import 'package:haya/config.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = "/splash";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(lightBlueColor),
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Haya, let's get lost...",
            style: TextStyle(color: lightBlueColor),
          ),
        ],
      ),
    );
  }
}
