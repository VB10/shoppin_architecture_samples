import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/managers/shop_manager.dart';

class BasketItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: context.watch<ShopManager>().productList.length,
              itemBuilder: (context, index) {
                final item = context.watch<ShopManager>().productList[index];
                return ListTile(
                  leading: Image.network(item.image ?? ''),
                  title: Text(item.name ?? ''),
                  trailing: Text('${item.count}'),
                );
              },
            ),
          ),
          FloatingActionButton(
            backgroundColor: boolTotalMoneyRules(context) ? Colors.red : Colors.blue,
            onPressed: boolTotalMoneyRules(context) ? () {} : null,
          )
        ],
      ),
    );
  }

  bool boolTotalMoneyRules(BuildContext context) => context.watch<ShopManager>().totalMoney > 50;
}
