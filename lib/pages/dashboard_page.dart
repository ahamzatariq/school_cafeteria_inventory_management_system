import 'package:flutter/material.dart';
import 'package:flutter_web/menu_pages/items_page.dart';

import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:flutter_web/menu_pages/purchase_page.dart';
import 'package:flutter_web/menu_pages/sales_page.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

enum ListItems { items, purchase, sales, report }

class DashboardPage extends StatefulWidget {
  final String token;

  const DashboardPage({Key key, this.token}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int selectedItem = ListItems.items.index;
  List<bool> selectedItemList = [true, false, false, false];
  double menuWidth;
  double mainWidth;

  @override
  Widget build(BuildContext context) {
    print(widget.token);
    return Scaffold(
      body: SliderMenuContainer(
        drawerIconColor: Theme.of(context).primaryColorDark,
        drawerIconSize: 32,
        sliderMenu: LayoutBuilder(
          builder: (context, constraints) {
            menuWidth = constraints.maxWidth;
            return Stack(
              children: [
                Container(
                  color: Theme.of(context).primaryColorLight,
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
                            onTapListItem(ListItems.items.index);
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
                            onTapListItem(ListItems.purchase.index);
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
                            onTapListItem(ListItems.sales.index);
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
                            onTapListItem(ListItems.report.index);
                          });
                        },
                        child: listItem(context, 'Report', constraints,
                            selectedItemList[3]),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 12,
                  right: 12,
                  child: InkWell(
                    onTap: () {
                      _openThemePopup(context);
                    },
                    child: listItem(context, 'Theme', constraints, false),
                  ),
                )
              ],
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
      floatingActionButton: selectedItem == 0
          ? FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                ItemsPage().createState().openAddItemPopup(context);
              },
            )
          : null,
    );
  }

  void onTapListItem(int itemNumber) {
    setState(() {
      selectedItem = itemNumber;
      for (int i = 0; i < selectedItemList.length; i++) {
        selectedItemList[i] = false;
      }
      selectedItemList[itemNumber] = true;
    });
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
      if (listItemTitle == 1) PurchasePage(),
      if (listItemTitle == 2) SalesPage(),
      if (listItemTitle == 3) Container(),
      Container()
    ]);
  }

  _openThemePopup(BuildContext context) {
    var controller = ThemeProvider.controllerOf(context);
    Alert(
      context: context,
      title: 'Select Color',
      content: Center(
        child: Container(
          height: 330,
          width: 220,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildColorBlock(controller, 'red'),
                  buildColorBlock(controller, 'blue'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildColorBlock(controller, 'teal'),
                  buildColorBlock(controller, 'green'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildColorBlock(controller, 'purple'),
                  buildColorBlock(controller, 'orange'),
                ],
              ),
            ],
          ),
        ),
      ),
    ).show();
  }

  InkWell buildColorBlock(ThemeController controller, String color) {
    Color myColor = color.contains('red')
        ? Colors.red
        : color.contains('blue')
            ? Colors.blue
            : color.contains('teal')
                ? Colors.teal
                : color.contains('green')
                    ? Colors.green
                    : color.contains('purple')
                        ? Colors.purple
                        : color.contains('orange')
                            ? Colors.deepOrange
                            : null;
    return InkWell(
      onTap: () {
        controller.setTheme(color);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: myColor,
        ),
        width: 100,
        height: 100,
      ),
    );
  }
}
