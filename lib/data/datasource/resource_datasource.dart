import 'package:medicare/models/resource.dart';
import 'package:medicare/util/dio_client.dart';

class ResourceEndpoint {
  static const String lists = '/api/unknown';
}

class ResourceDatasource {
  late final DioClient _client;

  ResourceDatasource() {
    _client = DioClient();
  }

  Future<List<Resource>> lists({int? page}) async {
    final response =
        await _client.dio.get(ResourceEndpoint.lists, queryParameters: {
      "page": page ?? 1,
    });

    return List.from(response.data['data'].map((e) => Resource.fromJson(e)));
  }
}
