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
    primarySwatch: MaterialColor(0xFFFFFFFF, <int, Color>{
      50: const Color(0xFFFFFFFF),
      100: const Color(0xFFFFFFFF),
      200: const Color(0xFFFFFFFF),
      300: const Color(0xFFFFFFFF),
      400: const Color(0xFFFFFFFF),
      500: const Color(0xFFFFFFFF),
      600: const Color(0xFFFFFFFF),
      700: const Color(0xFFFFFFFF),
      800: const Color(0xFFFFFFFF),
      900: const Color(0xFFFFFFFF),
    }),
    primaryColor: Colors.white,
    primaryColorBrightness: Brightness.light,
    primaryColorLight: Colors.white,
    primaryColorDark: Colors.grey[900],
    accentColor: Colors.red[600],
    accentColorBrightness: Brightness.light,
    canvasColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    bottomAppBarColor: Colors.white,
    cardColor: Colors.white,
    cursorColor: Colors.red[600],
    textSelectionColor: Colors.red[600].withOpacity(0.6),
    textSelectionHandleColor: Colors.red[600],
    dividerColor: Colors.grey,
    splashColor: Colors.transparent,
    backgroundColor: Colors.white,
    dialogBackgroundColor: Colors.white,
    indicatorColor: Colors.red[600],
    hintColor: Colors.grey,
    errorColor: Colors.red,
    fontFamily: 'Montserrat',
    appBarTheme: AppBarTheme(
      color: Colors.transparent,
      elevation: 0.0,
      brightness: Brightness.light,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: MaterialColor(0x212121, <int, Color>{
      50: const Color(0x212121),
      100: const Color(0x212121),
      200: const Color(0x212121),
      300: const Color(0x212121),
      400: const Color(0x212121),
      500: const Color(0x212121),
      600: const Color(0x212121),
      700: const Color(0x212121),
      800: const Color(0x212121),
      900: const Color(0x212121),
    }),
    primaryColor: Colors.grey[900],
    primaryColorBrightness: Brightness.dark,
    primaryColorLight: Colors.white,
    primaryColorDark: Colors.grey[900],
    accentColor: Colors.red[600],
    accentColorBrightness: Brightness.light,
    canvasColor: Colors.grey[900],
    scaffoldBackgroundColor: Colors.grey[900],
    bottomAppBarColor: Colors.grey[900],
    cardColor: Colors.grey[800],
    dividerColor: Colors.grey,
    splashColor: Colors.transparent,
    backgroundColor: Colors.grey[900],
    dialogBackgroundColor: Colors.grey[900],
    indicatorColor: Colors.red[600],
    hintColor: Colors.white,
    errorColor: Colors.red,
    fontFamily: 'Montserrat',
    appBarTheme: AppBarTheme(
      color: Colors.transparent,
      elevation: 0.0,
      brightness: Brightness.dark,
    ),
  );
}
