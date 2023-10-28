import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:medicare/app/app.dart';
import 'package:medicare/blocs/_index.dart';
import 'package:medicare/widgets/custom_button.dart';
import 'package:medicare/widgets/custom_textformfield.dart';

class ProfileData extends StatelessWidget {
  const ProfileData({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 15.w),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(15.w),
            boxShadow: [
              BoxShadow(
                color: AppTheme.shadowColor.withOpacity(0.16),
                offset: const Offset(0, 16),
                blurRadius: 24,
              )
            ],
          ),
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.only(
                top: 170.h, left: 15.w, right: 15.w, bottom: 15.h),
            children: [
              CustomTextFormField(
                controller: TextEditingController(
                    text: state is Authenticated ? state.user.firstName : null),
                title: tr('general.front_name'),
                hint: tr('general.front_name_hint'),
                textCapitalization: TextCapitalization.words,
              ),
              Gap(20.h),
              CustomTextFormField(
                title: tr('general.back_name'),
                controller: TextEditingController(
                    text: state is Authenticated ? state.user.lastName : null),
                hint: tr('general.back_name_hint'),
                textCapitalization: TextCapitalization.words,
              ),
              Gap(20.h),
              CustomTextFormField(
                title: tr('general.email'),
                controller: TextEditingController(
                    text: state is Authenticated ? state.user.email : null),
                hint: tr('general.email_hint'),
                keyboardType: TextInputType.emailAddress,
              ),
              Gap(20.h),
              CustomTextFormField(
                title: tr('general.phone_number'),
                controller: TextEditingController(),
                hint: tr('general.phone_number_hint'),
                keyboardType: TextInputType.emailAddress,
              ),
              Gap(20.h),
              CustomTextFormField(
                title: tr('general.identity'),
                controller: TextEditingController(),
                hint: tr('general.identity_hint'),
                keyboardType: TextInputType.emailAddress,
              ),
              Gap(30.h),
              Row(
                children: [
                  Icon(
                    Icons.info_rounded,
                    color: Theme.of(context).primaryColor,
                    size: 16.h,
                  ),
                  Gap(10.w),
                  Expanded(
                    child: Text(
                      tr('profile.tooltip_information'),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  )
                ],
              ),
              Gap(30.h),
              CustomButton(
                title: tr('profile.save_profile'),
                height: 36.h,
                fontSize: 14.sp,
                suffixIcon: Icon(
                  Icons.save_outlined,
                  color: Colors.white,
                  size: 16.h,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
