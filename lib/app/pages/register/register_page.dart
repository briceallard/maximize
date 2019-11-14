import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:maximize/app/models/user_model.dart';
import 'package:maximize/app/pages/register/register_page2.dart';
import 'package:maximize/app/repositories/auth_repository.dart';
import 'package:maximize/app/utils/constants/pages.dart';
import 'package:maximize/app/utils/constants/theme_data.dart';
import 'package:maximize/app/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();

  bool _obscurePassword = true;
  String _firstNameError = '';
  String _lastNameError = '';
  String _emailError = '';
  String _passwordError = '';
  String _passwordConfirmError = '';

  AnimationController _animationController;

  final _user = User.initial();

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    )
      ..addListener(() {
        setState(() {});
      })
      ..forward();

    _obscurePassword = true;
    _firstNameError = '';
    _lastNameError = '';
    _emailError = '';
    _passwordError = '';
    _passwordConfirmError = '';
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: CustomTheme.systemTheme,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: CustomAppBar(),
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            children: <Widget>[
              _buildTitle(),
              _buildSubTitle(),
              _buildRegisterForm(),
              _buildNextButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            'Sign ',
            style: TextStyle(
              fontSize: 28.0,
              color: Colors.red[600],
              fontWeight: FontWeight.w800,
            ),
          ),
          Text(
            'Up',
            style: TextStyle(
              fontSize: 28.0,
              color: Colors.black,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubTitle() {
    return Text(
      'Start maximizing your performance today!',
      style: TextStyle(
        color: Colors.black,
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildRegisterForm() {
    return Form(
      key: _registerFormKey,
      child: Container(
        margin: EdgeInsets.only(top: 40.0),
        padding: EdgeInsets.symmetric(horizontal: 14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _firstNameTextField(),
            _lastNameTextField(),
            _emailTextField(),
            _passwordTextField(),
            _passwordConfirmTextField(),
          ],
        ),
      ),
    );
  }

  Widget _firstNameTextField() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'First Name',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.05,
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          margin: EdgeInsets.only(top: 5.0),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black.withOpacity(0.2)),
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 5.0,
                offset: Offset(3.0, 3.0),
              ),
            ],
          ),
          child: TextFormField(
            controller: firstNameController,
            validator: (value) {
              if (value.isEmpty) {
                setState(() {
                  _firstNameError = 'First name must not be empty';
                });
              } else if (value.length < 2) {
                setState(() {
                  _firstNameError = 'First name is not long enough';
                });
              } else {
                setState(() {
                  _firstNameError = '';
                });
              }
            },
            onSaved: (value) => setState(() => _user.fName = value),
            keyboardType: TextInputType.text,
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 10.0),
              hasFloatingPlaceholder: false,
              border: InputBorder.none,
            ),
            style: TextStyle(
              color: Colors.black,
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Container(
          height: 20.0,
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          alignment: Alignment.topLeft,
          child: Text(
            _firstNameError,
            style: TextStyle(
              color: Colors.red,
              fontSize: 10.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _lastNameTextField() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'Last Name',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.05,
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          margin: EdgeInsets.only(top: 5.0),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black.withOpacity(0.2)),
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 5.0,
                offset: Offset(3.0, 3.0),
              ),
            ],
          ),
          child: TextFormField(
            controller: lastNameController,
            validator: (value) {
              if (value.isEmpty) {
                setState(() {
                  _lastNameError = 'Last name must not be empty';
                });
              } else if (value.length < 2) {
                setState(() {
                  _lastNameError = 'Last name is not long enough';
                });
              } else {
                setState(() {
                  _lastNameError = '';
                });
              }
            },
            onSaved: (value) => setState(() => _user.lName = value),
            keyboardType: TextInputType.text,
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 10.0),
              hasFloatingPlaceholder: false,
              border: InputBorder.none,
            ),
            style: TextStyle(
              color: Colors.black,
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Container(
          height: 20.0,
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          alignment: Alignment.topLeft,
          child: Text(
            _lastNameError,
            style: TextStyle(
              color: Colors.red,
              fontSize: 10.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _emailTextField() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'Email Address',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.05,
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          margin: EdgeInsets.only(top: 5.0),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black.withOpacity(0.2)),
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 5.0,
                offset: Offset(3.0, 3.0),
              ),
            ],
          ),
          child: TextFormField(
            controller: emailController,
            validator: (value) {
              if (value.isEmpty) {
                setState(() {
                  _emailError = 'Email must not be empty';
                });
              } else if (!EmailValidator.validate(value)) {
                setState(() {
                  _emailError = 'Email must be formatted properly';
                });
              } else {
                setState(() {
                  _emailError = '';
                });
              }
            },
            onSaved: (value) => setState(() => _user.email = value),
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 10.0),
              hasFloatingPlaceholder: false,
              border: InputBorder.none,
            ),
            style: TextStyle(
              color: Colors.black,
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Container(
          height: 20.0,
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          alignment: Alignment.topLeft,
          child: Text(
            _emailError,
            style: TextStyle(
              color: Colors.red,
              fontSize: 10.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _passwordTextField() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'Password',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.05,
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          margin: EdgeInsets.only(top: 5.0),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black.withOpacity(0.2)),
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 5.0,
                offset: Offset(3.0, 3.0),
              ),
            ],
          ),
          child: TextFormField(
            controller: passwordController,
            validator: (value) {
              if (value.isEmpty) {
                setState(() {
                  _passwordError = 'Password must not be empty';
                });
              } else if (value.length < 6) {
                setState(() {
                  _passwordError =
                      'Password must be at least 6 characters or digits';
                });
              } else {
                setState(() {
                  _passwordError = '';
                });
              }
            },
            obscureText: _obscurePassword,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 10.0),
              hasFloatingPlaceholder: false,
              border: InputBorder.none,
              suffixIcon: GestureDetector(
                onTap: () => _toggleObscure(),
                child: Icon(
                  _obscurePassword
                      ? FontAwesomeIcons.eye
                      : FontAwesomeIcons.eyeSlash,
                  color: Colors.black,
                  size: 16.0,
                ),
              ),
            ),
            style: TextStyle(
              color: Colors.black,
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
              letterSpacing: _obscurePassword ? 1.0 : 0.0,
            ),
          ),
        ),
        Container(
          height: 20.0,
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          alignment: Alignment.topLeft,
          child: Text(
            _passwordError,
            style: TextStyle(
              color: Colors.red,
              fontSize: 10.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _passwordConfirmTextField() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'Confirm Password',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.05,
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          margin: EdgeInsets.only(top: 5.0),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black.withOpacity(0.2)),
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 5.0,
                offset: Offset(3.0, 3.0),
              ),
            ],
          ),
          child: TextFormField(
            controller: passwordConfirmController,
            validator: (value) {
              if (value != passwordController.text) {
                setState(() {
                  _passwordConfirmError = 'Passwords do not match';
                });
              } else {
                setState(() {
                  _passwordConfirmError = '';
                });
              }
            },
            obscureText: _obscurePassword,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 10.0),
              hasFloatingPlaceholder: false,
              border: InputBorder.none,
              suffixIcon: GestureDetector(
                onTap: () => _toggleObscure(),
                child: Icon(
                  _obscurePassword
                      ? FontAwesomeIcons.eye
                      : FontAwesomeIcons.eyeSlash,
                  color: Colors.black,
                  size: 16.0,
                ),
              ),
            ),
            style: TextStyle(
              color: Colors.black,
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
              letterSpacing: _obscurePassword ? 1.0 : 0.0,
            ),
          ),
        ),
        Container(
          height: 20.0,
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          alignment: Alignment.topLeft,
          child: Text(
            _passwordConfirmError,
            style: TextStyle(
              color: Colors.red,
              fontSize: 10.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNextButton() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        alignment: Alignment.bottomRight,
        margin: EdgeInsets.only(right: 16.0),
        height: MediaQuery.of(context).size.height * 0.04,
        width: 100.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.red[600],
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 5.0,
              offset: Offset(3.0, 3.0),
            ),
          ],
        ),
        child: Center(
          child: MaterialButton(
            minWidth: 100.0,
            splashColor: Colors.black38,
            highlightColor: Colors.transparent,
            child: Text(
              'Next',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            onPressed: () {
              if (_registerFormKey.currentState.validate()) {
                _registerFormKey.currentState.save();
                _user.save();
              } else {
                _scaffoldKey.currentState.showSnackBar(
                  SnackBar(
                    content: Text('There was an error.'),
                  ),
                );
              }

              if (_firstNameError == '' &&
                  _lastNameError == '' &&
                  _emailError == '' &&
                  _passwordError == '' &&
                  _passwordConfirmError == '') {
                _user.displayName = _user.fName + ' ' + _user.lName;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegisterPageTwo(user: _user),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  void _toggleObscure() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }
}
