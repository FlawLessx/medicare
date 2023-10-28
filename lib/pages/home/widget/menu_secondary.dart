import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medicare/app/app.dart';
import 'package:visibility_detector/visibility_detector.dart';

class MenuSecondary extends StatelessWidget {
  const MenuSecondary({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.buttonTitle,
    required this.onTap,
    this.imageLeftPosition = true,
  });
  final String image;
  final String title;
  final String subtitle;
  final String buttonTitle;
  final Function() onTap;
  final bool imageLeftPosition;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: MenuSecondaryController(),
        builder: (controller) {
          return VisibilityDetector(
            key: Key('MenuSecondary$image'),
            onVisibilityChanged: (visibilityInfo) {
              if (visibilityInfo.visibleFraction > 0) {
                controller.animationController.forward();
              } else {
                controller.animationController.reverse();
              }
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 15.w),
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.w),
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
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.shadowColor.withOpacity(0.16),
                    offset: const Offset(0, 16),
                    blurRadius: 24,
                  )
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (imageLeftPosition)
                    Animate(
                      controller: controller.animationController,
                      effects: const [
                        FadeEffect(duration: Duration(milliseconds: 300))
                      ],
                      child: Expanded(
                        flex: 3,
                        child: Padding(
                          padding: EdgeInsets.only(right: 15.w),
                          child: SvgPicture.asset(
                            image,
                          ),
                        ),
                      ),
                    ),
                  Expanded(
                    flex: imageLeftPosition ? 7 : 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Gap(imageLeftPosition ? 30.h : 50.h),
                        Text(
                          title,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                color: Theme.of(context).primaryColor,
                              ),
                        ),
                        Gap(10.h),
                        Text(
                          subtitle,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Gap(15.h),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(8.w),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  buttonTitle,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                        fontWeight: FontWeight.w700,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                ),
                                Gap(5.w),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Theme.of(context).primaryColor,
                                  size: 16.h,
                                )
                              ],
                            ),
                          ),
                        ),
                        Gap(10.h)
                      ],
                    ),
                  ),
                  if (!imageLeftPosition)
                    Animate(
                      controller: controller.animationController,
                      effects: const [
                        FadeEffect(duration: Duration(milliseconds: 300))
                      ],
                      child: Expanded(
                        flex: 3,
                        child: Padding(
                          padding: EdgeInsets.only(left: 25.w),
                          child: SvgPicture.asset(
                            image,
                            height: 150.h,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
        });
  }
}

class MenuSecondaryController extends GetxController
    with GetTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void onInit() {
    animationController = AnimationController(vsync: this);
    super.onInit();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
