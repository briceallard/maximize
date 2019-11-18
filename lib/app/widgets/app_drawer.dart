import 'package:flutter/material.dart';
import 'package:maximize/app/models/user_model.dart';
import 'package:maximize/app/utils/constants/constants.dart';
import 'package:maximize/app/utils/constants/resources.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
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
                  CircleAvatar(
                    radius: 25.0,
                    backgroundImage: AssetImage(Resources.default_logo),
                  ),
                  Text(Provider.of<User>(context).email)
                ],
              )
            ],
          )
        ],
        // children: Constants.getDrawerOptions(),
      ),
    );
  }
}
