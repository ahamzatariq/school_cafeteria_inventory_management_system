import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<String> listItems = ['Items', 'Purchase', 'Sales', 'Report'];

  int selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SliderMenuContainer(
        sliderMenu: LayoutBuilder(
          builder: (context, constraints) => Container(
            color: Theme.of(context).primaryColorLight,
            padding: EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 16,
            ),
            child: LayoutBuilder(
              builder: (context, constraints) => ListView(
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
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            Text(
                              'Role',
                              style: Theme.of(context).textTheme.headline2,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedItem = 0;
                      });
                    },
                    child: listItem(context, 'Items', constraints),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedItem = 1;
                      });
                    },
                    child: listItem(context, 'Purchase', constraints),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedItem = 2;
                      });
                    },
                    child: listItem(context, 'Sales', constraints),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedItem = 3;
                      });
                    },
                    child: listItem(context, 'Report', constraints),
                  ),
                ],
              ),
            ),
          ),
        ),
        sliderMain: LayoutBuilder(
            builder: (context, constraints) =>
                listDetail(context, selectedItem, constraints)),
      ),
    );
  }

  Widget listItem(BuildContext context, String title, BoxConstraints size) {
    return Container(
      width: size.maxWidth,
      child: Center(
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }

  Widget listDetail(
      BuildContext context, int listItemTitle, BoxConstraints constraints) {
    return ListView(children: [
      if (listItemTitle == 0) itemsDetail(context, constraints),
      if (listItemTitle == 1) Container(),
      if (listItemTitle == 2) Container(),
      if (listItemTitle == 3) Container(),
      Container()
    ]);
  }

  Widget itemsDetail(BuildContext context, BoxConstraints constraints) {
    return Container(
      height: constraints.maxHeight,
      width: constraints.maxWidth,
      child: Center(
        child: Container(
          height: constraints.maxHeight / 3,
          width: constraints.maxWidth / 3,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Card(
                  color: Theme.of(context).primaryColorLight,
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: ListTile(
                    leading: Icon(Icons.add),
                    title: Text(
                      'Add Item',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Card(
                  color: Theme.of(context).primaryColorLight,
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: ListTile(
                    leading: Icon(Icons.list),
                    title: Text(
                      'View Items',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
