import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:flutter_web/models/item.dart';
import 'package:flutter_web/services/apis.dart';

import 'package:rflutter_alert/rflutter_alert.dart';

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
    Future<List<Item>> items = APIs().getItems();
    return Stack(children: [
      Align(
        alignment: Alignment.center,
        child: Container(
          height: widget.constraints.maxHeight,
          width: widget.constraints.maxWidth / 2.5,
          child: FutureBuilder(
            future: items,
            builder: (BuildContext context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting)
                return Container(
                  height: 100,
                  width: 100,
                  child: Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                  ),
                );

              if (snapshot.connectionState == ConnectionState.done)
                return buildItemDataTable(context, snapshot);
              return Container();
            },
          ),
        ),
      ),
    ]);
  }

  DataTable buildItemDataTable(BuildContext context, AsyncSnapshot snapshot) {
    return DataTable(
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
        if (snapshot.connectionState == ConnectionState.done)
          for (var item in snapshot.data)
            DataRow(
              cells: [
                DataCell(Text(item.name)),
                DataCell(Text(item.quantity.toString())),
                DataCell(Text(item.buyingPrice.toString())),
                DataCell(Text(item.sellingPrice.toString())),
              ],
            ),
      ],
    );
  }

  openAddItemPopup(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController quantity = TextEditingController();
    TextEditingController buyingPrice = TextEditingController();
    TextEditingController sellingPrice = TextEditingController();
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
            controller: name,
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
            keyboardType: TextInputType.number,
            controller: quantity,
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
            keyboardType: TextInputType.number,
            controller: buyingPrice,
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
            keyboardType: TextInputType.number,
            controller: sellingPrice,
          ),
        ],
      ),
      buttons: [
        DialogButton(
          onPressed: () {
            Item newItem = Item(
              name: name.text,
              quantity: int.parse(quantity.text),
              sellingPrice: double.parse(sellingPrice.text),
              buyingPrice: double.parse(buyingPrice.text),
            );
            APIs().postItems(newItem);
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
