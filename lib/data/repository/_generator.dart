import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicare/data/repository/_index.dart';

generateRepository(Injector i) {
  i.addLazySingleton(() => AuthRepository());
  i.addLazySingleton(() => ProductRepository());
  i.addLazySingleton(() => ServiceRepository());
}
