import 'package:flutter/material.dart';
import 'package:maximize/app/widgets/drawer_option.dart';

class Constants {
  static List<Widget> getDrawerOptions() {
    return [
      DrawerOption(
        title: 'Scores',
        iconData: Icons.score,
      ),
      DrawerOption(
        title: 'Assignments',
        iconData: Icons.assignment,
      ),
      DrawerOption(
        title: 'Announcements',
        iconData: Icons.announcement,
      ),
      DrawerOption(
        title: 'Messages',
        iconData: Icons.message,
      ),
      DrawerOption(
        title: 'Settings',
        iconData: Icons.settings,
      ),
    ];
  }
}
