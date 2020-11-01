import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:haya/config.dart';

class SelectedEventScreen extends StatelessWidget {
  static const routeName = "/event";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: 'omar',
                child: Image.asset(
                  'assets/images/campingVector.png',
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Cool event name',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline3.copyWith(
                        color: yellowColor,
                        fontWeight: FontWeight.w100,
                      ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlineButton(
                    borderSide: BorderSide(
                      color: lightBlueColor,
                    ),
                    onPressed: () {},
                    highlightedBorderColor: yellowColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                          color: lightBlueColor,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Join',
                          style: TextStyle(
                            color: lightBlueColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  OutlineButton(
                    borderSide: BorderSide(
                      color: lightBlueColor,
                    ),
                    onPressed: () {},
                    highlightedBorderColor: yellowColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.share,
                          size: 15,
                          color: lightBlueColor,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Share',
                          style: TextStyle(
                            color: lightBlueColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  OutlineButton(
                    borderSide: BorderSide(
                      color: lightBlueColor,
                    ),
                    onPressed: () {},
                    highlightedBorderColor: yellowColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person_pin,
                          size: 15,
                          color: lightBlueColor,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Invite',
                          style: TextStyle(
                            color: lightBlueColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 10),
                    Text(
                      'Description',
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(color: lightBlueColor),
                    ),
                    SizedBox(height: 10),
                    Text(
                      placeHolderText,
                      textAlign: TextAlign.justify,
                      maxLines: 5,
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            SimpleLineIcons.compass,
                            color: lightBlueColor,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Location : Somewhere, Planet Earth",
                            style: TextStyle(),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            SimpleLineIcons.user,
                            color: lightBlueColor,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Organizer : Haya admin",
                            style: TextStyle(),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            SimpleLineIcons.fire,
                            color: lightBlueColor,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Category : Camping",
                            style: TextStyle(),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            SimpleLineIcons.calendar,
                            color: lightBlueColor,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "19-20-21 November 2020 ",
                            style: TextStyle(),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
