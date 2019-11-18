import 'package:flutter/material.dart';

class DrawerOption extends StatelessWidget {
  final String title;
  final IconData iconData;

  DrawerOption({
    Key key,
    @required this.title,
    @required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      height: 35.0,
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(
          color: Colors.black12,
          width: 1.0,
        ),
      )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontSize: 14.0),
          ),
          SizedBox(width: 25.0),
          Icon(iconData, size: 18.0),
        ],
      ),
    );
  }
}
