import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:maximize/app/models/user_model.dart';
import 'package:maximize/app/repositories/auth_repository.dart';
import 'package:maximize/app/utils/constants/theme_data.dart';
import 'package:maximize/app/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';

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

  AnimationController _animationController;
  Animation<double> _animationButton;

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

    _animationButton = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInCubic,
    ));

    _obscurePassword = true;
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
            SizedBox(height: 20.0),
            _lastNameTextField(),
            SizedBox(height: 20.0),
            _emailTextField(),
            SizedBox(height: 20.0),
            _passwordTextField(),
            SizedBox(height: 20.0),
            _passwordConfirmTextField(),
            SizedBox(height: 20.0),
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
            keyboardType: TextInputType.text,
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(
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
            keyboardType: TextInputType.text,
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(
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
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
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
            obscureText: _obscurePassword,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
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
                )),
            style: TextStyle(
              color: Colors.black,
              fontSize: _obscurePassword ? 14.0 : 12.0,
              fontWeight: _obscurePassword ? FontWeight.w600 : FontWeight.w400,
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
              'Password Confirm',
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
            obscureText: _obscurePassword,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
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
                )),
            style: TextStyle(
              color: Colors.black,
              fontSize: _obscurePassword ? 14.0 : 12.0,
              fontWeight: _obscurePassword ? FontWeight.w600 : FontWeight.w400,
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
                _scaffoldKey.currentState.showSnackBar(
                  SnackBar(
                    content: Text('Invalid data submitted.'),
                    duration: Duration(seconds: 3),
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
