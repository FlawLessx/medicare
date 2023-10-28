import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:medicare/constants/assets_constants.dart';
import 'package:medicare/models/_index.dart';
import 'package:medicare/util/dio_client.dart';

class ProductEndpoint {
  static const String lists = '/api/products';
}

class ProductDatasource {
  // ignore: unused_field
  late final DioClient _client;

  ProductDatasource() {
    _client = DioClient();
  }

  Future<List<Category>> categories() async {
    await Future.delayed(const Duration(seconds: 2));
    String data =
        await rootBundle.loadString(AssetsConstants.dataCategoryProduct);
    final decoded = jsonDecode(data);

    return List<Category>.from(decoded.map((e) => Category.fromJson(e)));
  }

  Future<List<Product>> lists(int? categoryId) async {
    await Future.delayed(const Duration(seconds: 2));
    String data = await rootBundle.loadString(AssetsConstants.dataProducts);
    final decoded = jsonDecode(data);
    final result = List<Product>.from(decoded.map((e) => Product.fromJson(e)));

    return categoryId == null
        ? result
        : result.where((element) => element.categoryId == categoryId).toList();
  }
}
