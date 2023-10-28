import 'package:medicare/models/_index.dart';
import 'package:medicare/util/dio_client.dart';

class UserEndpoint {
  static const String profile = '/api/users/2';
}

class UserDatasource {
  late final DioClient _client;

  UserDatasource() {
    _client = DioClient();
  }

  Future<User> profile() async {
    final response = await _client.dio.get(UserEndpoint.profile);

    return User.fromJson(response.data['data']);
  }
}
