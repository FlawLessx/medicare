import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicare/app/bloc_provider/bloc_provider.dart';
import 'package:medicare/app/theme/app_theme.dart';
import 'package:medicare/util/custom_scroll_behavior.dart';

BuildContext? appContext;

class App extends StatefulWidget {
  const App({super.key, required this.appName});
  final String appName;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    appContext = context;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [...initBlocProvider()],
          child: GestureDetector(
            onTap: () {
              final currentFocus = FocusScope.of(context);

              if (!currentFocus.hasPrimaryFocus &&
                  currentFocus.focusedChild != null) {
                FocusManager.instance.primaryFocus!.unfocus();
              }
            },
            child: ScrollConfiguration(
              behavior: CustomScrollBehavior(),
              child: MaterialApp.router(
                debugShowCheckedModeBanner: false,
                title: widget.appName,
                theme: AppTheme.appTheme,
                routeInformationParser: Modular.routeInformationParser,
                routerDelegate: Modular.routerDelegate,
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
              ),
            ),
          ),
        );
      },
    );
  }
}
