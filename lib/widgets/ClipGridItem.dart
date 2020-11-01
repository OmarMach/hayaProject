import 'package:flutter/material.dart';

import '../config.dart';

class ClipGridItem extends StatelessWidget {
  final icon;
  final category;
  final routeName;
  const ClipGridItem({
    this.category,
    this.icon,
    this.routeName,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
      child: Container(
        height: 20,
        decoration: BoxDecoration(
          border: Border.all(
            color: lighterprimColor,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 50,
            ),
            Text(
              category,
            ),
          ],
        ),
      ),
    );
  }
}
