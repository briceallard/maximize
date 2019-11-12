import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTheme {
  static const SystemUiOverlayStyle systemTheme = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
  );

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.white,
    primaryColor: Colors.white,
    primaryColorBrightness: Brightness.light,
    // accentColor: Colors.red[600],
    accentColorBrightness: Brightness.light,
    canvasColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    bottomAppBarColor: Colors.white,
    cardColor: Colors.white,
    dividerColor: Colors.grey,
    focusColor: Colors.transparent,
    hoverColor: Colors.transparent,
    // highlightColor: Colors.red[600],
    splashColor: Colors.transparent,
    backgroundColor: Colors.white,
    dialogBackgroundColor: Colors.white,
    hintColor: Colors.grey,
    errorColor: Colors.red,
    fontFamily: 'Montserrat',
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    // primarySwatch: Colors.grey[900],
  );
}
