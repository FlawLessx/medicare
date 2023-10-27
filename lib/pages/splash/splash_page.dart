import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lottie/lottie.dart';
import 'package:medicare/blocs/_index.dart';
import 'package:medicare/constants/assets_constants.dart';
import 'package:medicare/constants/routes_constants.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    init();
    super.initState();
  }

  Future<void> init() async {
    await Future.delayed(const Duration(seconds: 3));
    // ignore: use_build_context_synchronously
    BlocProvider.of<AuthCubit>(context).checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is Authenticated) {
          Modular.to.pushReplacementNamed(RoutesConstants.home);
        } else {
          Modular.to.pushReplacementNamed(RoutesConstants.login);
        }
      },
      child: Scaffold(
        body: SizedBox(
          child: Center(
            child: Lottie.asset(
              AssetsConstants.animsLoading,
              animate: true,
            ),
          ),
        ),
      ),
    );
  }
}
