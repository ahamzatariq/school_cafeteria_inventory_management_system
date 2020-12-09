import 'package:flutter/material.dart';
import 'package:flutter_web/menu_pages/items_page.dart';
import 'package:flutter_web/menu_pages/sales_page.dart';
import 'package:flutter_web/pages/dashboard_page.dart';
import 'package:flutter_web/theme/style.dart';
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
        buildAppTheme('red'),
        buildAppTheme('blue'),
        buildAppTheme('teal'),
        buildAppTheme('green'),
        buildAppTheme('purple'),
        buildAppTheme('orange'),
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
              SalesPage.routeName: (context) => SalesPage(),
            },
          ),
        ),
      ),
    );
  }

  AppTheme buildAppTheme(String colorId) {
    return AppTheme(
      id: colorId,
      data: ThemeData(
        primarySwatch: colorId.contains('red')
            ? Colors.red
            : colorId.contains('blue')
                ? Colors.blue
                : colorId.contains('teal')
                    ? Colors.teal
                    : colorId.contains('green')
                        ? Colors.green
                        : colorId.contains('purple')
                            ? Colors.purple
                            : colorId.contains('orange')
                                ? Colors.deepOrange
                                : null,
        textTheme: Style().textTheme,
      ),
      description: '',
    );
  }
}
