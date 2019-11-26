import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:maximize/app/models/user_model.dart';
import 'package:maximize/app/repositories/auth_repository.dart';
import 'package:maximize/app/repositories/db_repository.dart';
import 'package:maximize/app/repositories/photo_repository.dart';
import 'package:maximize/app/utils/constants/resources.dart';
import 'package:maximize/app/utils/constants/theme_data.dart';
import 'package:maximize/app/widgets/custom_register_appbar.dart';
import 'package:provider/provider.dart';

class AddPhotoPage extends StatefulWidget {
  @override
  _AddPhotoPageState createState() => _AddPhotoPageState();
}

class _AddPhotoPageState extends State<AddPhotoPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final _photoService = PhotoService();

  User _user;
  DatabaseService _db;
  FirebaseUser _fbUser;

  File _image;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _user = Provider.of<User>(context);
    _db = Provider.of<DatabaseService>(context);
    _fbUser = Provider.of<AuthRepository>(context).firebaseUser;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: CustomTheme.systemTheme,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: CustomRegisterAppBar(
          actions: <Widget>[
            FlatButton(
              onPressed: () async {
                _image == null
                    ? _scaffoldKey.currentState.showSnackBar(SnackBar(
                        content: Text('No image to save.'),
                        duration: Duration(seconds: 3),
                      ))
                    : await _db
                        .uploadImage(_user, _fbUser, _image)
                        .then((_) => Navigator.of(context).pop());
              },
              child: Text(
                'Save',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          ],
        ),
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              _buildPhotoPlaceHolder(),
              _buildOptions(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPhotoPlaceHolder() {
    return Container(
      margin: EdgeInsets.all(16.0),
      height: MediaQuery.of(context).size.height * 0.70,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: _image != null
            ? [
                BoxShadow(
                  blurRadius: 5.0,
                  offset: Offset(3.0, 3.0),
                ),
              ]
            : [],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: _image == null
            ? Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image(
                    image: AssetImage(Resources.camera_placeholder),
                    width: MediaQuery.of(context).size.width * 0.50,
                  ),
                  Text(
                    'Upload a new photo ...',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              )
            : Image.file(
                _image,
                fit: BoxFit.cover,
              ),
      ),
    );
  }

  Widget _buildOptions() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _buildCropOption(),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildOpenGalleryButton(),
                _buildOpenCameraButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCropOption() {
    return _image != null
        ? FlatButton.icon(
            onPressed: () {},
            icon: Icon(FontAwesomeIcons.cropAlt),
            label: Text('Crop Image'),
          )
        : Text('');
  }

  Widget _buildOpenGalleryButton() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.04,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.red[600],
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 5.0,
            offset: Offset(3.0, 3.0),
          ),
        ],
      ),
      child: MaterialButton(
        splashColor: Colors.black54,
        highlightColor: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            'Choose existing ...',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        onPressed: () async {
          File image = await _photoService.getGalleryPhoto();

          setState(() {
            _image = image;
          });
        },
      ),
    );
  }

  Widget _buildOpenCameraButton() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.04,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.red[600],
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 5.0,
            offset: Offset(3.0, 3.0),
          ),
        ],
      ),
      child: MaterialButton(
        splashColor: Colors.black54,
        highlightColor: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Take new photo',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        onPressed: () async {
          File image = await _photoService.getCameraPhoto();

          setState(() {
            _image = image;
          });
        },
      ),
    );
  }
}
