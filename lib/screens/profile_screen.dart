import 'package:flutter/material.dart';
import 'package:haya/config.dart';
import 'package:haya/screens/selected_event_screen.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = '/profile';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // these variables are used to expand and minimise the profile sections
  bool personalInformation = true;
  bool organizedEvents = true;
  bool reviews = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(
                      flex: 2,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                          // height: 200,
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Flexible(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Jonas Flert',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Multi-places experienced guide',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: titleColor),
                          ),
                          Text(
                              "Lorem ipsum sit dolor amen, sit solodekro klsmz lsml"),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Icon(Icons.star, color: titleColor),
                              Icon(Icons.star, color: titleColor),
                              Icon(Icons.star, color: titleColor),
                              Icon(Icons.star, color: titleColor),
                              Icon(Icons.star_border, color: titleColor),
                              Text(' - 200'),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  height: 100,
                                  padding: EdgeInsets.all(10),
                                  color: backgroundColor,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '12',
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        'Events \norganized',
                                        textAlign: TextAlign.center,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  height: 100,
                                  padding: EdgeInsets.all(10),
                                  color: backgroundColor,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '12',
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        'Events \norganized',
                                        textAlign: TextAlign.center,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      personalInformation = !personalInformation;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Personal Informations',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: titleColor,
                      ),
                    ],
                  ),
                ),
                !personalInformation
                    ? Container()
                    : Card(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text('Phone number : '),
                                  Text('+216 54 155 569'),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Text('Address : '),
                                  Text('Omran Sup, Tunis, Tunisia'),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Text('Email : '),
                                  Text('Lorem@ipsum.sit'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                InkWell(
                  onTap: () {
                    setState(() {
                      organizedEvents = !organizedEvents;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Organised events',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: titleColor,
                      ),
                    ],
                  ),
                ),
                !organizedEvents
                    ? Container()
                    : Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: ListView(
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          children: [
                            Column(
                              children: [
                                CardItems(),
                                CardItems(),
                                CardItems(),
                              ],
                            ),
                          ],
                        ),
                      ),
                InkWell(
                  onTap: () {
                    setState(() {
                      reviews = !reviews;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Reviews',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: titleColor,
                      ),
                    ],
                  ),
                ),
                !reviews
                    ? Container()
                    : ListView(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: [
                          CardReviewItem(),
                          CardReviewItem(),
                          CardReviewItem(),
                          CardReviewItem(),
                        ],
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CardReviewItem extends StatelessWidget {
  const CardReviewItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text('Jon Doe'),
        subtitle: Text('This person is amazing, would recommend him.'),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(
              'https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
        ),
      ),
    );
  }
}

class CardItems extends StatelessWidget {
  const CardItems({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.camera_front),
        title: Text('Long event name'),
        subtitle: Row(
          children: [
            Icon(Icons.star),
            Icon(Icons.star),
            Icon(Icons.star),
            Icon(Icons.star),
            Icon(Icons.star_border),
          ],
        ),
        trailing: IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed(SelectedEventScreen.routeName);
          },
          icon: Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
