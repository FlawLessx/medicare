import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:medicare/constants/assets_constants.dart';
import 'package:medicare/models/_index.dart';
import 'package:medicare/util/dio_client.dart';

class ServiceEndpoint {
  static const String lists = '/api/services';
}

class ServiceDatasource {
  // ignore: unused_field
  late final DioClient _client;

  ServiceDatasource() {
    _client = DioClient();
  }

  Future<List<Category>> categories() async {
    await Future.delayed(const Duration(seconds: 2));
    String data =
        await rootBundle.loadString(AssetsConstants.dataCategoryService);
    final decoded = jsonDecode(data);

    return List<Category>.from(decoded.map((e) => Category.fromJson(e)));
  }

  Future<List<Service>> lists(int categoryId) async {
    await Future.delayed(const Duration(seconds: 2));
    String data = await rootBundle.loadString(AssetsConstants.dataServices);
    final decoded = jsonDecode(data);

    return List<Service>.from(decoded.map((e) => Service.fromJson(e)))
        .where((element) => element.categoryId == categoryId)
        .toList();
  }
}
