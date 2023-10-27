import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medicare/app/app.dart';
import 'package:medicare/blocs/_index.dart';
import 'package:medicare/constants/assets_constants.dart';
import 'package:medicare/constants/routes_constants.dart';
import 'package:medicare/pages/login/widget/login_form_view.dart';

import 'login_controller.dart';
import 'widget/register_form_view.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    appContext = context;

    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (controller) {
          return BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is Authenticated) {
                Modular.to.pushReplacementNamed(RoutesConstants.home);
              }
            },
            child: Scaffold(
              body: SafeArea(
                child: ListView(
                  padding: EdgeInsets.all(15.w),
                  children: [
                    Gap(20.h),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: tr('login.title_hi'),
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                          TextSpan(
                            text: tr('login.title_welcome'),
                            style: Theme.of(context).textTheme.displayLarge,
                          )
                        ],
                      ),
                    ),
                    Gap(5.h),
                    Text(
                      tr('login.description'),
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Gap(5.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Transform.translate(
                          offset: Offset(15.w, 0),
                          child: Image.asset(
                            AssetsConstants.welcome,
                            width: 290.w,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                    Gap(20.h),
                    Obx(
                      () => controller.isLogin.value
                          ? LoginFormView(controller: controller)
                          : RegisterFormView(controller: controller),
                    ),
                    Gap(20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.copyright,
                          color: Colors.grey,
                          size: 12.sp,
                        ),
                        Gap(5.w),
                        Text(
                          'SILK. all right reserved.',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
