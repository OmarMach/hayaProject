import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:haya/config.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = '/profile';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final Map<String, dynamic> _profileInfo = {
    'name': 'Omar Mach',
    'address': 'Ibn Khaldoun, Tunis',
    'email': 'Admin@haya.tn',
    'phone': '+216 54 155 569',
    'image': 'assets/images/profile.png',
    'review': {
      'score': 4.5,
      'number': 52,
    },
    'events': 7,
    'places': 4,
    'about': placeHolderText,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(75),
                        child: Image.asset(
                          'assets/images/profile.png',
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 25),
                      Text(
                        "Omar Mach",
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.star),
                            SizedBox(width: 5),
                            Icon(Icons.star),
                            SizedBox(width: 5),
                            Icon(Icons.star),
                            SizedBox(width: 5),
                            Icon(Icons.star_half),
                            SizedBox(width: 5),
                            Icon(Icons.star_border),
                            SizedBox(width: 5),
                            Text("50+ Review"),
                          ]),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: FlatButton(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    EvilIcons.envelope,
                                    color: redColor,
                                  ),
                                  Text(
                                    "Message",
                                    style: TextStyle(
                                      color: redColor,
                                    ),
                                  ),
                                ],
                              ),
                              onPressed: () {},
                            ),
                          ),
                          Expanded(
                            child: FlatButton(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add,
                                    color: yellowColor,
                                  ),
                                  Text(
                                    "Follow",
                                    style: TextStyle(color: yellowColor),
                                  ),
                                ],
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(SimpleLineIcons.compass),
                                  ),
                                  Text("Places"),
                                  Text("12"),
                                ],
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(SimpleLineIcons.calendar),
                                  ),
                                  Text("Events"),
                                  Text("7"),
                                ],
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(SimpleLineIcons.user),
                                  ),
                                  Text("Followers"),
                                  Text("120"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
