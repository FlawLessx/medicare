import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:medicare/blocs/_index.dart';
import 'package:medicare/pages/login/login_controller.dart';
import 'package:medicare/widgets/custom_button.dart';
import 'package:medicare/widgets/custom_textformfield.dart';

class LoginFormView extends StatelessWidget {
  const LoginFormView({super.key, required this.controller});
  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(
          () => CustomTextFormField(
            title: tr('general.email'),
            controller: controller.emailController,
            hint: tr('general.email_hint'),
            errorText: controller.emailValidator.value,
            keyboardType: TextInputType.emailAddress,
          ),
        ),
        Gap(30.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              tr('general.password'),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              tr('login.forgot_password'),
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        Obx(
          () => CustomTextFormField(
            controller: controller.passwordController,
            hint: tr('general.password_hint'),
            obscureText: controller.obscureText.value,
            errorText: controller.passwordValidator.value,
            suffixIcon: GestureDetector(
              onTap: () {
                controller.obscureText.value = !controller.obscureText.value;
              },
              child: Icon(
                controller.obscureText.value
                    ? LineIcons.eyeSlashAlt
                    : LineIcons.eyeAlt,
                size: 16.h,
              ),
            ),
          ),
        ),
        Gap(30.h),
        BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return CustomButton(
              title: tr('login.login'),
              suffixIcon: Icon(
                Icons.arrow_forward,
                color: Colors.white,
                size: 24.h,
              ),
              onTap: controller.login,
              loading: state is AuthLoading,
            );
          },
        ),
        Gap(20.h),
        Center(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '${tr('login.dont_have_account')}  ',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                TextSpan(
                    text: tr('login.register_now'),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).primaryColor,
                        ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        controller.changeView(false);
                      })
              ],
            ),
          ),
        ),
      ],
    );
  }
}
