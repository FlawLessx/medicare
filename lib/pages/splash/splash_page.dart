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
    BlocProvider.of<AuthCubit>(context).checkLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) async {
        if (state is Authenticated) {
          await Future.delayed(const Duration(seconds: 2));
          Modular.to.pushReplacementNamed(RoutesConstants.home);
        } else {
          await Future.delayed(const Duration(seconds: 2));
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
