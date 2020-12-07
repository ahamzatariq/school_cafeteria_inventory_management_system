import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:flutter_web/pages/dashboard_page.dart';
import 'package:http/http.dart' as http;

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
    var response = http.post('http://127.0.0.1:8000/auth/', body: p1);
    print(response);
  }

  Future<String> _signUpUser(LoginData p1) {

  }


  Future<String> _recoverPassword(String p1) {
  }
}
