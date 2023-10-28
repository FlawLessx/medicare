import 'package:medicare/data/datasource/User_datasource.dart';
import 'package:medicare/exceptions/app_exception.dart';
import 'package:medicare/models/_index.dart';

class UserRepository {
  late final UserDatasource _dataSource;

  UserRepository() {
    _dataSource = UserDatasource();
  }

  Future<User> profile() async {
    try {
      return await _dataSource.profile();
    } catch (e) {
      throw AppException('Something went wrong, please try again later...');
    }
  }
}
