import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

void showSnackbar(
  BuildContext context,
  String message,
  bool isSuccess, {
  bool floating = true,
  Color? color,
  EdgeInsetsGeometry? margin,
  bool useAction = false,
  String actionLabel = 'Close',
  Function()? actionOnTap,
  Duration? durationTime,
}) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        duration: durationTime ?? Duration(seconds: useAction ? 5 : 3),
        margin: margin,
        content: Row(
          children: [
            Icon(
              isSuccess ? Icons.check_circle : Icons.warning,
              color: Colors.white,
            ),
            Gap(5.w),
            Column(
              children: [
                Text(
                  isSuccess ? "snackbar.success" : "snackbar.error",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ).tr(),
                Text(
                  message,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
        action: useAction
            ? SnackBarAction(
                label: actionLabel,
                onPressed: () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  actionOnTap?.call();
                },
                textColor: Colors.white,
              )
            : null,
        behavior: floating ? SnackBarBehavior.floating : SnackBarBehavior.fixed,
        backgroundColor: color ?? (isSuccess ? Colors.green : Colors.red),
      ),
    );
}

void showLoadingSnackbar(String message, BuildContext context, Color color) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(hours: 1),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            message,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.sp,
            ),
          ),
          const CircularProgressIndicator.adaptive(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          )
        ],
      ),
      backgroundColor: color,
    ),
  );
}
