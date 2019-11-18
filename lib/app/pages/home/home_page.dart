import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maximize/app/utils/constants/theme_data.dart';
import 'package:maximize/app/widgets/app_drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: CustomTheme.systemTheme,
      child: Scaffold(
        drawer: AppDrawer(),
        body: SafeArea(
          child: Center(
            child: Text('Home Page'),
          ),
        ),
      ),
    );
  }
}
