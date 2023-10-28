import 'package:medicare/data/datasource/service_datasource.dart';
import 'package:medicare/exceptions/app_exception.dart';
import 'package:medicare/models/_index.dart';

class ServiceRepository {
  late final ServiceDatasource _dataSource;

  ServiceRepository() {
    _dataSource = ServiceDatasource();
  }

  Future<List<Category>> categories() async {
    try {
      return await _dataSource.categories();
    } catch (e) {
      throw AppException('Something went wrong, please try again later...');
    }
  }

  Future<List<Service>> lists(int categoryId) async {
    try {
      return await _dataSource.lists(categoryId);
    } catch (e) {
      throw AppException('Something went wrong, please try again later...');
    }
  }
}
