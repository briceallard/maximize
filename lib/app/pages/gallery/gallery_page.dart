import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  final TextEditingController _pinController = TextEditingController();

  bool _verified;

  @override
  void initState() {
    _verified = false;

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    User _user = Provider.of<User>(context);
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

    return Column(
      children: <Widget>[
        Text('Enter 4-digit pin:'),
        Container(
          width: deviceWidth,
          height: deviceHeight * 0.35,
          color: Colors.red,
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
                      borderRadius: BorderRadius.circular(8.0)),
                ),
                Container(
                  margin: EdgeInsets.all(3.0),
                  height: deviceHeight * 0.08,
                  width: deviceWidth * 0.16,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(8.0)),
                ),
                Container(
                  margin: EdgeInsets.all(3.0),
                  height: deviceHeight * 0.08,
                  width: deviceWidth * 0.16,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(8.0)),
                ),
                Container(
                  margin: EdgeInsets.all(3.0),
                  height: deviceHeight * 0.08,
                  width: deviceWidth * 0.16,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(8.0)),
                ),
              ],
            ),
          ),
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
