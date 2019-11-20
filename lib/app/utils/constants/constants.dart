import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:maximize/app/utils/constants/pages.dart';
import 'package:maximize/app/widgets/drawer_option.dart';

class Constants {
  static List<Widget> getDrawerOptions() {
    return [
      DrawerOption(
        title: 'Progress',
        navigatePage: Pages.home,
        iconData: FontAwesomeIcons.tasks,
        iconSize: 20.0,
      ),
      DrawerOption(
        title: 'Schedule',
        navigatePage: Pages.schedule,
        iconData: FontAwesomeIcons.calendarWeek,
        iconSize: 20.0,
      ),
      DrawerOption(
        title: 'Workouts',
        navigatePage: Pages.workouts,
        iconData: FontAwesomeIcons.running,
        iconSize: 20.0,
      ),
      DrawerOption(
        title: 'Weight',
        navigatePage: Pages.weights,
        iconData: FontAwesomeIcons.weight,
        iconSize: 20.0,
      ),
      DrawerOption(
        title: 'Measurements',
        navigatePage: Pages.measurements,
        iconData: FontAwesomeIcons.rulerHorizontal,
        iconSize: 20.0,
      ),
      DrawerOption(
        title: 'Gallery',
        navigatePage: Pages.gallery,
        iconData: FontAwesomeIcons.image,
        iconSize: 20.0,
      ),
    ];
  }
}
