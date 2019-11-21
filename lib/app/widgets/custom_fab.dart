import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:maximize/app/utils/constants/pages.dart';

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
  Animation<double> _animatedOpacity;
  Animation<double> _animateIcon;
  Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;
  double _fabHeight = 48.0;

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
      end: Colors.grey[900],
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(0.00, 1.00, curve: Curves.linear),
    ));

    _animatedOpacity = Tween<double>(
      begin: 0.0,
      end: 1.0,
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
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value * 4.0,
            0.0,
          ),
          child: weight(),
        ),
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value * 3.0,
            0.0,
          ),
          child: workout(),
        ),
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value * 2.0,
            0.0,
          ),
          child: schedule(),
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
    return AnimatedOpacity(
      opacity: _animatedOpacity.value,
      duration:
          isOpened ? Duration(milliseconds: 200) : Duration(milliseconds: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Add weight',
            style: TextStyle(
              color: Colors.black,
              fontSize: 13.0,
              fontWeight: FontWeight.w400,
              shadows: [
                Shadow(
                  color: Colors.black,
                  blurRadius: 0.8,
                  offset: Offset(0.0, 0.0),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 5.0, left: 10.0),
            child: FloatingActionButton(
              mini: true,
              heroTag: 'Btn1',
              elevation: isOpened ? 3.0 : 0.0,
              onPressed: null,
              child: Padding(
                padding: EdgeInsets.only(bottom: 4.0),
                child: Icon(
                  FontAwesomeIcons.weight,
                  size: 18.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget workout() {
    return AnimatedOpacity(
      opacity: _animatedOpacity.value,
      duration:
          isOpened ? Duration(milliseconds: 200) : Duration(milliseconds: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Add a workout',
            style: TextStyle(
              color: Colors.black,
              fontSize: 13.0,
              fontWeight: FontWeight.w400,
              shadows: [
                Shadow(
                  color: Colors.black,
                  blurRadius: 0.8,
                  offset: Offset(0.0, 0.0),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 5.0, left: 10.0),
            child: FloatingActionButton(
              mini: true,
              heroTag: 'Btn2',
              elevation: isOpened ? 3.0 : 0.0,
              onPressed: null,
              child: Padding(
                padding: EdgeInsets.only(bottom: 2.0, right: 4.0),
                child: Icon(
                  FontAwesomeIcons.dumbbell,
                  size: 18.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget schedule() {
    return AnimatedOpacity(
      opacity: _animatedOpacity.value,
      duration:
          isOpened ? Duration(milliseconds: 200) : Duration(milliseconds: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Create event',
            style: TextStyle(
              color: Colors.black,
              fontSize: 13.0,
              fontWeight: FontWeight.w400,
              shadows: [
                Shadow(
                  color: Colors.black,
                  blurRadius: 0.8,
                  offset: Offset(0.0, 0.0),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 5.0, left: 10.0),
            child: FloatingActionButton(
              mini: true,
              heroTag: 'Btn3',
              elevation: isOpened ? 3.0 : 0.0,
              onPressed: null,
              child: Padding(
                padding: EdgeInsets.only(bottom: 3.0, left: 0.0),
                child: Icon(
                  FontAwesomeIcons.calendarWeek,
                  size: 18.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget image() {
    return AnimatedOpacity(
      opacity: _animatedOpacity.value,
      duration:
          isOpened ? Duration(milliseconds: 200) : Duration(milliseconds: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Take a photo',
            style: TextStyle(
              color: Colors.black,
              fontSize: 13.0,
              fontWeight: FontWeight.w400,
              shadows: [
                Shadow(
                  color: Colors.black,
                  blurRadius: 0.8,
                  offset: Offset(0.0, 0.0),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 5.0, left: 10.0),
            child: FloatingActionButton(
              mini: true,
              heroTag: 'Btn4',
              elevation: isOpened ? 3.0 : 0.0,
              onPressed: () => Navigator.of(context).pushNamed(Pages.addPhoto),
              child: Padding(
                padding: EdgeInsets.only(bottom: 3.0, left: 2.0),
                child: Icon(
                  FontAwesomeIcons.fileImage,
                  size: 18.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget toggle() {
    return Container(
      child: FloatingActionButton(
        heroTag: 'Btn5',
        elevation: 3.0,
        backgroundColor: _buttonColor.value,
        onPressed: animate,
        tooltip: 'Add Item',
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
