import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final double width;
  final BoxFit fit;
  final AssetImage image;
  final Color backgroundColor;
  final Color borderColor;

  UserAvatar({
    Key key,
    @required this.width,
    this.fit = BoxFit.contain,
    @required this.image,
    this.backgroundColor = Colors.transparent,
    this.borderColor = Colors.transparent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: width,
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: 1.0,
        ),
        image: DecorationImage(image: image, fit: fit),
      ),
    );
  }
}
