import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:maximize/app/models/user_model.dart';
import 'package:maximize/app/utils/constants/theme_data.dart';
import 'package:maximize/app/widgets/app_drawer.dart';
import 'package:maximize/app/widgets/custom_appbar.dart';
import 'package:maximize/app/widgets/custom_fab.dart';
import 'package:provider/provider.dart';

class GalleryPage extends StatefulWidget {
  @override
  _GalleryPage createState() => _GalleryPage();
}

class _GalleryPage extends State<GalleryPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _pin1 = TextEditingController();
  final TextEditingController _pin2 = TextEditingController();
  final TextEditingController _pin3 = TextEditingController();
  final TextEditingController _pin4 = TextEditingController();

  bool _verified;
  User _user;

  @override
  void initState() {
    _verified = false;

    super.initState();
  }

  @override
  void dispose() {
    _pin1.dispose();
    _pin2.dispose();
    _pin3.dispose();
    _pin4.dispose();
    super.dispose();
  }

  TextEditingController getPinPosition() {
    if (_pin1.text.isEmpty) {
      return _pin1;
    } else if (_pin2.text.isEmpty) {
      return _pin2;
    } else if (_pin3.text.isEmpty) {
      return _pin3;
    } else {
      return _pin4;
    }
  }

  void enterPinDigit(String value) {
    TextEditingController position = getPinPosition();
    position.text = value;
  }

  String getEnteredPin() => _pin1.text + _pin2.text + _pin3.text + _pin4.text;

  @override
  Widget build(BuildContext context) {
    _user = Provider.of<User>(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: CustomTheme.systemTheme,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: CustomAppBar(
          onPressed: () => _scaffoldKey.currentState.openDrawer(),
        ),
        drawer: AppDrawer(scaffoldKey: _scaffoldKey),
        floatingActionButton: !_user.securePhotos ? CustomFab() : null,
        body: SafeArea(
          child: _user.securePhotos ? _enterPinPage() : _galleryPage(),
        ),
      ),
    );
  }

  Widget _galleryPage() {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: <Widget>[
        _buildTitle(),
        Container(
          margin: EdgeInsets.only(top: 25.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[],
          ),
        )
      ],
    );
  }

  Widget _enterPinPage() {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return _verified
        ? _galleryPage()
        : Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text('Enter 4-digit pin:'),
              Container(
                width: deviceWidth,
                height: deviceHeight * 0.35,
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(3.0),
                        height: deviceHeight * 0.08,
                        width: deviceWidth * 0.16,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Center(
                          child: TextField(
                            controller: _pin1,
                            textAlign: TextAlign.center,
                            readOnly: true,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                            style: TextStyle(
                                fontSize: 28.0, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(3.0),
                        height: deviceHeight * 0.08,
                        width: deviceWidth * 0.16,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Center(
                          child: TextField(
                            controller: _pin2,
                            textAlign: TextAlign.center,
                            readOnly: true,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                            style: TextStyle(
                              fontSize: 28.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(3.0),
                        height: deviceHeight * 0.08,
                        width: deviceWidth * 0.16,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Center(
                          child: TextField(
                            controller: _pin3,
                            textAlign: TextAlign.center,
                            readOnly: true,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                            style: TextStyle(
                              fontSize: 28.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(3.0),
                        height: deviceHeight * 0.08,
                        width: deviceWidth * 0.16,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Center(
                          child: TextField(
                            controller: _pin4,
                            textAlign: TextAlign.center,
                            readOnly: true,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                            style: TextStyle(
                              fontSize: 28.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Flex(
                direction: Axis.horizontal,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      enterPinDigit('1');
                      print('1 pressed');
                    },
                    child: Container(
                      height: deviceHeight * 0.1,
                      width: deviceWidth * 0.20,
                      child: Center(
                        child: Text(
                          '1',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 42.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      enterPinDigit('2');
                      print('2 pressed');
                    },
                    child: Container(
                      height: deviceHeight * 0.1,
                      width: deviceWidth * 0.20,
                      child: Center(
                        child: Text(
                          '2',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 42.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      enterPinDigit('3');
                      print('3 pressed');
                    },
                    child: Container(
                      height: deviceHeight * 0.1,
                      width: deviceWidth * 0.20,
                      child: Center(
                        child: Text(
                          '3',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 42.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Flex(
                direction: Axis.horizontal,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      enterPinDigit('4');
                      print('4 pressed');
                    },
                    child: Container(
                      height: deviceHeight * 0.1,
                      width: deviceWidth * 0.20,
                      child: Center(
                        child: Text(
                          '4',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 42.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      enterPinDigit('5');
                      print('5 pressed');
                    },
                    child: Container(
                      height: deviceHeight * 0.1,
                      width: deviceWidth * 0.20,
                      child: Center(
                        child: Text(
                          '5',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 42.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      enterPinDigit('6');
                      print('6 pressed');
                    },
                    child: Container(
                      height: deviceHeight * 0.1,
                      width: deviceWidth * 0.20,
                      child: Center(
                        child: Text(
                          '6',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 42.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Flex(
                direction: Axis.horizontal,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      enterPinDigit('7');
                      print('7 pressed');
                    },
                    child: Container(
                      height: deviceHeight * 0.1,
                      width: deviceWidth * 0.20,
                      child: Center(
                        child: Text(
                          '7',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 42.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      enterPinDigit('8');
                      print('8 pressed');
                    },
                    child: Container(
                      height: deviceHeight * 0.1,
                      width: deviceWidth * 0.20,
                      child: Center(
                        child: Text(
                          '8',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 42.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      enterPinDigit('9');
                      print('9 pressed');
                    },
                    child: Container(
                      height: deviceHeight * 0.1,
                      width: deviceWidth * 0.20,
                      child: Center(
                        child: Text(
                          '9',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 42.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Flex(
                direction: Axis.horizontal,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      if (_pin4.text.isNotEmpty) {
                        _pin4.text = '';
                      } else if (_pin3.text.isNotEmpty) {
                        _pin3.text = '';
                      } else if (_pin2.text.isNotEmpty) {
                        _pin2.text = '';
                      } else {
                        _pin1.text = '';
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 30.0),
                      height: deviceHeight * 0.1,
                      width: deviceWidth * 0.20,
                      child: Center(
                        child: Icon(FontAwesomeIcons.backspace, size: 22.0),
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      enterPinDigit('0');
                      print('0 pressed');
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 30.0),
                      height: deviceHeight * 0.1,
                      width: deviceWidth * 0.20,
                      child: Center(
                        child: Text(
                          '0',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 42.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      String pin = getEnteredPin();
                      if (pin == _user.pin) {
                        print('Pin validated. Access granted');
                        setState(() {
                          _verified = true;
                        });
                      } else {
                        print('Pin incorrect. Access denied');
                        _scaffoldKey.currentState.showSnackBar(SnackBar(
                          content: Text('Invalid PIN. Try again ... '),
                          duration: Duration(seconds: 3),
                        ));
                        _pin1.text = _pin2.text = _pin3.text = _pin4.text = '';
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 30.0),
                      height: deviceHeight * 0.1,
                      width: deviceWidth * 0.20,
                      child: Center(
                        child: Icon(
                          FontAwesomeIcons.check,
                          size: 22.0,
                          color: Colors.red[600],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
  }

  Widget _buildTitle() {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            'My ',
            style: TextStyle(
              fontSize: 28.0,
              color: Colors.red[600],
              fontWeight: FontWeight.w800,
            ),
          ),
          Text(
            'Photos',
            style: TextStyle(
              fontSize: 28.0,
              color: Colors.black,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}
