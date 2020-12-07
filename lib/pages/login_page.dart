import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:flutter_web/pages/dashboard_page.dart';
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
    var response = await http.post('http://127.0.0.1:8000/auth/',
        body: {'username': p1.name, 'password': p1.password});
    token = response.body;
    // return token;
  }

  Future<String> _signUpUser(LoginData p1) {}

  Future<String> _recoverPassword(String p1) {}
}
