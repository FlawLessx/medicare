import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:medicare/app/app.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.title,
    required this.controller,
    this.label,
    this.hint,
    this.validator,
    this.obscureText = false,
    this.suffixIcon,
    this.prefixIcon,
    this.enabled = true,
    this.readOnly = false,
    this.onTap,
    this.onEditingComplete,
    this.keyboardType,
    this.labelBehavior,
    this.style,
    this.onChanged,
    this.suffixText,
    this.focusNode,
    this.errorText,
    this.textCapitalization,
    this.borderRadius,
  });

  final String? title;
  final TextEditingController controller;
  final String? label;
  final String? hint;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool enabled;
  final bool readOnly;
  final Function()? onTap;
  final Function()? onEditingComplete;
  final TextInputType? keyboardType;
  final FloatingLabelBehavior? labelBehavior;
  final TextStyle? style;
  final Function(String)? onChanged;
  final String? suffixText;
  final FocusNode? focusNode;
  final String? errorText;
  final TextCapitalization? textCapitalization;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null && title!.isNotEmpty)
          Text(
            title!,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(borderRadius ?? 8.w),
            boxShadow: [
              BoxShadow(
                color: AppTheme.shadowColor.withOpacity(0.16),
                offset: const Offset(0, 16),
                blurRadius: 24,
              )
            ],
          ),
          child: TextFormField(
            controller: controller,
            cursorColor: AppTheme.primaryColor,
            obscureText: obscureText,
            onEditingComplete: onEditingComplete,
            style: style ?? TextStyle(fontSize: 14.sp, color: Colors.black),
            enabled: enabled,
            onTap: onTap,
            readOnly: readOnly,
            keyboardType: keyboardType,
            onChanged: onChanged,
            focusNode: focusNode,
            textCapitalization: textCapitalization ?? TextCapitalization.none,
            decoration: InputDecoration(
              labelText: label,
              hintText: hint,
              suffixText: suffixText,
              alignLabelWithHint: true,
              floatingLabelBehavior: labelBehavior,
              hintStyle: TextStyle(
                fontSize: 14.sp,
                color: AppTheme.textSecondaryColor,
              ),
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 8.w),
                borderSide: BorderSide(
                  color: AppTheme.primaryColor.withOpacity(0.5),
                  width: 3,
                ),
              ),
              errorBorder: InputBorder.none,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon != null
                  ? Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: suffixIcon,
                    )
                  : (onTap != null ? const Icon(Icons.arrow_drop_down) : null),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 16.h,
              ),
            ),
            validator: validator,
          ),
        ),
        if (errorText != null && errorText!.isNotEmpty)
          Padding(
            padding: EdgeInsets.only(top: 5.h, left: 10.w),
            child: Text(
              errorText!,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: const Color.fromARGB(255, 239, 62, 49),
                  ),
            ),
          )
      ],
    );
  }
}
