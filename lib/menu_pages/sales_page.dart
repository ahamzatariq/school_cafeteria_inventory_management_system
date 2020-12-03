import 'package:flutter/material.dart';

class SalesPage extends StatelessWidget {
  static const routeName = '/sales-page';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        child: Row(
          children: [
            Spacer(),
            Spacer(),
            Expanded(
              child: Card(
                elevation: 6,
                color: Theme.of(context).primaryColorLight.withAlpha(70),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      Text(
                        'Sales',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        style: Theme.of(context).textTheme.headline3,
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.widgets_outlined,
                            color: Theme.of(context).primaryColorDark,
                          ),
                          labelText: 'Item Name',
                        ),
                      ),
                      TextFormField(
                        style: Theme.of(context).textTheme.headline3,
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.arrow_forward_rounded,
                            color: Theme.of(context).primaryColorDark,
                          ),
                          labelText: 'Selling Price',
                        ),
                      ),
                      TextFormField(
                        style: Theme.of(context).textTheme.headline3,
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.add_shopping_cart_rounded,
                            color: Theme.of(context).primaryColorDark,
                          ),
                          labelText: 'Quantity Sold',
                        ),
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 40.0),
                            child: Text(
                              'Total sold amount: ',
                              style: Theme.of(context).textTheme.headline3,
                            ),
                          ),
                          Text(
                            '15',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 40.0),
                            child: Text(
                              'Quantity left behind ',
                              style: Theme.of(context).textTheme.headline3,
                            ),
                          ),
                          Text(
                            '15',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Purchase',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Spacer(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
