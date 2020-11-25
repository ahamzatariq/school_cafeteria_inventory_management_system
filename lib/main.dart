import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

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
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
      body: SliderMenuContainer(
        sliderMenu: LayoutBuilder(
          builder: (context, constraints) => Container(
            padding: EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 16,
            ),
            child: ListView(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      child: Icon(
                        Icons.face,
                        size: constraints.maxWidth / 3.0,
                      ),
                      maxRadius: constraints.maxWidth / 5.0,
                    ),
                    SizedBox(width: 7),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            'Name',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Role',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        sliderMain: Login(),
      ),
    );
  }
}
