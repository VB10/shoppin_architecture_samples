import 'dart:io';

import 'package:dio/dio.dart';
import 'package:shoppin_architecture_samples/features/product/model/product_model.dart';

abstract class IProductService {
  Dio dio;
  IProductService(this.dio);

  Future<List<ProductModel>> fetchAllProducts();
}

class ProductService extends IProductService {
  ProductService(Dio dio) : super(dio);

  @override
  Future<List<ProductModel>> fetchAllProducts() async {
    final response = await dio.get('product.json');

    if (response.statusCode == HttpStatus.ok) {
      final responseModel = response.data;
      if (responseModel is List) {
        return responseModel.map((e) => ProductModel.fromJson(e)).toList();
      }
    }
    return [];
  }
}
