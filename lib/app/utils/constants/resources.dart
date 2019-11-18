class Resources {
  static const String logo = 'assets/images/logo.png';
  static const String splash_bg = 'assets/images/splash_bg.jpeg';
  static const String default_logo = 'assets/images/defualt_logo.png';
}

class Helper {
  double calculateHeightToInches(String feet, String inches) {
    try {
      return double.tryParse(feet) * 12 + double.tryParse(inches);
    } catch (e) {
      print(e.message);
    }

    return 0.0;
  }
}
