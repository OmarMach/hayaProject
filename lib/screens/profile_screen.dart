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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () => {},
                          icon: const Icon(Icons.settings),
                        ),
                        IconButton(
                          onPressed: () => {},
                          icon: const Icon(Icons.edit),
                        )
                      ],
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(75),
                      child: Image.asset(
                        'assets/images/profile.png',
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 25),
                    Text(
                      "Omar Mach",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      const Icon(Icons.star),
                      const SizedBox(width: 5),
                      const Icon(Icons.star),
                      const SizedBox(width: 5),
                      const Icon(Icons.star),
                      const SizedBox(width: 5),
                      const Icon(Icons.star_half),
                      const SizedBox(width: 5),
                      const Icon(Icons.star_border),
                      const SizedBox(width: 5),
                      const Text("50+ Review"),
                    ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: FlatButton(
                            onPressed: () {},
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
                          ),
                        ),
                        Expanded(
                          child: FlatButton(
                            onPressed: () {},
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
                          ),
                        ),
                      ],
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(SimpleLineIcons.compass),
                                ),
                                const Text("Places"),
                                const Text("12"),
                              ],
                            ),
                            Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(SimpleLineIcons.calendar),
                                ),
                                const Text("Events"),
                                const Text("7"),
                              ],
                            ),
                            Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
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
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Events Created",
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          buildEventRow(),
                          buildEventRow(),
                          buildEventRow(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Testimonials",
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                    buildTestimonial(),
                    SizedBox(height: 10),
                    buildTestimonial(),
                    SizedBox(height: 10),
                    buildTestimonial(),
                    // TODO : Add show more/less expansion panel.
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Column buildTestimonial() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(75),
              child: Image.asset(
                'assets/images/profile.png',
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
            Flexible(
              // this widget doesn't let the text overflow but make auto line breaks
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("${_profileInfo['name']}"),
                    Row(
                      children: [
                        const Icon(Icons.star, size: 15),
                        const Icon(Icons.star, size: 15),
                        const Icon(Icons.star, size: 15),
                        const Icon(Icons.star_border, size: 15),
                        const Icon(Icons.star_border, size: 15),
                      ],
                    ),
                    Text(
                        "It' was a great experience, very professional and smooth. ")
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Container buildEventRow() {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(
            style: BorderStyle.solid,
            color: backgroundColor,
            width: 0.5,
          ),
        ),
        child: Column(
          children: [
            Image.asset(
              'assets/images/campingVector.png',
              fit: BoxFit.fill,
              //TODO : make this responsive + make a proportional constant resizing ration
              height: 75,
            ),
            Row(
              //TODO : Finish this part
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star),
                Icon(Icons.star),
                Icon(Icons.star),
                Icon(Icons.star_border),
                Icon(Icons.star_border),
              ],
            ),
            Text("Camping site name"),
            Text("10 Participants"),
          ],
        ));
  }
}
