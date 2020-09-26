import 'package:flutter/material.dart';
import 'package:haya/config.dart';

class SelectedEventScreen extends StatelessWidget {
  static const routeName = "/event";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Event\'s title and some text',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: titleColor.withOpacity(0.5)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Hero(
                      tag: 'omar',
                      child: Image.asset(
                        'assets/images/camping.jpg',
                        height: 250,
                        fit: BoxFit.fitWidth,
                      )),
                ),
              ),
              SizedBox(height: 10),
              Text(
                placeHolderText,
                textAlign: TextAlign.justify,
                maxLines: 5,
              ),
              SizedBox(height: 10),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          height: 100,
                          color: primColor,
                          padding: EdgeInsets.all(15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor: backgroundColor,
                                child: Icon(
                                  Icons.person,
                                  color: primColor,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Omar Mach',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: backgroundColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 25),
                    Flexible(
                      flex: 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          height: 100,
                          color: primColor,
                          padding: EdgeInsets.all(15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '+25',
                                style: TextStyle(
                                  color: backgroundColor,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Participant',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: backgroundColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 25),
                    Flexible(
                      flex: 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding: EdgeInsets.all(15),
                          color: primColor,
                          height: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '19',
                                style: TextStyle(
                                  color: backgroundColor,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'November',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: backgroundColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10),
              RaisedButton(
                color: titleColor.withOpacity(0.9),
                onPressed: () {},
                child: Text(
                  'Participate',
                  style: TextStyle(
                    color: backgroundColor,
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
