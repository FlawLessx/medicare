import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get_it/get_it.dart';
import 'package:medicare/app/module/app_module.dart';
import 'package:medicare/constants/assets_constants.dart';
import 'package:medicare/constants/locales_constants.dart';
import 'package:medicare/util/app_settings.dart';
import 'package:medicare/app/view/app.dart';

final getIt = GetIt.instance;

Future<void> setup({required String baseUrl, required String appName}) async {
  getIt.registerSingleton<AppSetting>(AppSetting(baseUrl));

  runApp(
    ModularApp(
      module: AppModule(),
      child: EasyLocalization(
        supportedLocales: const [LocalesConstants.id],
        path: AssetsConstants.localePath,
        fallbackLocale: LocalesConstants.id,
        startLocale: LocalesConstants.id,
        assetLoader: const JsonAssetLoader(),
        child: App(appName: appName),
      ),
    ),
  );
}
