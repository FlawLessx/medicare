import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:medicare/app/app.dart';
import 'package:medicare/blocs/_index.dart';
import 'package:medicare/pages/home/widget/product_item.dart';
import 'package:medicare/widgets/custom_button.dart';
import 'package:medicare/widgets/shimmer_widget.dart';

class ListProducts extends StatelessWidget {
  const ListProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ListProductController(context),
      builder: (controller) {
        return Stack(
          children: [
            category(controller),
            Padding(
              padding: EdgeInsets.only(top: 50.h),
              child: products(),
            ),
          ],
        );
      },
    );
  }

  Widget category(ListProductController controller) {
    return BlocBuilder<ProductCubit, ProductState>(
      buildWhen: (previous, current) =>
          current is ProductCategoryLoading ||
          current is ProductCategoryLoaded ||
          current is ProductCategoryError,
      builder: (context, state) {
        if (state is ProductCategoryLoaded) {
          return SizedBox(
            height: 80.h,
            child: Obx(
              () => SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: state.datas.asMap().entries.map(
                    (e) {
                      return Padding(
                        padding: EdgeInsets.only(
                          right: 15.w,
                          left: e.key == 0 ? 15.w : 0,
                        ),
                        child: CustomButton(
                          width: 150.w,
                          height: 30.h,
                          fontSize: 12.sp,
                          borderRadius: 50.w,
                          title: e.value.name,
                          shadowColor:
                              controller.selectedCategoryIndex.value == e.key
                                  ? null
                                  : AppTheme.shadowColor.withOpacity(0.16),
                          textColor:
                              controller.selectedCategoryIndex.value == e.key
                                  ? null
                                  : Colors.black,
                          backgroundColor:
                              controller.selectedCategoryIndex.value == e.key
                                  ? null
                                  : Colors.white,
                          onTap: () {
                            controller.selectedCategoryIndex.value = e.key;
                            BlocProvider.of<ProductCubit>(context)
                                .lists(e.key == 0 ? null : e.value.id);
                          },
                        ),
                      );
                    },
                  ).toList(),
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

  Widget products() {
    return BlocBuilder<ProductCubit, ProductState>(
      buildWhen: (previous, current) =>
          current is ProductLoading ||
          current is ProductLoaded ||
          current is ProductError,
      builder: (context, state) {
        if (state is ProductLoaded) {
          return Container(
            color: Colors.transparent,
            height: 205.h,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: state.datas.asMap().entries.map(
                  (e) {
                    return Padding(
                      padding: EdgeInsets.only(
                        right: 15.w,
                        left: e.key == 0 ? 15.w : 0,
                      ),
                      child: ProductItem(data: e.value),
                    );
                  },
                ).toList(),
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
                      height: 140.h,
                      width: 140.h,
                      radius: 8.w,
                    ),
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }
}

class ListProductController extends GetxController {
  final BuildContext context;
  ListProductController(this.context);

  RxInt selectedCategoryIndex = 0.obs;
}
