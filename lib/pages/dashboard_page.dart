import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_web/pages/items_table.dart';

import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int selectedItem = 0;
  List<bool> selectedItemList = [true, false, false, false];

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
                    child: listItem(
                        context, 'Purchase', constraints, selectedItemList[1]),
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
          ),
        ),
        sliderMain: LayoutBuilder(
            builder: (context, constraints) =>
                listDetail(context, selectedItem, constraints)),
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

  Widget listDetail(
      BuildContext context, int listItemTitle, BoxConstraints constraints) {
    return ListView(children: [
      if (listItemTitle == 0)
        LayoutBuilder(
          builder: (context, constraints) =>
              ItemsTable(constraints: constraints),
        ),
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
          height: constraints.maxHeight / 4,
          width: constraints.maxWidth / 4,
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
                  child: InkWell(
                    onTap: () {
                      showMaterialModalBottomSheet(
                        context: context,
                        elevation: 6,
                        builder: (context) => SingleChildScrollView(
                          controller: ModalScrollController.of(context),
                          child: Container(
                            height: constraints.maxHeight * 0.5,
                            padding: EdgeInsets.symmetric(
                                vertical: 22,
                                horizontal: constraints.maxWidth / 3),
                            child: Form(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  TextFormField(
                                    keyboardType: TextInputType.text,
                                    style:
                                        Theme.of(context).textTheme.headline3,
                                    decoration:
                                        InputDecoration(labelText: 'Item Name'),
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.number,
                                    style:
                                        Theme.of(context).textTheme.headline3,
                                    decoration: InputDecoration(
                                        labelText: 'Item Quantity'),
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.number,
                                    style:
                                        Theme.of(context).textTheme.headline3,
                                    decoration: InputDecoration(
                                        labelText: 'Item Buying Price'),
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.number,
                                    style:
                                        Theme.of(context).textTheme.headline3,
                                    decoration: InputDecoration(
                                        labelText: 'Item Selling Price'),
                                  ),
                                  Spacer(),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Material(
                                      elevation: 6,
                                      color:
                                          Theme.of(context).primaryColorLight,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                      child: Container(
                                        padding: EdgeInsets.all(8),
                                        width: 200,
                                        child: Row(
                                          children: [
                                            Icon(Icons.add),
                                            SizedBox(width: 8),
                                            Text(
                                              'Add Item',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    child: ListTile(
                      leading: Icon(Icons.add),
                      title: Text(
                        'Add Item',
                        style: Theme.of(context).textTheme.headline1,
                      ),
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
                  child: InkWell(
                    onTap: () {
                      print('InkWell');
                      Navigator.pushReplacementNamed(
                          context, ItemsTable.routeName);
                    },
                    child: ListTile(
                      leading: Icon(Icons.list),
                      title: Text(
                        'View Items',
                        style: Theme.of(context).textTheme.headline1,
                      ),
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
