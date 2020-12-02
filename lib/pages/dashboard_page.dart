import 'package:flutter/material.dart';
import 'package:flutter_web/menu_pages/items_page.dart';

import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int selectedItem = 0;
  List<bool> selectedItemList = [true, false, false, false];
  double menuWidth;
  double mainWidth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SliderMenuContainer(
        drawerIconColor: Theme.of(context).primaryColorDark,
        drawerIconSize: 32,
        sliderMenu: LayoutBuilder(
          builder: (context, constraints) {
            print(constraints.maxWidth);
            menuWidth = constraints.maxWidth;
            return Container(
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
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectedItem = 0;
                          selectedItemList[0] = true;
                          selectedItemList[1] = false;
                          selectedItemList[2] = false;
                          selectedItemList[3] = false;
                        });
                      },
                      child: listItem(
                          context, 'Items', constraints, selectedItemList[0]),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectedItem = 1;
                          selectedItemList[0] = false;
                          selectedItemList[1] = true;
                          selectedItemList[2] = false;
                          selectedItemList[3] = false;
                        });
                      },
                      child: listItem(context, 'Purchase', constraints,
                          selectedItemList[1]),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectedItem = 2;
                          selectedItemList[0] = false;
                          selectedItemList[1] = false;
                          selectedItemList[2] = true;
                          selectedItemList[3] = false;
                        });
                      },
                      child: listItem(
                          context, 'Sales', constraints, selectedItemList[2]),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectedItem = 3;
                          selectedItemList[0] = false;
                          selectedItemList[1] = false;
                          selectedItemList[2] = false;
                          selectedItemList[3] = true;
                        });
                      },
                      child: listItem(
                          context, 'Report', constraints, selectedItemList[3]),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        sliderMain: LayoutBuilder(
          builder: (context, constraints) {
            mainWidth = constraints.maxWidth;
            return listDetail(context, selectedItem, constraints, menuWidth);
          },
        ),
      ),
    );
  }

  Widget listItem(
      BuildContext context, String title, BoxConstraints size, bool selected) {
    return Container(
      width: size.maxWidth,
      color: selected ? Theme.of(context).primaryColorDark : Colors.transparent,
      child: Center(
        child: Text(
          title,
          style: selected
              ? Theme.of(context).textTheme.headline4
              : Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }

  Widget listDetail(BuildContext context, int listItemTitle,
      BoxConstraints constraints, double menuWidth) {
    return ListView(children: [
      if (listItemTitle == 0)
        ItemsPage(
          constraints: constraints,
          menuWidth: menuWidth,
        ),
      if (listItemTitle == 1) Container(),
      if (listItemTitle == 2) Container(),
      if (listItemTitle == 3) Container(),
      Container()
    ]);
  }
}
