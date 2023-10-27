import 'package:medicare/dependency_injection.dart';
import 'package:medicare/initialization_function.dart';

Future<void> main() async {
  await initializationFunction();

  await setup(
    baseUrl: 'https://reqres.in',
    appName: 'Medicare',
  );
}
