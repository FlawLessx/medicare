import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:medicare/constants/assets_constants.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: double.maxFinite,
      decoration: BoxDecoration(color: Theme.of(context).primaryColor),
      child: Stack(
        children: [
          Positioned(
            right: 60.w,
            top: 20.h,
            child: SvgPicture.asset(
              AssetsConstants.ornamen,
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: SvgPicture.asset(
              AssetsConstants.ornamen2,
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      tr('general.get_more_updates'),
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  ),
                  Gap(20.w),
                  Row(
                    children: [
                      Text(
                        tr('general.get_notification'),
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Colors.white,
                            ),
                      ),
                      Gap(5.w),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 16.h,
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
