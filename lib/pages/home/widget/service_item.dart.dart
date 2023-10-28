import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:medicare/app/app.dart';
import 'package:medicare/constants/assets_constants.dart';
import 'package:medicare/models/_index.dart';
import 'package:medicare/widgets/custom_image.dart';

class ServiceItem extends StatelessWidget {
  const ServiceItem({super.key, required this.data});
  final Service data;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.h,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(8.w),
        boxShadow: [
          BoxShadow(
            color: AppTheme.shadowColor.withOpacity(0.16),
            offset: const Offset(0, 16),
            blurRadius: 24,
          )
        ],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: Padding(
              padding: EdgeInsets.all(10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(10.h),
                  Text(
                    data.name,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontFamily: AssetsConstants.milliardFontFamily,
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          data.price,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: AppTheme.orange,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        AssetsConstants.icHospital,
                        height: 16.h,
                      ),
                      Gap(5.w),
                      Flexible(
                        child: Text(
                          data.hospital,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: AppTheme.textSecondaryColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      )
                    ],
                  ),
                  Gap(5.h),
                  Row(
                    children: [
                      SvgPicture.asset(
                        AssetsConstants.icLocation,
                        height: 16.h,
                      ),
                      Gap(5.w),
                      Flexible(
                        child: Text(
                          data.location,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: AppTheme.shadowColor,
                                  ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: CustomImage(
              height: double.maxFinite,
              width: double.maxFinite,
              url: data.image,
              fit: BoxFit.cover,
              radius: 8.w,
            ),
          )
        ],
      ),
    );
  }
}
