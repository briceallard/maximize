import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maximize/app/repositories/auth_repository.dart';
import 'package:maximize/app/utils/constants/pages.dart';
import 'package:maximize/app/utils/constants/resources.dart';
import 'package:provider/provider.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

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
      primary: false,
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: Hero(
          tag: 'Logo',
          child: Image(
            alignment: Alignment.center,
            image: AssetImage(Resources.logo),
            height: 30.0,
          ),
        ),
      ),
      body: SafeArea(
        top: true,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            SizedBox(height: 20.0),
            _buildTitle(),
            _buildForgotText(),
            SizedBox(height: 30.0),
            _buildInstructionText(),
            _buildLoginForm(),
            _signInButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      'Whoops!',
      style: TextStyle(
        color: Colors.black,
        fontSize: 48.0,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget _buildForgotText() {
    return Text(
      'Forgot password? No problem!',
      style: TextStyle(
          color: Colors.amber[600],
          fontSize: 14.0,
          fontWeight: FontWeight.w400),
    );
  }

  Widget _buildInstructionText() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 30),
      child: Text(
        'Enter the email address associated with the account and we\'ll send you a reset link!',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 14.0,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }

  Widget _buildLoginForm() {
    return Form(
      key: _formKey,
      child: Container(
        margin: EdgeInsets.only(top: 30.0),
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _emailTextField(),
          ],
        ),
      ),
    );
  }

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
              child: Text(
                'Reset',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontFamily: 'Montserrat',
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.w600),
              ),
            ),
            onPressed: () async {
              try {
                await Provider.of<AuthRepository>(context)
                    .forgotPassword(emailController.text);
              } catch (e) {
                if (e.code == 'ERROR_USER_NOT_FOUND') {
                  _scaffoldKey.currentState.showSnackBar(
                    SnackBar(
                      content:
                          Text('Email not found. Check email and try again!'),
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
}
