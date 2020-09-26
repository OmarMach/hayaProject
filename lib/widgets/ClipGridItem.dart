
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
      child: GridTile(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            height: 20,
            color: backgroundColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: primColor,
                  size: 85,
                ),
                Text(
                  category,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
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