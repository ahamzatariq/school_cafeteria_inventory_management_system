import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_web/item.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';

import 'dart:convert';

class ItemsPage extends StatefulWidget {
  static const routeName = '/items-table';

  List<Item> getItems = [];
  final BoxConstraints constraints;
  final double menuWidth;

  ItemsPage({this.constraints, this.menuWidth});

  @override
  _ItemsPageState createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  @override
  Widget build(BuildContext context) {
    getItems();
    return Stack(children: [
      Align(
        alignment: Alignment.center,
        child: Container(
          height: widget.constraints.maxHeight,
          width: widget.constraints.maxWidth / 2.5,
          child: DataTable(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            showBottomBorder: true,
            sortColumnIndex: 1,
            sortAscending: true,
            dataTextStyle: Theme.of(context).textTheme.headline3,
            headingRowColor: MaterialStateProperty.resolveWith<Color>(
              (states) => Theme.of(context).primaryColorLight,
            ),
            headingTextStyle: Theme.of(context)
                .textTheme
                .headline3
                .copyWith(fontWeight: FontWeight.bold, color: Colors.black87),
            columns: [
              DataColumn(
                label: Text('ITEM NAME'),
              ),
              DataColumn(
                label: Text('QUANTITY'),
                numeric: true,
              ),
              DataColumn(
                label: Text('BUYING PRICE'),
                numeric: true,
              ),
              DataColumn(
                label: Text('SELLING PRICE'),
                numeric: true,
              ),
            ],
            rows: [
              DataRow(
                cells: [
                  DataCell(Text('Burger')),
                  DataCell(Text('16')),
                  DataCell(Text('45')),
                  DataCell(Text('50')),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text('Pizza')),
                  DataCell(Text('20')),
                  DataCell(Text('69')),
                  DataCell(Text('75')),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text('Chocolate')),
                  DataCell(Text('604')),
                  DataCell(Text('9.08')),
                  DataCell(Text('10')),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text('Caps')),
                  DataCell(Text('41')),
                  DataCell(Text('150')),
                  DataCell(Text('200')),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text('Sandwich')),
                  DataCell(Text('0')),
                  DataCell(Text('9')),
                  DataCell(Text('10')),
                ],
              ),
            ],
          ),
        ),
      ),
      // Positioned(
      //   bottom: 16,
      //   right: 16,
      //   child: FloatingActionButton(
      //     child: Icon(Icons.add),
      //     onPressed: () {
      //       openAddItemPopup(context);
      //     },
      //   ),
      // ),
    ]);
  }

  getItems() async {
    final items = await http.get(
      'http://localhost:8000/api/items/',
    );

    if (items.statusCode == 200) {
      List<dynamic> v = json.decode(items.body);
    } else {
      print('Status code: ${items.statusCode}');
    }
    // return items;
  }

  openAddItemPopup(BuildContext context) {
    Alert(
      context: context,
      title: 'Add Item',
      content: Column(
        children: [
          TextField(
            style: Theme.of(context).textTheme.headline3,
            decoration: InputDecoration(
              icon: Icon(
                Icons.widgets_outlined,
                color: Theme.of(context).primaryColorDark,
              ),
              labelText: 'Item Name',
            ),
          ),
          TextField(
            style: Theme.of(context).textTheme.headline3,
            decoration: InputDecoration(
              icon: Icon(
                Icons.add_shopping_cart_rounded,
                color: Theme.of(context).primaryColorDark,
              ),
              labelText: 'Quantity',
            ),
          ),
          TextField(
            style: Theme.of(context).textTheme.headline3,
            decoration: InputDecoration(
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Theme.of(context).primaryColorDark,
              ),
              labelText: 'Buying Price',
            ),
          ),
          TextField(
            style: Theme.of(context).textTheme.headline3,
            decoration: InputDecoration(
              icon: Icon(
                Icons.arrow_forward_rounded,
                color: Theme.of(context).primaryColorDark,
              ),
              labelText: 'Selling Price',
            ),
          ),
        ],
      ),
      buttons: [
        DialogButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'Add Item',
            style: Theme.of(context).textTheme.headline4,
          ),
        )
      ],
    ).show();
  }
}
