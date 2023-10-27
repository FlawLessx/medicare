import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicare/constants/routes_constants.dart';
import 'package:medicare/pages/_index.dart';

generateRoutes(RouteManager r) {
  r.child(
    RoutesConstants.splash,
    child: (context) => const SplashPage(),
    transition: TransitionType.fadeIn,
  );
  r.child(
    RoutesConstants.login,
    child: (context) => const LoginPage(),
    transition: TransitionType.fadeIn,
  );
}
