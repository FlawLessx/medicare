import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:medicare/dependency_injection.dart';
import 'package:medicare/util/app_interceptor.dart';

import 'app_settings.dart';

class DioClient {
  late Dio dio;

  DioClient() {
    dio = Dio(BaseOptions(
      baseUrl: getIt.get<AppSetting>().baseUrl,
    ))
      ..interceptors.addAll(
        [
          if (kDebugMode)
            AwesomeDioInterceptor(
              logRequestTimeout: false,
              logRequestHeaders: true,
              logResponseHeaders: false,
            ),
          AppInterceptors(),
        ],
      );
  }
}
