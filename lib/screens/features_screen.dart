import 'package:flutter/material.dart';
import 'package:haya/config.dart';

class FeaturesScreen extends StatelessWidget {
  static const routeName = '/feature';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final src2 =
        'https://cdn.pixabay.com/photo/2016/10/14/19/21/canyon-1740973_960_720.jpg';
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    color: primColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/images/profile.png"),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Good Morning, Haya Admin"),
                                Text(
                                  placeHolderText,
                                  style: TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    OutlineButton(
                      borderSide: BorderSide(
                        color: lightBlueColor,
                      ),
                      highlightedBorderColor: yellowColor,
                      textColor: lightBlueColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.search),
                          Text("Find"),
                        ],
                      ),
                      onPressed: () {},
                    ),
                    OutlineButton(
                      borderSide: BorderSide(
                        color: lightBlueColor,
                      ),
                      highlightedBorderColor: yellowColor,
                      textColor: lightBlueColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add),
                          Text("Create"),
                        ],
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text("News", style: titleStyle),
                SizedBox(height: 10),
                Container(
                  color: lightBlueColor,
                  height: size.height * 0.20,
                  width: size.width * 0.20,
                ),
                SizedBox(height: 10),
                Text("Favourite Clubs", style: titleStyle),
                SizedBox(height: 10),
                Container(
                  color: lightBlueColor,
                  height: size.height * 0.20,
                  width: size.width * 0.20,
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Locations", style: titleStyle),
                    Text("...", style: titleStyle),
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  // color: primColor,
                  height: size.height * 0.25,
                  width: size.width * 0.20,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        FavLocation(src2: src2, size: size),
                        FavLocation(src2: src2, size: size),
                        FavLocation(src2: src2, size: size),
                        FavLocation(src2: src2, size: size),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FavLocation extends StatelessWidget {
  const FavLocation({
    Key key,
    @required this.src2,
    @required this.size,
  }) : super(key: key);

  final String src2;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: size.width * .40,
            color: lightBlueColor,
            child: Center(
              child: Text(
                "Location Name",
                style: darkTitle,
              ),
            ),
          ),
          Image.network(
            src2,
            width: size.width * .40,
          ),
          Container(
              padding: EdgeInsets.all(10),
              width: size.width * .39,
              color: lightBlueColor,
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Event 1",
                      style: darkTitle,
                    ),
                    Text(
                      "Get lost in the beauty of Place1, where you can find sunny beaches, ",
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
