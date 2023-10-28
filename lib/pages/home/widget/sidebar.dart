import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:medicare/app/app.dart';
import 'package:medicare/blocs/_index.dart';
import 'package:medicare/constants/assets_constants.dart';
import 'package:medicare/pages/home/home_controller.dart';
import 'package:medicare/widgets/custom_button.dart';
import 'package:medicare/widgets/custom_image.dart';
import 'package:medicare/widgets/shimmer_widget.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key, required this.controller});
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.transparent,
      width: double.maxFinite,
      child: SafeArea(
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                controller.key.currentState!.closeEndDrawer();
              },
              child: Container(
                width: 55.w,
                color: Theme.of(context).primaryColor.withOpacity(0.6),
                padding: EdgeInsets.only(top: 20.h),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(4.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.w),
                        color: Colors.white,
                      ),
                      child: Icon(
                        Icons.close,
                        size: 16.h,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                child: ListView(
                  padding:
                      EdgeInsets.symmetric(vertical: 60.h, horizontal: 15.w),
                  children: [
                    profile(),
                    Gap(20.h),
                    ListTile(
                      onTap: () {},
                      visualDensity: VisualDensity.compact,
                      title: Text(
                        tr('sidebar.my_profile'),
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppTheme.textSecondaryColor,
                            ),
                      ),
                      trailing: Icon(
                        Icons.chevron_right_outlined,
                        color: AppTheme.textSecondaryColor,
                        size: 16.h,
                      ),
                    ),
                    ListTile(
                      onTap: () {},
                      visualDensity: VisualDensity.compact,
                      title: Text(
                        tr('sidebar.settings'),
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppTheme.textSecondaryColor,
                            ),
                      ),
                      trailing: Icon(
                        Icons.chevron_right_outlined,
                        color: AppTheme.textSecondaryColor,
                        size: 16.h,
                      ),
                    ),
                    Gap(20.h),
                    Row(
                      children: [
                        CustomButton(
                          title: tr('sidebar.logout'),
                          backgroundColor: AppTheme.red,
                          borderRadius: 50.w,
                          height: 36.h,
                          width: 130.w,
                          shadowColor: Colors.transparent,
                        ),
                      ],
                    ),
                    Gap(50.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          tr('sidebar.follow_us'),
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                        Gap(10.w),
                        Wrap(
                          spacing: 10.w,
                          children: [
                            AssetsConstants.icFacebook,
                            AssetsConstants.icInstagram,
                            AssetsConstants.icTwitter
                          ]
                              .map((e) => SvgPicture.asset(
                                    e,
                                    height: 12.h,
                                    width: 12.h,
                                    fit: BoxFit.cover,
                                  ))
                              .toList(),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget profile() {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is Authenticated) {
          return Row(
            children: [
              CustomImage(
                height: 60.h,
                width: 60.h,
                url: state.user.avatar,
                radius: 60.h,
              ),
              Gap(10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '${state.user.firstName} ',
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: Theme.of(context).primaryColor,
                                  ),
                        ),
                        TextSpan(
                          text: state.user.lastName,
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: Theme.of(context).primaryColor,
                                  ),
                        )
                      ],
                    ),
                  ),
                  Gap(5.h),
                  Text(
                    state.user.email,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppTheme.textColor,
                          fontSize: 11.sp,
                        ),
                  ),
                ],
              )
            ],
          );
        }

        return Row(
          children: [
            ShimmerWidget(
              height: 60.h,
              width: 60.h,
              radius: 60.h,
            ),
            Gap(10.w),
            Column(
              children: [
                ShimmerWidget(
                  height: 30.h,
                  width: double.maxFinite,
                  radius: 4.w,
                ),
                Gap(5.h),
                ShimmerWidget(
                  height: 30.h,
                  width: double.maxFinite,
                  radius: 4.w,
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
