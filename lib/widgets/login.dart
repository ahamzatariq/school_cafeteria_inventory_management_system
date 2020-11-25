import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:flutter_web/pages/dashboard_page.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlutterLogin(
        title: 'Canteen Inventory System',
        logo: 'assets/food_logo.png',
        showDebugButtons: true,
        onLogin: _loginUser,
        onSignup: _signUpUser,
        onRecoverPassword: _recoverPassword,
        onSubmitAnimationCompleted: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => DashboardPage(),
            ),
          );
        },
      ),
    );
  }

  Future<String> _loginUser(LoginData p1) {

  }

  Future<String> _signUpUser(LoginData p1) {

  }


  Future<String> _recoverPassword(String p1) {
  }
}
