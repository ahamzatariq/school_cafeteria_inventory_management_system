import 'package:flutter/material.dart';
import 'package:flutter_web/style.dart';

class PurchasePage extends StatelessWidget {
  static const routeName = '/purchase-page';

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
                        'Purchase Items',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        style: Theme.of(context).textTheme.headline3,
                        decoration: InputDecoration(
                          icon: Icon(Icons.widgets_outlined),
                          labelText: 'Item Name',
                        ),
                      ),
                      TextFormField(
                        style: Theme.of(context).textTheme.headline3,
                        decoration: InputDecoration(
                          icon: Icon(Icons.arrow_back_rounded),
                          labelText: 'Purchasing Amount',
                        ),
                      ),
                      TextFormField(
                        style: Theme.of(context).textTheme.headline3,
                        decoration: InputDecoration(
                          icon: Icon(Icons.add_shopping_cart_rounded),
                          labelText: 'Quantity Purchased',
                        ),
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 40.0),
                            child: Text(
                              'Per piece cost: ',
                              style: Theme.of(context).textTheme.headline3,
                            ),
                          ),
                          Text(
                            '15',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                        ],
                      ),
                      TextFormField(
                        style: Theme.of(context).textTheme.headline3,
                        decoration: InputDecoration(
                          icon: Icon(Icons.arrow_forward_rounded),
                          labelText: 'Selling Price',
                        ),
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
