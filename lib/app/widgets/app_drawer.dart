import 'package:flutter/material.dart';
import 'package:maximize/app/models/user_model.dart';
import 'package:maximize/app/repositories/auth_repository.dart';
import 'package:maximize/app/utils/constants/constants.dart';
import 'package:maximize/app/utils/constants/resources.dart';
import 'package:maximize/app/widgets/user_avatar.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  AppDrawer({@required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.65,
      padding: EdgeInsets.only(top: 30.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 16.0,
            color: Colors.black12,
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Column(
            children: <Widget>[
              Image(
                fit: BoxFit.contain,
                height: MediaQuery.of(context).size.height * 0.15,
                image: AssetImage(Resources.logo),
              ),
              Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () => print('Profile Image selected'),
                    child: UserAvatar(
                      width: 30.0,
                      fit: BoxFit.fitWidth,
                      image: AssetImage(Resources.default_profile),
                      backgroundColor: Colors.red,
                      borderColor: Colors.black,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        Provider.of<User>(context).displayName,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        Provider.of<User>(context).email,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 11.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Divider(color: Colors.grey, thickness: 1.0),
            ],
          ),
          Column(children: Constants.getDrawerOptions()),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomRight,
                  child: FlatButton(
                    onPressed: () async {
                      Navigator.of(context).pop();
                      await Provider.of<AuthRepository>(context).signOut();
                    },
                    child: Text(
                      'Sign Out',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
        // children: Constants.getDrawerOptions(),
      ),
    );
  }
}
