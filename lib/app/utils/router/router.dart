import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:maximize/app/pages/home/home_page.dart';
import 'package:maximize/app/pages/login/login_page.dart';
import 'package:maximize/app/utils/constants/pages.dart';
import 'package:maximize/app/utils/router/transitions.dart';

class Router {
  final RouteObserver<PageRoute> routeObserver;

  Router() : routeObserver = RouteObserver<PageRoute>();

  Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Pages.home:
        return _buildSlideLeftRoute(HomePage());
      case Pages.login:
        return _buildSlideBottomRoute(LoginPage());
      default:
        return null;
    }
  }

  SlideLeftRoute _buildSlideLeftRoute(Widget page) {
    return new SlideLeftRoute(page: page);
  }

  SlideRightRoute _buildSlideRightRoute(Widget page) {
    return new SlideRightRoute(page: page);
  }

  SlideTopRoute _buildSlideTopRoute(Widget page) {
    return new SlideTopRoute(page: page);
  }

  SlideBottomRoute _buildSlideBottomRoute(Widget page) {
    return new SlideBottomRoute(page: page);
  }
}
