import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicare/app/app.dart';
import 'package:medicare/constants/prefs_constants.dart';
import 'package:medicare/constants/routes_constants.dart';
import 'package:medicare/data/local/shared_preferences_wrapper.dart';

import 'custom_snackbar.dart';

class AppInterceptors extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final preferencesWrapper = Modular.get<SharedPreferencesWrapper>();

    try {
      var token = await preferencesWrapper.getString(PrefConstants.token) ?? '';
      options.headers['Authorization'] = 'Bearer $token';

      if (options.headers['Accept'] == null) {
        options.headers['Accept'] = 'application/json';
      }
    } catch (e) {
      log(e.toString());
    }

    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (appContext != null) {
      if (err.response?.statusCode == 401 &&
          ModalRoute.of(appContext!)!.settings.name != RoutesConstants.login) {
        final preferencesWrapper = Modular.get<SharedPreferencesWrapper>();
        await preferencesWrapper.setBool(PrefConstants.loggedIn, false);

        await Modular.to.pushNamedAndRemoveUntil(
          RoutesConstants.login,
          (route) => route.isFirst,
        );

        showSnackbar(
          appContext!,
          'Session expired, please login again...',
          false,
        );

        return handler.reject(err);
      } else if (err.response != null &&
          err.response!.data.toString().contains('error')) {
        if (err.response!.data is Map && err.response!.data['error'] != null) {
          showSnackbar(appContext!, err.response!.data['error'], false);
        } else {
          final message =
              '${err.response!.data.toString().split('"error":').last.split('"').first}"';
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
