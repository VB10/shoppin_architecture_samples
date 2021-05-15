import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/managers/shop_manager.dart';
import '../../core/widgets/shopping_card.dart';
import 'product_view_model.dart';

class ProductView extends ProductViewModel with AutomaticKeepAliveClientMixin {
  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          fetchAllProducts();
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('Shooping App'),
        actions: [Text('${context.watch<ShopManager>().totalMoney} \$')],
      ),
      body: ListView.builder(
        itemCount: productItems.length,
        itemBuilder: (context, index) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: ShoppingCard(model: productItems[index]),
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
