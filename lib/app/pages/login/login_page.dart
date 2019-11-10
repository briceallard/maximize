import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:maximize/app/repositories/auth_repository.dart';
import 'package:maximize/app/utils/constants/pages.dart';
import 'package:maximize/app/utils/constants/resources.dart';
import 'package:provider/provider.dart';

class EmptyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  Size get preferredSize => Size(0.0, 0.0);
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _obscurePassword = true;

  AnimationController _animationController;
  Animation<double> _animationLogo;
  Animation<double> _animationButton;

  PageController _pageController = PageController();
  var currentPageIndex = 0.0;

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

    _animationLogo = Tween<double>(
      begin: 0.0,
      end: 200.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOutBack,
    ));

    _animationButton = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInCubic,
    ));

    _obscurePassword = true;

    _pageController.addListener(() {
      setState(() {
        currentPageIndex = _pageController.page;
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.black.withOpacity(0.0),
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));

    return Scaffold(
      key: _scaffoldKey,
      primary: false,
      appBar: EmptyAppBar(),
      backgroundColor: Colors.white,
      body: SafeArea(
        top: false,
        child: ListView(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  _buildBackground(),
                  _buildBackgroundOverlay(),
                  _buildToggleButtons(),
                  _buildPageView(),
                  _buildLogo(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackground() {
    return Positioned(
      top: 0.0,
      left: 0.0,
      right: 0.0,
      child: Container(
        height: MediaQuery.of(context).size.height * .60,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Resources.splash_bg),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.0),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBackgroundOverlay() {
    return Positioned(
      bottom: 0.0,
      left: 0.0,
      right: 0.0,
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.center,
            colors: [Colors.white.withOpacity(0.0), Colors.white],
            stops: [0.0, 0.9],
            tileMode: TileMode.clamp,
          ),
        ),
      ),
    );
  }

  Widget _buildToggleButtons() {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.50,
      left: 0.0,
      right: 0.0,
      child: Container(
        height: 64.0,
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildLoginPageButton(),
                _buildLoginPageButtonHighlight(),
              ],
            ),
            _buildDivider(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildSignupPageButton(),
                _buildSignupPageButtonHighlight(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginPageButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _pageController.jumpToPage(0);
        });
      },
      child: Text(
        'Login',
        style: TextStyle(
          color: currentPageIndex == 0 ? Colors.black : Colors.grey,
          fontSize: 16.0,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _buildLoginPageButtonHighlight() {
    return Container(
      margin: EdgeInsets.only(top: 5.0),
      width: 25.0,
      height: 2.0,
      alignment: Alignment.center,
      color: currentPageIndex == 0 ? Colors.red[600] : Colors.transparent,
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 25.0,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 0.7,
        ),
      ),
    );
  }

  Widget _buildSignupPageButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _pageController.jumpToPage(1);
        });
      },
      child: Text(
        'Signup',
        style: TextStyle(
          color: currentPageIndex == 1 ? Colors.black : Colors.grey,
          fontSize: 16.0,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _buildSignupPageButtonHighlight() {
    return Container(
      margin: EdgeInsets.only(top: 5.0),
      width: 25.0,
      height: 2.0,
      alignment: Alignment.center,
      color: currentPageIndex == 1 ? Colors.red[600] : Colors.transparent,
    );
  }

  Widget _buildPageView() {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.60,
      left: 0.0,
      right: 0.0,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.40,
        child: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            _buildLoginForm(),
            Container(
              color: Colors.green,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildLoginForm() {
    return Form(
      key: _loginFormKey,
      child: Container(
        margin: EdgeInsets.only(top: 20.0),
        padding: EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _emailTextField(),
            SizedBox(height: 20.0),
            _passwordTextField(),
            SizedBox(height: 40.0),
            _buildLoginButton(),
            _forgotPasswordLink(),
          ],
        ),
      ),
    );
  }

  Widget _emailTextField() {
    return Column(
      children: <Widget>[
        _buildEmailTextFieldTitle(),
        _buildEmailTextFieldInput(),
      ],
    );
  }

  Widget _buildEmailTextFieldTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          'Username',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildEmailTextFieldInput() {
    return Container(
      height: 40.0,
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      margin: EdgeInsets.only(top: 5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black.withOpacity(0.05)),
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 5.0,
            offset: Offset(1.0, 1.0),
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
          fontSize: 12.0,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _passwordTextField() {
    return Column(
      children: <Widget>[
        _buildPasswordTextFieldTitle(),
        _buildPasswordTextFieldInput(),
      ],
    );
  }

  Widget _buildPasswordTextFieldTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTextFieldInput() {
    return Container(
      height: 40.0,
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      margin: EdgeInsets.only(top: 5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black.withOpacity(0.05)),
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 5.0,
            offset: Offset(1.0, 1.0),
          ),
        ],
      ),
      child: TextFormField(
        controller: passwordController,
        obscureText: _obscurePassword,
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
              size: 14.0,
            ),
          ),
        ),
        style: TextStyle(
          color: Colors.black,
          fontSize: _obscurePassword ? 18.0 : 12.0,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return Opacity(
      opacity: _animationButton.value,
      child: Center(
        child: Container(
          height: 40.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.red[600],
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                blurRadius: 5.0,
                offset: Offset(2.0, 2.0),
              ),
            ],
          ),
          child: MaterialButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Provider.of<AuthRepository>(context).status ==
                      Status.Authenticating
                  ? Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.5),
                      child: SizedBox(
                        height: 20.0,
                        width: 20.0,
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.white,
                          strokeWidth: 2.5,
                        ),
                      ),
                    )
                  : Text(
                      'Log In',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
            ),
            onPressed: () async {
              try {
                await Provider.of<AuthRepository>(context)
                    .signInWithEmailAndPassword(
                  emailController.text,
                  passwordController.text,
                );

                Navigator.of(context).pushNamed(Pages.home);
              } catch (e) {
                if (e.code == 'ERROR_USER_NOT_FOUND') {
                  _scaffoldKey.currentState.showSnackBar(
                    SnackBar(
                      content: Text('Incorrect email or password.'),
                      duration: Duration(seconds: 3),
                    ),
                  );
                } else {
                  _scaffoldKey.currentState.showSnackBar(
                    SnackBar(
                      content: Text(e.message),
                      duration: Duration(seconds: 3),
                    ),
                  );
                }
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _forgotPasswordLink() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () => Navigator.of(context).pushNamed(Pages.forgotPassword),
            child: Text(
              'Forgot your password?',
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return Positioned(
      top: 100.0,
      left: 0.0,
      right: 0.0,
      child: Hero(
        tag: 'Logo',
        child: Image(
          fit: BoxFit.contain,
          image: AssetImage(Resources.logo),
          height: _animationLogo.value,
          color: Colors.black,
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
