import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:medicare/app/app.dart';
import 'package:medicare/blocs/_index.dart';
import 'package:medicare/constants/assets_constants.dart';
import 'package:medicare/widgets/custom_image.dart';
import 'package:medicare/widgets/shimmer_widget.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      margin: EdgeInsets.symmetric(horizontal: 15.w),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(15.w),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Transform.scale(
              scale: 1.2,
              child: Image.asset(
                AssetsConstants.ornamen3,
                width: double.maxFinite,
                height: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned.fill(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(15.w),
                  child: profile(),
                ),
                const Spacer(),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                  decoration: BoxDecoration(
                    color: AppTheme.thirdColor,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(15.w),
                      topLeft: Radius.circular(15.w),
                      bottomLeft: Radius.circular(15.w),
                    ),
                  ),
                  child: Text(
                    tr('profile.description'),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            right: 20.w,
            bottom: 45.h,
            child: SvgPicture.asset(
              AssetsConstants.ornamen,
            ),
          ),
        ],
      ),
    );
  }

  Widget profile() {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is Authenticated) {
          return Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60.h),
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: CustomImage(
                  height: 60.h,
                  width: 60.h,
                  url: state.user.avatar,
                  radius: 60.h,
                ),
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
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                        ),
                        TextSpan(
                          text: state.user.lastName,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                        )
                      ],
                    ),
                  ),
                  Gap(5.h),
                  Text(
                    state.user.email,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.white,
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
