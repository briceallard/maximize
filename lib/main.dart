import 'package:flutter/material.dart';
import 'package:maximize/app/models/user_model.dart';
import 'package:maximize/app/pages/home/home_page.dart';
import 'package:maximize/app/pages/login/login_page.dart';
import 'package:maximize/app/pages/splash/splash_page.dart';
import 'package:maximize/app/repositories/auth_repository.dart';
import 'package:maximize/app/repositories/db_repository.dart';
import 'package:maximize/app/utils/router/router.dart';
import 'package:provider/provider.dart';

void main() => runApp(
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
              child: Maximize(),
            );
          },
        ),
      ),
    );

class Maximize extends StatelessWidget {
  final Router _router;

  Maximize() : _router = Router();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Maximize',
      color: Colors.white,
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
