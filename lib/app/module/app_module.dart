import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicare/data/local/shared_preferences_wrapper.dart';
import 'package:medicare/data/repository/_generator.dart';
import 'package:medicare/pages/_generator.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(() => SharedPreferencesWrapper());

    // Generate repository
    generateRepository(i);
  }

  @override
  void routes(r) {
    generateRoutes(r);
  }
}
