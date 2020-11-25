import 'package:flutter/material.dart';

import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

class DashboardPage extends StatelessWidget {
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
                  height: 8,
                ),
                listItem('Items', context),
                SizedBox(
                  height: 8,
                ),
                listItem('Purchase', context),
                SizedBox(
                  height: 8,
                ),
                listItem('Sales', context),
                SizedBox(
                  height: 8,
                ),
                listItem('Report', context),
              ],
            ),
          ),
        ),
        sliderMain: Container(),
      ),
    );
  }

  Widget listItem(String title, BuildContext context) {
    return Container(
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }

  Widget listDetail(String listItemTitle, BuildContext context) {
    return Container();
  }
}
