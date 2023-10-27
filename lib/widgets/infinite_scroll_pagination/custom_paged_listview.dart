import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medicare/widgets/infinite_scroll_pagination/default_indicator/custom_first_page_exception.dart';

class CustomPagedListView<T> extends StatelessWidget {
  const CustomPagedListView({
    super.key,
    required this.pagingController,
    required this.itemBuilder,
    this.padding,
  });
  final PagingController<int, T> pagingController;
  final Widget Function(BuildContext, T, int) itemBuilder;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return PagedListView<int, T>.separated(
      pagingController: pagingController,
      padding: padding,
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (context, index) => Gap(15.h),
      builderDelegate: PagedChildBuilderDelegate<T>(
        itemBuilder: itemBuilder,
        firstPageErrorIndicatorBuilder: (_) =>
            CustomFirstPageExceptionIndicator(
          title: 'Something went wrong',
          message: 'The application has encountered an error.\n'
              'Please try again later.',
          onTryAgain: () => pagingController.refresh(),
        ),
        noItemsFoundIndicatorBuilder: (_) =>
            const CustomFirstPageExceptionIndicator(
          title: 'No items found',
          message: 'The list is currently empty.',
        ),
      ),
    );
  }
}
