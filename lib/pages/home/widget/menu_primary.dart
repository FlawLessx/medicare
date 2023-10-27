import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:medicare/app/app.dart';
import 'package:medicare/constants/assets_constants.dart';
import 'package:medicare/models/_index.dart';
import 'package:medicare/widgets/custom_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MenuPrimary extends StatelessWidget {
  const MenuPrimary({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: MenuPrimaryController(),
      builder: (controller) {
        return Container(
          height: 200.h,
          margin: EdgeInsets.symmetric(horizontal: 15.w),
          child: Stack(
            children: [
              Positioned.fill(
                top: 40.h,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(8.w),
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.primaryColor.withOpacity(0.24),
                        offset: const Offset(0, 16),
                        blurRadius: 24,
                      )
                    ],
                  ),
                  child: Image.asset(
                    AssetsConstants.menuPrimaryBackground,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned.fill(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(
                      flex: 6,
                      child: SizedBox.shrink(),
                    ),
                    Expanded(
                      flex: 4,
                      child: Obx(
                        () => Animate(
                          controller: controller.animationController,
                          effects: const [
                            FadeEffect(duration: Duration(milliseconds: 500))
                          ],
                          child: SvgPicture.asset(
                            controller
                                .menus[controller.selectedMenu.value].image,
                            height: 160.h,
                            fit: controller.selectedMenu.value == 0
                                ? BoxFit.cover
                                : BoxFit.contain,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Positioned.fill(
                top: 40.h,
                child: PageView.builder(
                  onPageChanged: controller.onPageChanged,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(15.w),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 6,
                            child: Column(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                            '${controller.menus[index].title.split(',').first}, ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium!
                                            .copyWith(
                                              fontWeight: FontWeight.w600,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                      ),
                                      TextSpan(
                                        text: controller.menus[index].title
                                            .split(',')
                                            .last,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium!
                                            .copyWith(
                                              fontWeight: FontWeight.w800,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      controller.menus[index].subtitle,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 40.w),
                                  child: CustomButton(
                                    title: tr('general.more'),
                                    height: 32.h,
                                    fontSize: 12.sp,
                                  ),
                                )
                              ],
                            ),
                          ),
                          const Expanded(
                            flex: 4,
                            child: SizedBox.shrink(),
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: controller.menus.length,
                ),
              ),
              Positioned(
                bottom: 20.h,
                right: 20.w,
                child: Obx(
                  () => AnimatedSmoothIndicator(
                    count: controller.menus.length,
                    effect: ExpandingDotsEffect(
                      dotWidth: 8.h,
                      dotHeight: 8.h,
                      dotColor: Colors.white,
                      activeDotColor: Colors.white,
                    ),
                    onDotClicked: controller.onPageChanged,
                    activeIndex: controller.selectedMenu.value,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class MenuPrimaryController extends GetxController
    with GetTickerProviderStateMixin {
  RxInt selectedMenu = 0.obs;
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

  Future<void> onPageChanged(int value) async {
    animationController.reverse();
    await Future.delayed(const Duration(milliseconds: 500));
    selectedMenu.value = value;
    animationController.forward();
  }

  List<Menu> menus = [
    Menu(
      image: AssetsConstants.calendar,
      title:
          '${tr('home.menu_1_title_solution')},${tr('home.menu_1_title_your_health')}',
      subtitle: tr('home.menu_1_description'),
      onTap: () {},
    ),
    Menu(
      image: AssetsConstants.drugs,
      title: '${tr('home.menu_1_title_solution')},${tr('home.menu_2_title')}',
      subtitle: tr('home.menu_2_description'),
      onTap: () {},
    ),
    Menu(
      image: AssetsConstants.search,
      title: '${tr('home.menu_1_title_solution')},${tr('home.menu_3_title')}',
      subtitle: tr('home.menu_3_description'),
      onTap: () {},
    )
  ];
}
