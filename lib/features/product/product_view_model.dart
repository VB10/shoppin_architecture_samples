import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shoppin_architecture_samples/features/product/model/product_model.dart';
import 'package:shoppin_architecture_samples/features/product/service/product_service.dart';
import './product.dart';

abstract class ProductViewModel extends State<Product> {
  late final IProductService _productService;
  final String _baseUrl = 'https://fluttertr-ead5c.firebaseio.com/';

  List<ProductModel> productItems = [];
  @override
  void initState() {
    super.initState();
    _productService = ProductService(Dio(BaseOptions(baseUrl: _baseUrl)));
  }

  Future<void> fetchAllProducts() async {
    productItems = await _productService.fetchAllProducts();
    setState(() {});
  }
}
