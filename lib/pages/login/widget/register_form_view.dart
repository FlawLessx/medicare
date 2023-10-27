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

class RegisterFormView extends StatelessWidget {
  const RegisterFormView({super.key, required this.controller});
  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: CustomTextFormField(
                title: tr('general.front_name'),
                controller: controller.frontNameController,
                hint: tr('general.front_name_hint'),
                textCapitalization: TextCapitalization.words,
              ),
            ),
            Gap(15.w),
            Expanded(
              child: CustomTextFormField(
                title: tr('general.back_name'),
                controller: controller.backNameController,
                hint: tr('general.back_name_hint'),
                textCapitalization: TextCapitalization.words,
              ),
            )
          ],
        ),
        Gap(30.h),
        CustomTextFormField(
          title: tr('general.identity'),
          controller: controller.identityController,
          hint: tr('general.identity_hint'),
          keyboardType: TextInputType.number,
        ),
        Gap(30.h),
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
        CustomTextFormField(
          title: tr('general.phone_number'),
          controller: controller.phoneNumberController,
          hint: tr('general.phone_number_hint'),
          keyboardType: TextInputType.phone,
        ),
        Gap(30.h),
        Obx(
          () => CustomTextFormField(
            title: tr('general.password'),
            controller: controller.passwordController,
            obscureText: controller.obscureText.value,
            hint: tr('general.password_hint'),
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
        Obx(
          () => CustomTextFormField(
            title: tr('general.confirm_password'),
            controller: controller.confirmPasswordController,
            obscureText: controller.obscureText.value,
            hint: tr('general.confirm_password_hint'),
            errorText: controller.confirmPasswordValidator.value,
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
              title: tr('login.register'),
              suffixIcon: Icon(
                Icons.arrow_forward,
                color: Colors.white,
                size: 24.h,
              ),
              onTap: controller.register,
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
                  text: '${tr('login.have_account')}  ',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                TextSpan(
                    text: tr('login.login_now'),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).primaryColor,
                        ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        controller.changeView(true);
                      })
              ],
            ),
          ),
        ),
      ],
    );
  }
}
