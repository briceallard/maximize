import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maximize/app/models/user_model.dart';
import 'package:maximize/app/utils/constants/theme_data.dart';
import 'package:maximize/app/widgets/app_drawer.dart';
import 'package:maximize/app/widgets/custom_appbar.dart';
import 'package:maximize/app/widgets/custom_fab.dart';
import 'package:provider/provider.dart';

class WeightsPage extends StatefulWidget {
  @override
  _WeightsPage createState() => _WeightsPage();
}

class _WeightsPage extends State<WeightsPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
    User _user = Provider.of<User>(context);
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
          child: ListView(
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
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            'Weight ',
            style: TextStyle(
              fontSize: 28.0,
              color: Colors.red[600],
              fontWeight: FontWeight.w800,
            ),
          ),
          Text(
            'History',
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
