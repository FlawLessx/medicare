import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicare/app/app.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.title,
    this.onTap,
    this.loading = false,
    this.height,
    this.width,
    this.child,
    this.isOutline = false,
    this.icon,
    this.fontSize,
    this.color,
  }) : assert(title == null || child == null);
  final String? title;
  final Function()? onTap;
  final bool loading;
  final double? height;
  final double? width;
  final Widget? child;
  final bool isOutline;
  final Widget? icon;
  final double? fontSize;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: loading ? null : onTap,
      child: Container(
        height: height ?? 40.h,
        width: width ?? double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        decoration: BoxDecoration(
          color: isOutline ? null : AppTheme.primaryColor,
          borderRadius: BorderRadius.circular(10.w),
          border: isOutline ? Border.all(width: 1) : null,
        ),
        child: Center(
          child: loading
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 20.h,
                    width: 20.h,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(
                        isOutline ? AppTheme.primaryColor : Colors.white,
                      ),
                      strokeWidth: 2,
                    ),
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (icon != null)
                      Padding(
                        padding: EdgeInsets.only(right: 8.w),
                        child: icon!,
                      ),
                    child ??
                        Text(
                          title!,
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: isOutline
                                        ? color ?? AppTheme.textColor
                                        : Colors.white,
                                    fontSize: 14.sp,
                                  ),
                        ),
                  ],
                ),
        ),
      ),
    );
  }
}
