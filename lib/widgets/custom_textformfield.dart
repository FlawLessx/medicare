import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:medicare/app/app.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    this.label,
    this.hint,
    this.validator,
    this.obscureText = false,
    this.suffixIcon,
    this.prefixIcon,
    this.isUnderline = true,
    this.enabled = true,
    this.readOnly = false,
    this.onTap,
    this.onEditingComplete,
    this.keyboardType,
    this.labelBehavior,
    this.useDecoration = true,
    this.style,
    this.onChanged,
    this.suffixText,
    this.focusNode,
  });

  final TextEditingController controller;
  final String? label;
  final String? hint;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool isUnderline;
  final bool enabled;
  final bool readOnly;
  final Function()? onTap;
  final Function()? onEditingComplete;
  final TextInputType? keyboardType;
  final FloatingLabelBehavior? labelBehavior;
  final bool useDecoration;
  final TextStyle? style;
  final Function(String)? onChanged;
  final String? suffixText;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
        border: !useDecoration
            ? InputBorder.none
            : isUnderline
                ? UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppTheme.primaryColor.withOpacity(0.5),
                      width: 3,
                    ),
                  )
                : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.w),
                    borderSide: BorderSide(
                      color: AppTheme.primaryColor.withOpacity(0.5),
                      width: 3,
                    ),
                  ),
        enabledBorder: !useDecoration
            ? InputBorder.none
            : isUnderline
                ? UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                      width: 1,
                    ),
                  )
                : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.w),
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                      width: 1,
                    ),
                  ),
        focusedBorder: !useDecoration
            ? InputBorder.none
            : isUnderline
                ? UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppTheme.primaryColor.withOpacity(0.5),
                      width: 3,
                    ),
                  )
                : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.w),
                    borderSide: BorderSide(
                      color: AppTheme.primaryColor.withOpacity(0.5),
                      width: 3,
                    ),
                  ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon != null
            ? Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: suffixIcon,
              )
            : (onTap != null ? const Icon(Icons.arrow_drop_down) : null),
        suffixIconConstraints:
            isUnderline ? const BoxConstraints(minWidth: 20) : null,
        contentPadding:
            isUnderline ? null : EdgeInsets.symmetric(horizontal: 10.w),
      ),
      validator: validator,
    );
  }
}
