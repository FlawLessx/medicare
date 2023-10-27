import 'package:medicare/util/dio_client.dart';

class AuthEndpoint {
  static const String login = '/api/login';
  static const String register = '/api/register';
}

class AuthDatasource {
  late final DioClient _client;

  AuthDatasource() {
    _client = DioClient();
  }

  Future<String> login(String username, String password) async {
    final response = await _client.dio.post(
      AuthEndpoint.login,
      data: {
        "email": username,
        "password": password,
      },
    );

    return response.data['token'];
  }

  Future<String> register(String username, String password) async {
    final response = await _client.dio.post(
      AuthEndpoint.login,
      data: {
        "email": username,
        "password": password,
      },
    );

    return response.data['token'];
  }
}
