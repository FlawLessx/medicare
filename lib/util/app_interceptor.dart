import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicare/app/app.dart';
import 'package:medicare/constants/prefs_constants.dart';
import 'package:medicare/constants/route_constants.dart';
import 'package:medicare/data/local/shared_preferences_wrapper.dart';

import 'custom_snackbar.dart';

class AppInterceptors extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final preferencesWrapper = Modular.get<SharedPreferencesWrapper>();

    var token = await preferencesWrapper.getString(PrefConstants.token) ?? '';
    options.headers['Authorization'] = 'Bearer $token';

    if (options.headers['Accept'] == null) {
      options.headers['Accept'] = 'application/json';
    }

    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // log(err.response!.requestOptions.uri.toString());
    // print(err.response!.data.toString());
    if (appContext != null) {
      if (err.response?.statusCode == 401 &&
          ModalRoute.of(appContext!)!.settings.name != RouteConstants.login) {
        await Modular.to.pushNamedAndRemoveUntil(
          RouteConstants.login,
          (route) => route.isFirst,
        );

        showSnackbar(
          appContext!,
          'Session expired, please login again...',
          false,
        );

        return handler.reject(err);
      } else if (err.response != null &&
          err.response!.data.toString().contains('message')) {
        if (err.response!.data is Map &&
            err.response!.data['message'] != null) {
          showSnackbar(appContext!, err.response!.data['message'], false);
        } else {
          final message =
              '${err.response!.data.toString().split('"message":').last.split('"').first}"';
          showSnackbar(appContext!, message, false);
        }
      }
    }

    if (appContext != null &&
        (err.type == DioExceptionType.connectionTimeout ||
            err.type == DioExceptionType.receiveTimeout ||
            err.type == DioExceptionType.sendTimeout)) {
      showSnackbar(appContext!, "Request timed out", false);
      handler.reject(err);
    }

    return handler.next(err);
  }
}
