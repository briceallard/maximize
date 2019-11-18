import 'package:flutter/material.dart';
import 'package:maximize/app/widgets/drawer_option.dart';

class Constants {
  static List<Widget> getDrawerOptions() {
    return [
      DrawerOption(
        title: 'Current Progress',
        iconData: Icons.score,
      ),
      DrawerOption(
        title: 'Workout History',
        iconData: Icons.assignment,
      ),
      DrawerOption(
        title: 'Weight Tracker',
        iconData: Icons.announcement,
      ),
      DrawerOption(
        title: 'Measurements',
        iconData: Icons.message,
      ),
      DrawerOption(
        title: 'Settings',
        iconData: Icons.settings,
      ),
    ];
  }
}
