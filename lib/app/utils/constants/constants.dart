import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:maximize/app/widgets/drawer_option.dart';

class Constants {
  static List<Widget> getDrawerOptions() {
    return [
      DrawerOption(
        title: 'Progress',
        iconData: FontAwesomeIcons.tasks,
        iconSize: 20.0,
      ),
      DrawerOption(
        title: 'Workouts',
        iconData: FontAwesomeIcons.running,
        iconSize: 20.0,
      ),
      DrawerOption(
        title: 'Weight',
        iconData: FontAwesomeIcons.weight,
        iconSize: 20.0,
      ),
      DrawerOption(
        title: 'Measurements',
        iconData: FontAwesomeIcons.rulerHorizontal,
        iconSize: 20.0,
      ),
      DrawerOption(
        title: 'Gallery',
        iconData: FontAwesomeIcons.image,
        iconSize: 20.0,
      ),
    ];
  }
}
