import 'package:medicare/data/datasource/product_datasource.dart';
import 'package:medicare/exceptions/app_exception.dart';
import 'package:medicare/models/_index.dart';

class ProductRepository {
  late final ProductDatasource _dataSource;

  ProductRepository() {
    _dataSource = ProductDatasource();
  }

  Future<List<Category>> categories() async {
    try {
      return await _dataSource.categories();
    } catch (e) {
      throw AppException('Something went wrong, please try again later...');
    }
  }

  Future<List<Product>> lists(int? categoryId) async {
    try {
      return await _dataSource.lists(categoryId);
    } catch (e) {
      throw AppException('Something went wrong, please try again later...');
    }
  }
}
