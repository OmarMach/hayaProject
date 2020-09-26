import 'package:flutter/material.dart';
import 'package:haya/screens/browse_events_screen.dart';

class BrowseRegionsScreen extends StatelessWidget {
  static const routeName = "/browse";

  @override
  Widget build(BuildContext context) {
    final Map<String, String> images = {
      'Jendouba':
          'https://i.pinimg.com/564x/e8/8c/81/e88c81f6480cfecdf646599f08fa3111.jpg',
      'Beja':
          'https://i.pinimg.com/originals/26/2f/1c/262f1c9af1aadb251706be59487e8a31.jpg',
      'Ariana':
          'https://www.tunisienumerique.com/wp-content/uploads/2019/06/ariana-1.jpg',
      'Ben Arous':
          'https://demenagementtunisie.com/wp-content/uploads/2018/11/ben-arous-borj-cedria-tunisie-3.jpg',
      'Tunis': 'https://assets3.thrillist.com/v1/image/2855008/1200x630',
      'Zaghouan':
          'https://1001tunisie.com/wp-content/uploads/2012/07/zaghouane.jpg',
      'Benzart':
          "https://www.voyage-tunisie.info/wp-content/uploads/2017/12/Le-vieux-port-de-Bizerte3-800x500.jpg",
      'Kef': "https://www.marhba.com/images/nosexperiences/kefcover.png",
      'Tabarka':
          "https://upload.wikimedia.org/wikipedia/commons/6/64/Tabarka_tunisie_5.jpg",
      'Nabeul':
          "https://lp-cms-production.imgix.net/2019-06/c1115fba05d34dea133251a1bc8021fc-nabeul.jpg?fit=crop&q=40&sharp=10&vib=20&auto=format&ixlib=react-8.6.4",
    };

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 1,
                childAspectRatio: 2.4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                physics: ScrollPhysics(),
                children: images.entries
                    .map((e) => _buildRegionItem(e, context))
                    .toList(),
              )
            ],
          ),
        ),
      ),
    );
  }

  InkWell _buildRegionItem(MapEntry<String, String> e, BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(BrowseEventsScreen.routeName);
      },
      child: GridTile(
        header: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Icon(
                    Icons.event,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10),
                  Text(
                    '10',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image.network(
              e.value,
              fit: BoxFit.cover,
              filterQuality: FilterQuality.low,
            ),
            Container(
              color: Color.fromRGBO(89,99,72, 0.5),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                e.key,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
