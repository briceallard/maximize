import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maximize/app/models/user_model.dart';
import 'package:maximize/app/pages/home/home_page.dart';
import 'package:maximize/app/pages/login/login_page.dart';
import 'package:maximize/app/pages/splash/splash_page.dart';
import 'package:maximize/app/repositories/auth_repository.dart';
import 'package:maximize/app/repositories/db_repository.dart';
import 'package:maximize/app/utils/constants/theme_data.dart';
import 'package:maximize/app/utils/router/router.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then(
    (_) => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<AuthRepository>.value(
              value: AuthRepository.instance()),
          ChangeNotifierProvider<DatabaseService>.value(
              value: DatabaseService.instance()),
        ],
        child: Consumer(
          builder: (BuildContext context, AuthRepository auth, _) {
            return StreamProvider<User>.value(
              initialData: User.initial(),
              value: DatabaseService.instance().getUser(auth.firebaseUser),
              child: MaximizeApp(),
            );
          },
        ),
      ),
    ),
  );
}

class MaximizeApp extends StatelessWidget {
  final Router _router;

  MaximizeApp() : _router = Router();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Maximize',
      theme: CustomTheme.lightTheme,
      // darkTheme: CustomTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      // theme: CustomTheme().themeData,
      home: Authorize(),
      onGenerateRoute: _router.getRoute,
      navigatorObservers: [_router.routeObserver],
    );
  }
}

class Authorize extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, AuthRepository auth, _) {
        switch (auth.status) {
          case Status.Uninitialized:
            return SplashPage();
          case Status.Unauthenticated:
            return LoginPage();
          case Status.Authenticating:
            return LoginPage();
          case Status.Authenticated:
            return HomePage();
          default:
            return LoginPage();
        }
      },
    );
  }
}
