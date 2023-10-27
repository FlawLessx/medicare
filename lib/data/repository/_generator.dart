import 'package:flutter_modular/flutter_modular.dart';
import 'auth_repository.dart';

generateRepository(Injector i) {
  i.addLazySingleton(() => AuthRepository());
}
