import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medicare/app/app.dart';
import 'package:medicare/blocs/_index.dart';
import 'package:medicare/constants/assets_constants.dart';
import 'package:medicare/widgets/shimmer_widget.dart';

import 'service_item.dart.dart';

class ListServices extends StatelessWidget {
  const ListServices({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ListServiceController(context),
      builder: (controller) {
        return Stack(
          children: [
            category(controller),
            Padding(
              padding: EdgeInsets.only(top: 60.h),
              child: services(),
            ),
          ],
        );
      },
    );
  }

  Widget category(ListServiceController controller) {
    return BlocBuilder<ServiceCubit, ServiceState>(
      buildWhen: (previous, current) =>
          current is ServiceCategoryLoading ||
          current is ServiceCategoryLoaded ||
          current is ServiceCategoryError,
      builder: (context, state) {
        if (state is ServiceCategoryLoaded) {
          return Obx(
            () => SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15.w),
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 0),
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(50.w),
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.shadowColor.withOpacity(0.16),
                      offset: const Offset(0, 16),
                      blurRadius: 24,
                    )
                  ],
                ),
                child: Row(
                  children: state.datas
                      .asMap()
                      .entries
                      .map(
                        (e) => GestureDetector(
                          onTap: () {
                            controller.selectedCategoryIndex.value = e.key;
                            BlocProvider.of<ServiceCubit>(context)
                                .lists(e.value.id);
                          },
                          child: Chip(
                            backgroundColor:
                                controller.selectedCategoryIndex.value == e.key
                                    ? AppTheme.secondaryColor
                                    : Colors.white,
                            elevation: 0,
                            shadowColor: Colors.transparent,
                            label: Text(
                              e.value.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    color: Theme.of(context).primaryColor,
                                  ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          );
        }

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [1, 2, 3]
                .asMap()
                .entries
                .map(
                  (e) => Padding(
                    padding: EdgeInsets.only(
                      right: 15.w,
                      left: e.key == 0 ? 15.w : 0,
                    ),
                    child: ShimmerWidget(
                      height: 30.h,
                      width: 100.w,
                      radius: 50.w,
                    ),
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }

  Widget services() {
    return BlocBuilder<ServiceCubit, ServiceState>(
      buildWhen: (previous, current) =>
          current is ServiceLoading ||
          current is ServiceLoaded ||
          current is ServiceError,
      builder: (context, state) {
        if (state is ServiceLoaded) {
          return Column(
            children: [
              ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ServiceItem(data: state.datas[index]);
                },
                separatorBuilder: (context, index) => Gap(10.h),
                itemCount: state.datas.length,
              ),
              Gap(10.h),
              loadMoreButton(context)
            ],
          );
        }

        return ListView.separated(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return ShimmerWidget(
              height: 160.h,
              width: double.maxFinite,
              radius: 8.w,
            );
          },
          separatorBuilder: (context, index) => Gap(10.h),
          itemCount: 4,
        );
      },
    );
  }

  Widget loadMoreButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 15.w,
      ),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(8.w),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AssetsConstants.icGlyphLoad,
                height: 16.h,
              ),
              Gap(5.w),
              Text(
                tr('general.show_more'),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppTheme.shadowColor,
                      fontWeight: FontWeight.w600,
                    ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ListServiceController extends GetxController {
  final BuildContext context;
  ListServiceController(this.context);

  RxInt selectedCategoryIndex = 0.obs;
}
