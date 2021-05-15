import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppin_architecture_samples/core/managers/shop_manager.dart';
import 'package:shoppin_architecture_samples/features/product/model/product_model.dart';

class ShoppingCard extends StatelessWidget {
  final ProductModel model;

  const ShoppingCard({Key? key, required this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Stack(
          children: [
            buildColumnBody(context),
            Positioned(
              right: 0,
              width: MediaQuery.of(context).size.width * 0.2,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                height: context.watch<ShopManager>().basketItems.containsKey(model) ? MediaQuery.of(context).size.height * 0.2 : 0,
                color: Colors.black,
                child: buildColumnMenu(context),
              ),
            )
          ],
        ),
      ),
    );
  }

  Column buildColumnMenu(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: TextButton(
            onPressed: () {
              context.read<ShopManager>().incrementProduct(model);
            },
            child: Icon(Icons.add),
          ),
        ),
        Text('${context.watch<ShopManager>().basketItems[model]}'),
        Expanded(
          child: TextButton(
            onPressed: () {
              context.read<ShopManager>().deincreaseProduct(model);
            },
            child: Icon(Icons.remove),
          ),
        ),
      ],
    );
  }

  Column buildColumnBody(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Image.network(model.image ?? '')),
        ListTile(
          title: Text(model.name ?? ''),
          trailing: Text('${model.price} \$'),
          subtitle: IconButton(
            icon: Icon(Icons.shopping_bag_outlined),
            onPressed: () {
              context.read<ShopManager>().incrementProduct(model);
            },
          ),
        )
      ],
    );
  }
}
