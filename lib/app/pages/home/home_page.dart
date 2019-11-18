import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maximize/app/utils/constants/resources.dart';
import 'package:maximize/app/utils/constants/theme_data.dart';
import 'package:maximize/app/widgets/app_drawer.dart';
import 'package:maximize/app/widgets/custom_appbar.dart';
import 'package:maximize/app/widgets/custom_fab.dart';
import 'package:maximize/app/widgets/user_avatar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: CustomTheme.systemTheme,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: CustomAppBar(
          onPressed: () => _scaffoldKey.currentState.openDrawer(),
        ),
        drawer: AppDrawer(scaffoldKey: _scaffoldKey),
        floatingActionButton: CustomFab(),
        body: SafeArea(
          child: Center(
            child: Text('Home Page'),
          ),
        ),
      ),
    );
  }
}
