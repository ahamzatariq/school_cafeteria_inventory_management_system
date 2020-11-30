import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:http/http.dart' as http;

class ItemsTable extends StatelessWidget {
  static const routeName = '/items-table';

  final BoxConstraints constraints;

  ItemsTable({this.constraints});

  @override
  Widget build(BuildContext context) {
    http.Response items = getItems();
    print(items);
    return Stack(children: [
      Align(
        alignment: Alignment.center,
        child: DataTable(
          sortColumnIndex: 0,
          sortAscending: true,
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
      Positioned(
        bottom: 12,
        right: 12,
        child: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            showMaterialModalBottomSheet(
              context: context,
              elevation: 6,
              builder: (context) => SingleChildScrollView(
                controller: ModalScrollController.of(context),
                child: Container(
                  height: 500,
                  padding: EdgeInsets.symmetric(vertical: 22, horizontal: 200),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.text,
                          style: Theme.of(context).textTheme.headline3,
                          decoration: InputDecoration(labelText: 'Item Name'),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          style: Theme.of(context).textTheme.headline3,
                          decoration:
                              InputDecoration(labelText: 'Item Quantity'),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          style: Theme.of(context).textTheme.headline3,
                          decoration:
                              InputDecoration(labelText: 'Item Buying Price'),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          style: Theme.of(context).textTheme.headline3,
                          decoration:
                              InputDecoration(labelText: 'Item Selling Price'),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Material(
                            elevation: 6,
                            color: Theme.of(context).primaryColorLight,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
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
                                    style:
                                        Theme.of(context).textTheme.headline1,
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
        ),
      )
    ]);
  }

  http.Response getItems() {
    var items;
    http.get('http://127.0.0.1:8000/api/items').then(
      (value) {
        items = value;
      },
    );
    if (items != null) return items;
  }
}
