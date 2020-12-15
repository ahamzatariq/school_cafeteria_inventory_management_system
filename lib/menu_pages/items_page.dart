import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:flutter_web/models/item.dart';
import 'package:flutter_web/services/apis.dart';

import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:dropdown_search/dropdown_search.dart';

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
          width: widget.constraints.maxWidth / 2.1,
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
          label: Text('BRAND'),
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
          for (Item item in snapshot.data)
            DataRow(
              cells: [
                DataCell(
                    Text(
                      item.name,
                      maxLines: 1,
                    ),
                    onTap: () => openAddItemPopup(context, item, true)),
                DataCell(Text(item.brand.substring(0, 4)),
                    onTap: () => openAddItemPopup(context, item, true)),
                DataCell(Text(item.quantity.toString()),
                    onTap: () => openAddItemPopup(context, item, true)),
                DataCell(Text(item.buyingPrice.toString()),
                    onTap: () => openAddItemPopup(context, item, true)),
                DataCell(Text(item.sellingPrice.toString()),
                    onTap: () => openAddItemPopup(context, item, true)),
              ],
            ),
      ],
    );
  }

  openAddItemPopup(BuildContext context, Item item, bool isEdit) {
    TextEditingController name = TextEditingController()..text = item.name;
    TextEditingController brand = TextEditingController()..text = item.brand;
    TextEditingController quantity = TextEditingController()
      ..text = item.quantity == null ? '' : item.quantity.toString();
    TextEditingController buyingPrice = TextEditingController()
      ..text = item.buyingPrice == null ? '' : item.buyingPrice.toString();
    TextEditingController sellingPrice = TextEditingController()
      ..text = item.sellingPrice == null ? '' : item.sellingPrice.toString();
    Alert(
      context: context,
      title: isEdit ? 'Edit Item' : 'Add Item',
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
          FutureBuilder(
            future: APIs().brandNames(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting)
                return Center(
                  child: CircularProgressIndicator(),
                );
              if (snapshot.connectionState == ConnectionState.done)
                return DropdownSearch<String>(
                  validator: (value) => null ? 'required field' : null,
                  mode: Mode.MENU,
                  showSelectedItem: true,
                  items: snapshot.data,
                  showSearchBox: true,
                  searchBoxController: brand,
                  dropdownSearchDecoration: InputDecoration(
                    icon: Icon(
                      Icons.apartment_rounded,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    labelText: 'Brand',
                  ),
                );
              return Container();
            },
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
              id: item.id,
              name: name.text,
              quantity: int.parse(quantity.text),
              sellingPrice: double.parse(sellingPrice.text),
              buyingPrice: double.parse(buyingPrice.text),
            );
            isEdit ? APIs().patchItem(newItem) : APIs().postItems(newItem);
            Navigator.of(context).pop();
          },
          child: Text(
            isEdit ? 'Update' : 'Add Item',
            style: Theme.of(context).textTheme.headline4,
          ),
        )
      ],
    ).show();
  }
}
