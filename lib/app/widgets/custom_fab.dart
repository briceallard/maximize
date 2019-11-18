import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomFab extends StatefulWidget {
  final Function() onPressed;
  final String tooltip;
  final IconData icon;

  CustomFab({Key key, this.onPressed, this.tooltip, this.icon})
      : super(key: key);

  @override
  _CustomFabState createState() => _CustomFabState();
}

class _CustomFabState extends State<CustomFab>
    with SingleTickerProviderStateMixin {
  bool isOpened = false;
  AnimationController _animationController;
  Animation<Color> _buttonColor;
  Animation<double> _animateIcon;
  Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;
  double _fabHeight = 56.0;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    )..addListener(() {
        setState(() {});
      });

    _animateIcon = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_animationController);

    _buttonColor = ColorTween(
      begin: Colors.red[600],
      end: Colors.grey[700],
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(0.00, 1.00, curve: Curves.linear),
    ));

    _translateButton = Tween<double>(
      begin: _fabHeight,
      end: -10.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(0.0, 0.75, curve: _curve),
    ));

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value * 3.0,
            0.0,
          ),
          child: weight(),
        ),
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value * 2.0,
            0.0,
          ),
          child: workout(),
        ),
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value,
            0.0,
          ),
          child: image(),
        ),
        toggle(),
      ],
    );
  }

  Widget weight() {
    return Container(
      child: FloatingActionButton(
        elevation: 3.0,
        onPressed: null,
        tooltip: 'Weight',
        child: Padding(
          padding: EdgeInsets.only(bottom: 4.0, left: 0.0),
          child: Icon(
            FontAwesomeIcons.weight,
            size: 16.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget workout() {
    return Container(
      child: FloatingActionButton(
        elevation: 3.0,
        onPressed: null,
        tooltip: 'Workout',
        child: Padding(
          padding: EdgeInsets.only(bottom: 3.0, right: 3.0),
          child: Icon(
            FontAwesomeIcons.dumbbell,
            size: 16.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget image() {
    return Container(
      child: FloatingActionButton(
        elevation: 3.0,
        onPressed: null,
        tooltip: 'Photo',
        child: Padding(
          padding: EdgeInsets.only(bottom: 3.0, left: 2.0),
          child: Icon(
            FontAwesomeIcons.fileImage,
            size: 18.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget toggle() {
    return Container(
      child: FloatingActionButton(
        elevation: 3.0,
        backgroundColor: _buttonColor.value,
        onPressed: animate,
        tooltip: 'Toggle',
        child: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          size: 20.0,
          color: Colors.white,
          progress: _animateIcon,
        ),
      ),
    );
  }

  animate() {
    if (!isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    isOpened = !isOpened;
  }
}
