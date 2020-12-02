import 'package:flutter/material.dart';
import 'package:flutter_web/menu_pages/items_page.dart';
import 'package:flutter_web/style.dart';

import 'menu_pages/purchase_page.dart';
import 'widgets/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        textTheme: TextTheme(
          headline1: Style().headline1,
          headline2: Style().headline2,
          headline3: Style().headline3,
          headline4: Style().headline4,
        ),
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        ItemsPage.routeName: (context) => ItemsPage(),
        PurchasePage.routeName: (context) => PurchasePage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Login(),
      // Login(),
    );
  }
}
