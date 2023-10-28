import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:medicare/app/app.dart';
import 'package:medicare/constants/assets_constants.dart';
import 'package:medicare/models/_index.dart';
import 'package:medicare/widgets/custom_image.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.data});
  final Product data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180.w,
      height: 180.h,
      padding: EdgeInsets.all(15.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.w),
        boxShadow: [
          BoxShadow(
            color: AppTheme.shadowColor.withOpacity(0.16),
            offset: const Offset(0, 16),
            blurRadius: 24,
          )
        ],
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Theme.of(context).scaffoldBackgroundColor.withOpacity(0.0),
            Theme.of(context).scaffoldBackgroundColor.withOpacity(0.4),
            Theme.of(context).scaffoldBackgroundColor,
          ],
          stops: const [0.2, 0.3, 1],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 100.h,
            width: double.maxFinite,
            child: Stack(
              children: [
                Positioned.fill(
                  child: CustomImage(
                    height: 100.h,
                    width: double.maxFinite,
                    url: data.image,
                    fit: BoxFit.contain,
                    radius: 8.w,
                  ),
                ),
                Positioned(
                  right: 0,
                  child: Row(
                    children: [
                      Icon(
                        Icons.star_rate_rounded,
                        color: Colors.yellow,
                        size: 24.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5.h),
                        child: Text(
                          '${data.rating % 1 == 0 ? data.rating.toInt() : data.rating}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: AppTheme.shadowColor,
                                  ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Gap(10.h),
          Text(
            data.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontFamily: AssetsConstants.milliardFontFamily,
                  color: Theme.of(context).primaryColor,
                ),
          ),
          Gap(5.h),
          Row(
            children: [
              Expanded(
                child: Text(
                  data.price,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: AppTheme.orange,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              Gap(10.w),
              Container(
                padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.w),
                  color: data.stock == 'ready'
                      ? AppTheme.greenBackground
                      : AppTheme.redBackground,
                ),
                child: Text(
                  tr(data.stock == 'ready'
                      ? 'general.ready_stock'
                      : 'general.empty_stock'),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: data.stock == 'ready'
                            ? AppTheme.textReadyStockColor
                            : AppTheme.textEmptyStockColor,
                      ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
