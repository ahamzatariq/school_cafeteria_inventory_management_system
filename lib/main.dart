import 'package:flutter/material.dart';
import 'package:flutter_web/pages/dashboard_page.dart';
import 'package:flutter_web/pages/items_table.dart';
import 'package:google_fonts/google_fonts.dart';

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
          // MenuListItems
          headline1: GoogleFonts.openSans(
            fontSize: 28,
          ),
          // ProfileText
          headline2: GoogleFonts.roboto(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
          //TextFields
          headline3: GoogleFonts.mukta(
            fontSize: 18,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        ItemsTable.routeName: (context) => ItemsTable(),
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
