import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

Future<void> initializationFunction() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  // TODO: Put setup notification / Firebase / Hive etc here
}
