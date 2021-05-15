import 'package:flutter/material.dart';

import '../basket/basket_items.dart';
import '../product/product.dart';

class ShopTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          body: TabBarView(children: [Product(), BasketItems()]),
          bottomNavigationBar: BottomAppBar(
            child: TabBar(tabs: [
              Tab(text: 'Shop List'),
              Tab(text: 'Basket'),
            ]),
          ),
        ));
  }
}
