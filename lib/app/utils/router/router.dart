import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:maximize/app/pages/addPages/add_photo.dart';
import 'package:maximize/app/pages/forgotPassword/forgot_password.dart';
import 'package:maximize/app/pages/gallery/gallery_page.dart';
import 'package:maximize/app/pages/home/home_page.dart';
import 'package:maximize/app/pages/login/login_page.dart';
import 'package:maximize/app/pages/measurements/measurements_page.dart';
import 'package:maximize/app/pages/register/register_page.dart';
import 'package:maximize/app/pages/schedule/schedule_page.dart';
import 'package:maximize/app/pages/weights/weights_page.dart';
import 'package:maximize/app/pages/workouts/workouts_page.dart';
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
      case Pages.forgotPassword:
        return _buildSlideBottomRoute(ForgotPasswordPage());
      case Pages.register:
        return _buildSlideBottomRoute(RegisterPage());
      case Pages.schedule:
        return _buildSlideLeftRoute(SchedulePage());
      case Pages.workouts:
        return _buildSlideLeftRoute(WorkoutsPage());
      case Pages.weights:
        return _buildSlideLeftRoute(WeightsPage());
      case Pages.measurements:
        return _buildSlideLeftRoute(MeasurementsPage());
      case Pages.gallery:
        return _buildSlideLeftRoute(GalleryPage());
      case Pages.addPhoto:
        return _buildSlideTopRoute(AddPhotoPage());
      default:
        return null;
    }
  }

  SlideLeftRoute _buildSlideLeftRoute(Widget page) {
    return new SlideLeftRoute(page: page);
  }

  // SlideRightRoute _buildSlideRightRoute(Widget page) {
  //   return new SlideRightRoute(page: page);
  // }

  SlideTopRoute _buildSlideTopRoute(Widget page) {
    return new SlideTopRoute(page: page);
  }

  SlideBottomRoute _buildSlideBottomRoute(Widget page) {
    return new SlideBottomRoute(page: page);
  }
}
