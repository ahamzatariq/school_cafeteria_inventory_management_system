import 'package:flutter/material.dart';
import 'package:flutter_web/menu_pages/items_page.dart';
import 'package:flutter_web/style.dart';
import 'package:theme_provider/theme_provider.dart';

import 'menu_pages/purchase_page.dart';
import 'pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      themes: [
        AppTheme(
          id: 'red',
          data: ThemeData(
            primarySwatch: Colors.red,
            textTheme: Style().textTheme,
          ),
          description: '',
        ),
        AppTheme(
          id: 'blue',
          data: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: Style().textTheme,
          ),
          description: '',
        ),
        AppTheme(
          id: 'teal',
          data: ThemeData(
            primarySwatch: Colors.teal,
            textTheme: Style().textTheme,
          ),
          description: '',
        ),
        AppTheme(
          id: 'green',
          data: ThemeData(
            primarySwatch: Colors.green,
            textTheme: Style().textTheme,
          ),
          description: '',
        ),
        AppTheme(
          id: 'purple',
          data: ThemeData(
            primarySwatch: Colors.purple,
            textTheme: Style().textTheme,
          ),
          description: '',
        ),
        AppTheme(
          id: 'orange',
          data: ThemeData(
            primarySwatch: Colors.deepOrange,
            textTheme: Style().textTheme,
          ),
          description: '',
        ),
      ],
      child: ThemeConsumer(
        child: Builder(
          builder: (themeContext) => MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeProvider.themeOf(themeContext).data,
            home: LoginPage(),
            routes: {
              ItemsPage.routeName: (context) => ItemsPage(),
              PurchasePage.routeName: (context) => PurchasePage(),
            },
          ),
        ),
      ),
    );
  }
}
