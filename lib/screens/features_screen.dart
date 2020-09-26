import 'package:flutter/material.dart';

class FeaturesScreen extends StatelessWidget {
  static const routeName = '/feature';
  @override
  Widget build(BuildContext context) {
    final src =
        'https://images.pexels.com/photos/3561946/pexels-photo-3561946.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940';
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.all(10.0),
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: ScrollPhysics(),
              children: [
                FeaturedItem(src: src),
                FeaturedItem(
                    src:
                        'https://images.pexels.com/photos/775201/pexels-photo-775201.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                FeaturedItem(
                    src:
                        'https://images.pexels.com/photos/3031075/pexels-photo-3031075.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
              ],
            )),
      ),
    );
  }
}

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({
    Key key,
    @required this.src,
  }) : super(key: key);

  final String src;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.95,
          padding: EdgeInsets.all(10),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  src,
                  height: MediaQuery.of(context).size.height * 0.95,
                  width: MediaQuery.of(context).size.width * 0.95,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    Text(
                      'This is a sponsorized event, the content will be previewed once the application opens',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
