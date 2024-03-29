import 'package:flutter/material.dart';
import 'package:maximize/app/utils/constants/resources.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final Function() onPressed;
  final List<Widget> actions;

  CustomAppBar({Key key, this.height = 60, this.onPressed, this.actions})
      : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: onPressed,
        icon: Icon(Icons.menu),
        color: Colors.black,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      centerTitle: true,
      title: Hero(
        tag: 'Logo',
        child: Image(
          alignment: Alignment.center,
          image: AssetImage(Resources.logo),
          height: 30.0,
        ),
      ),
      actions: actions,
    );
  }
}
