import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:flutter_web/pages/dashboard_page.dart';
import 'package:flutter_web/services/apis.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatelessWidget {
  String token;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FlutterLogin(
          title: 'Canteen Inventory System',
          logo: 'assets/food_logo.png',
          showDebugButtons: true,
          onLogin: _loginUser,
          onSignup: _signUpUser,
          onRecoverPassword: _recoverPassword,
          emailValidator: (value) {
            return null;
          },
          onSubmitAnimationCompleted: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) =>
                    DashboardPage(token: token == null ? '' : token),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<String> _loginUser(LoginData p1) async {
    try {
      token = await APIs().postAuth(p1);
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> _signUpUser(LoginData p1) {}

  Future<String> _recoverPassword(String p1) {}
}
