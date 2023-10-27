import 'dart:developer';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicare/data/datasource/auth_datasource.dart';
import 'package:medicare/data/local/shared_preferences_wrapper.dart';
import 'package:medicare/exceptions/app_exception.dart';

class AuthRepository {
  late final AuthDatasource _dataSource;
  final SharedPreferencesWrapper _preferencesWrapper =
      Modular.get<SharedPreferencesWrapper>();

  AuthRepository() {
    _dataSource = AuthDatasource();
  }

  Future<void> login(String username, String password) async {
    try {
      final token = _dataSource.login(username, password);
    } catch (e) {
      log("Login Error: $e");
      throw AppException('Something went wrong, please try again later...');
    }
  }

  Future<bool> isLoggedIn() async {
    return await _preferencesWrapper.getBool('loggedIn') ?? false;
  }

  Future<void> logout() async {
    try {
      await _preferencesWrapper.deleteKey('loggedIn');
    } catch (e) {
      throw AppException('Something went wrong, please try again later...');
    }
  }
}
