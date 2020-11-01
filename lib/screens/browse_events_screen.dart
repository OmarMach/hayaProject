import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:haya/config.dart';
import 'package:haya/screens/selected_event_screen.dart';

class BrowseEventsScreen extends StatelessWidget {
  static const routeName = "/browse/events";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              child: GridView.count(
                crossAxisCount: 1,
                childAspectRatio: 2,
                shrinkWrap: true,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                physics: ScrollPhysics(),
                children: <Widget>[
                  _buildEventItem(context, 'omar'),
                  _buildEventItem(context, 'omar23'),
                  _buildEventItem(context, 'omar15e'),
                  _buildEventItem(context, 'omar156'),
                  _buildEventItem(context, 'omar15'),
                  _buildEventItem(context, 'omar2'),
                  _buildEventItem(context, 'omar1'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEventItem(BuildContext context, String heroTag) {
    return Container(
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(SelectedEventScreen.routeName);
        },
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
            color: lightBlueColor,
            style: BorderStyle.solid,
            width: 0.2,
          )),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Hero(
                  tag: heroTag,
                  transitionOnUserGestures: false,
                  child: Image.asset(
                    'assets/images/campingVector.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Long camping name",
                          style: TextStyle(
                            fontSize: 20,
                            color: yellowColor,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                SimpleLineIcons.compass,
                                size: 15,
                                color: lightBlueColor,
                              ),
                              SizedBox(width: 10),
                              Text("Somewhere, Planet earth"),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(
                                SimpleLineIcons.people,
                                color: lightBlueColor,
                                size: 15,
                              ),
                              SizedBox(width: 10),
                              Text("Community : Haya comms"),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(
                                SimpleLineIcons.fire,
                                color: lightBlueColor,
                                size: 15,
                              ),
                              SizedBox(width: 10),
                              Text("Category : Camping"),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(
                                SimpleLineIcons.calendar,
                                color: lightBlueColor,
                                size: 15,
                              ),
                              SizedBox(width: 10),
                              Text("19/11/2020 - 21/11/2020"),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
