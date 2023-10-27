import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get_it/get_it.dart';
import 'package:medicare/app/module/app_module.dart';
import 'package:medicare/util/app_settings.dart';
import 'package:medicare/app/view/app.dart';

final getIt = GetIt.instance;

Future<void> setup({required String baseUrl, required String appName}) async {
  getIt.registerSingleton<AppSetting>(AppSetting(baseUrl));

  runApp(
    ModularApp(
      module: AppModule(),
      child: App(appName: appName),
    ),
  );
}
