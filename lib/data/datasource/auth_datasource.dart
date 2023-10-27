import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicare/data/local/shared_preferences_wrapper.dart';
import 'package:medicare/util/dio_client.dart';

class AuthEndpoint {
  static const String login = '/api/login';
}

class AuthDatasource {
  late final DioClient _client;
  final _preferencesWrapper = Modular.get<SharedPreferencesWrapper>();

  AuthDatasource() {
    _client = DioClient();
  }

  Future<String> login(String username, String password) async {
    final response = await _client.dio.post(
      AuthEndpoint.login,
      data: {
        "login": username,
        "password": password,
      },
    );

    var dataCookie = response.headers['set-cookie'];
    if (dataCookie != null && dataCookie.isNotEmpty) {
      await _preferencesWrapper.setString('cookies', dataCookie[0]);
    }

    return response.data['token'];
  }
}
