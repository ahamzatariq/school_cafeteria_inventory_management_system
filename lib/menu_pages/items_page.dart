import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';

import 'dart:convert';

class ItemsPage extends StatefulWidget {
  static const routeName = '/items-table';

  final BoxConstraints constraints;
  final double menuWidth;

  ItemsPage({this.constraints, this.menuWidth});

  @override
  _ItemsPageState createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  @override
  Widget build(BuildContext context) {
    // getItems();
    return Stack(children: [
      Align(
        alignment: Alignment.center,
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColorLight.withAlpha(70),
            borderRadius: BorderRadius.circular(12),
          ),
          height: widget.constraints.maxHeight,
          width: (widget.constraints.maxWidth - 2 * widget.menuWidth),
          child: DataTable(
            showBottomBorder: true,
            sortColumnIndex: 1,
            sortAscending: true,
            headingTextStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            columns: [
              DataColumn(
                label: Text('Item Name'),
              ),
              DataColumn(
                label: Text('Quantity'),
                numeric: true,
              ),
              DataColumn(
                label: Text('Buying Price'),
                numeric: true,
              ),
              DataColumn(
                label: Text('Selling Price'),
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
      Positioned(
        bottom: 16,
        right: 16,
        child: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            _openPopup(context);
          },
        ),
      )
    ]);
  }

  getItems() async {
    var headers = {'Accept': 'application/json'};
    final items =
        await http.get('http://127.0.0.1:8000/api/items/', headers: headers);

    if (items.statusCode == 200) {
      var v = json.decode(items.body);
      setState(() {
        print(v);
      });
    }
    // return items;
  }

  _openPopup(BuildContext context) {
    Alert(
      context: context,
      title: 'Add Item',
      content: Column(
        children: [
          TextField(
            style: Theme.of(context).textTheme.headline3,
            decoration: InputDecoration(
              icon: Icon(Icons.widgets_outlined),
              labelText: 'Item Name',
            ),
          ),
          TextField(
            style: Theme.of(context).textTheme.headline3,
            decoration: InputDecoration(
              icon: Icon(Icons.add_shopping_cart_rounded),
              labelText: 'Quantity',
            ),
          ),
          TextField(
            style: Theme.of(context).textTheme.headline3,
            decoration: InputDecoration(
              icon: Icon(Icons.arrow_back_rounded),
              labelText: 'Buying Price',
            ),
          ),
          TextField(
            style: Theme.of(context).textTheme.headline3,
            decoration: InputDecoration(
              icon: Icon(Icons.arrow_forward_rounded),
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