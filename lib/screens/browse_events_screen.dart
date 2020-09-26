import 'package:flutter/material.dart';
import 'package:haya/config.dart';
import 'package:haya/screens/selected_event_screen.dart';

class BrowseEventsScreen extends StatelessWidget {
  static const routeName = "/browse/events";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
      ),
    );
  }

  Widget _buildEventItem(BuildContext context, String heroTag) {
    return Container(
      color: backgroundColor,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(SelectedEventScreen.routeName);
        },
        child: GridTile(
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
                    'assets/images/camping.jpg',
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
                      Text(
                        "Camping ben guerden",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "This is the event's description please read it carefully before going into things you might regret one day lol.",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(Icons.place),
                            Text("Ben guerden"),
                            SizedBox(width: 10),
                            Icon(Icons.person),
                            Text("+20")
                          ],
                        ),
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
