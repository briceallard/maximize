import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:maximize/app/utils/constants/resources.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage(Resources.splash_bg)),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                ),
              ),
            ),
          ),
          Center(
            child: Image(
              image: AssetImage(Resources.logo),
              color: Colors.black.withOpacity(0.8),
              width: MediaQuery.of(context).size.width * .50,
            ),
          )
        ],
      ),
    );
  }
}
