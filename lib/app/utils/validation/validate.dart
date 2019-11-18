import 'package:email_validator/email_validator.dart';

class Validate {
  String value;

  Validate({this.value});

  String validateFirstName() {
    if (value.isEmpty) {
      return 'First name must not be empty';
    } else if (value.length < 2) {
      return 'First name is not long enough';
    } else {
      return '';
    }
  }

  String validateLastName() {
    if (value.isEmpty) {
      return 'First name must not be empty';
    } else if (value.length < 2) {
      return 'First name is not long enough';
    } else {
      return '';
    }
  }

  String validateEmailAddress() {
    if (value.isEmpty) {
      return 'Email must not be empty';
    } else if (!EmailValidator.validate(value)) {
      return 'Email must be formatted properly';
    } else {
      return '';
    }
  }

  String validatePassword() {
    if (value.isEmpty) {
      return 'Password must not be empty';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters or digits';
    } else {
      return '';
    }
  }

  String validateConfirmPassword(String password) {
    if (value.isEmpty) {
      return 'Password must not be empty';
    } else if (value != password) {
      return 'Passwords do not match';
    } else {
      return '';
    }
  }

  String validateWeight() {
    try {
      double weight = double.tryParse(value);

      if (weight <= 0 || weight >= 500) {
        return 'Weight must be between 0-500';
      }
    } catch (e) {
      print(e.message);
      return 'Value must be a number';
    }

    return '';
  }

  String validateHeightFeet() {
    try {
      double height = double.tryParse(value);

      if(height <= 0 || height >= 12) {
        return 'Impossible height';
      }
    } catch (e) {
      print(e.message);
      return 'Value must be a number';
    }

    return '';
  }

  String validateHeightInches() {
    try {
      double height = double.tryParse(value);

      if(height <= 0 || height > 12) {
        return 'Inches must be between 0-12';
      }
    } catch (e) {
      print(e.message);
      return 'Value must be a number';
    }

    return '';
  }
}
