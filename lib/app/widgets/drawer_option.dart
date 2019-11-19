import 'package:flutter/material.dart';

class DrawerOption extends StatelessWidget {
  final String title;
  final IconData iconData;
  final double iconSize;

  DrawerOption({
    Key key,
    @required this.title,
    @required this.iconData,
    this.iconSize = 18,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      height: MediaQuery.of(context).size.height * 0.05,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
          Icon(iconData, size: iconSize),
        ],
      ),
    );
  }
}
