import 'package:flutter/foundation.dart';

import '../../features/product/model/product_model.dart';

class ShopManager extends ChangeNotifier {
  Map<ProductModel, int> basketItems = {};

  List<ProductModel> get productList {
    return basketItems.keys.toList();
  }

  int get totalMoney {
    int _totalMoney = 0;

    basketItems.forEach((key, value) {
      _totalMoney += (key.price ?? 0) * value;
    });
    return _totalMoney;
  }

  void incrementProduct(ProductModel model) {
    model.count++;
    basketItems[model] = model.count;
    notifyListeners();
  }

  void deincreaseProduct(ProductModel model) {
    model.count--;
    if (model.count <= 0) {
      basketItems.remove(model);
    } else {
      basketItems[model] = model.count;
    }
    notifyListeners();
  }
}
