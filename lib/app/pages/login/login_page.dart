import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:maximize/app/repositories/auth_repository.dart';
import 'package:maximize/app/utils/constants/pages.dart';
import 'package:maximize/app/utils/constants/resources.dart';
import 'package:provider/provider.dart';

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

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.black.withOpacity(0.0),
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.black,
      systemNavigationBarIconBrightness: Brightness.light,
    ));

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
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Positioned(
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
          ),
          Positioned(
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
                  stops: [0.0, 0.8],
                  tileMode: TileMode.clamp,
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.4,
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
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _pageController.jumpToPage(0);
                          });
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: currentPageIndex == 0
                                ? Colors.black
                                : Colors.grey,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5.0),
                        width: 25.0,
                        height: 2.0,
                        alignment: Alignment.center,
                        color: currentPageIndex == 0
                                ? Colors.green
                                : Colors.transparent,
                      )
                    ],
                  ),
                  Container(
                    height: 25.0,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 0.7,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _pageController.jumpToPage(1);
                          });
                        },
                        child: Text(
                          'Signup',
                          style: TextStyle(
                            color: currentPageIndex == 1
                                ? Colors.black
                                : Colors.grey,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5.0),
                        width: 25.0,
                        height: 2.0,
                        alignment: Alignment.center,
                        color: currentPageIndex == 1
                                ? Colors.green
                                : Colors.transparent,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.47,
            left: 0.0,
            right: 0.0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.53,
              child: PageView(
                controller: _pageController,
                physics: NeverScrollableScrollPhysics(),
                children: <Widget>[
                  Container(
                    color: Colors.red,
                  ),
                  Container(
                    color: Colors.green,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 75.0,
            left: 0.0,
            right: 0.0,
            child: Image(
              fit: BoxFit.contain,
              image: AssetImage(Resources.logo),
              height: 175.0,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     key: _scaffoldKey,
  //     backgroundColor: Colors.white,
  //     body: Stack(
  //       fit: StackFit.expand,
  //       children: <Widget>[
  //         // _buildBackground(),
  //         ListView(
  //           children: <Widget>[
  //             _buildLogo(),
  //             _buildLoginForm(),
  //             _signInButton(),
  //             _signUpLink(),
  //           ],
  //         )
  //       ],
  //     ),
  //   );
  // }

  // Widget _buildBackground() {
  //   return Container(
  //     decoration: BoxDecoration(
  //       image: DecorationImage(
  //         fit: BoxFit.cover,
  //         image: AssetImage(Resources.splash_bg),
  //       ),
  //     ),
  //     child: BackdropFilter(
  //       filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
  //       child: Container(
  //         decoration: BoxDecoration(
  //           color: Colors.white.withOpacity(0.2),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _buildLogo() {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .30,
      alignment: Alignment.center,
      child: Hero(
        tag: 'Logo',
        child: Image(
          fit: BoxFit.contain,
          height: _animationLogo.value,
          image: AssetImage(Resources.logo),
        ),
      ),
    );
  }

  Widget _buildLoginForm() {
    return Form(
      key: _loginFormKey,
      child: Container(
        margin: EdgeInsets.only(top: 50.0),
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _emailTextField(),
            _passwordTextField(),
            _forgotPasswordLink(),
          ],
        ),
      ),
    );
  }

  // Widget _glassTextField() {
  //   return Row(
  //     mainAxisSize: MainAxisSize.max,
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: <Widget>[
  //       Container(
  //         width: MediaQuery.of(context).size.width * .80,
  //         decoration: BoxDecoration(
  //           color: Colors.white.withOpacity(0.2),
  //           border: Border.all(color: Colors.black),
  //           borderRadius: BorderRadius.all(Radius.circular(10.0)),
  //         ),
  //         child: ClipRRect(
  //           borderRadius: BorderRadius.all(Radius.circular(10.0)),
  //           child: BackdropFilter(
  //             filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
  //             child: TextFormField(
  //               controller: emailController,
  //               keyboardType: TextInputType.emailAddress,
  //               decoration: InputDecoration(
  //                 prefixIcon: Icon(Icons.email),
  //                 isDense: true,
  //                 labelText: 'Email Address',
  //                 border: InputBorder.none,
  //               ),
  //             ),
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  Widget _emailTextField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.email),
        Container(
          margin: EdgeInsets.only(bottom: 20.0),
          width: MediaQuery.of(context).size.width * .70,
          child: TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              isDense: true,
              labelText: 'Email Address',
            ),
            // style: CustomTheme().formField,
          ),
        ),
      ],
    );
  }

  Widget _passwordTextField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.vpn_key),
        Container(
          width: MediaQuery.of(context).size.width * .70,
          child: TextFormField(
            controller: passwordController,
            obscureText: _obscurePassword,
            decoration: InputDecoration(
              isDense: true,
              labelText: 'Password',
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
            // style: CustomTheme().formField,
          ),
        ),
      ],
    );
  }

  Widget _forgotPasswordLink() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          GestureDetector(
            onTap: () => Navigator.of(context).pushNamed(Pages.forgotPassword),
            child: Text(
              'Forgot Password?',
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _signInButton() {
    return Opacity(
      opacity: _animationButton.value,
      child: Center(
        child: Container(
          margin: EdgeInsets.only(top: 50.0, bottom: 15.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.amber[300],
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.6),
                blurRadius: 3.0,
                offset: Offset(3.0, 3.0),
              ),
            ],
          ),
          child: MaterialButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 60.0),
              child: Provider.of<AuthRepository>(context).status ==
                      Status.Authenticating
                  ? Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14.0),
                      child: SizedBox(
                        height: 25.0,
                        width: 25.0,
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.white,
                          strokeWidth: 2.5,
                        ),
                      ),
                    )
                  : Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontFamily: 'Montserrat',
                          letterSpacing: 1.0,
                          fontWeight: FontWeight.w600),
                    ),
            ),
            onPressed: () =>
                //     Provider.of<AuthRepository>(context).signInWithEmailAndPassword(
                //   emailController.text,
                //   passwordController.text,
                // ),
                Navigator.of(context).pushNamed(Pages.home),
          ),
        ),
      ),
    );
  }

  Widget _signUpLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Don\'t have an account? ',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            'Sign up',
            style: TextStyle(
              color: Colors.amber[600],
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline,
            ),
          ),
        )
      ],
    );
  }

  void _toggleObscure() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }
}
