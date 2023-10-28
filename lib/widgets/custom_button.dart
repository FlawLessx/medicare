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
    this.textColor,
    this.suffixIcon,
    this.borderRadius,
    this.shadowColor,
    this.backgroundColor,
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
  final Color? textColor;
  final Icon? suffixIcon;
  final double? borderRadius;
  final Color? shadowColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: loading ? null : onTap,
        borderRadius: BorderRadius.circular(borderRadius ?? 8.w),
        // splashColor: AppTheme.primaryShadowColor,
        child: Container(
          height: height ?? 48.h,
          width: width ?? double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          decoration: BoxDecoration(
            color:
                backgroundColor ?? (isOutline ? null : AppTheme.primaryColor),
            borderRadius: BorderRadius.circular(borderRadius ?? 8.w),
            border: isOutline ? Border.all(width: 1) : null,
            boxShadow: [
              BoxShadow(
                color: shadowColor ??
                    AppTheme.primaryShadowColor.withOpacity(0.24),
                offset: const Offset(0, 16),
                blurRadius: 24,
              ),
            ],
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
                      if (suffixIcon != null)
                        SizedBox(
                          width: suffixIcon!.size,
                        ),
                      Expanded(
                        child: Row(
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
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                        fontSize: fontSize ??
                                            Theme.of(context)
                                                .textTheme
                                                .titleLarge!
                                                .fontSize,
                                        color: textColor ??
                                            (isOutline
                                                ? AppTheme.textColor
                                                : Colors.white),
                                      ),
                                ),
                          ],
                        ),
                      ),
                      if (suffixIcon != null) suffixIcon!
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
