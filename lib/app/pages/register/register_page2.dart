import 'package:flutter/material.dart';
import 'package:maximize/app/models/user_model.dart';

class RegisterPageTwo extends StatelessWidget {
  User user;

  RegisterPageTwo({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(user.displayName),
      ),
    );
  }
}
