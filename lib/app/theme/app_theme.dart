import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicare/constants/assets_constants.dart';

class AppTheme {
  // General
  static const Color primaryColor = Color(0xFF002060);
  static const Color primaryShadowColor = Color(0xFF1D334F);
  static const Color secondaryColor = Color(0xFF00D9D5);
  static const Color backgroundColor = Colors.white;
  static const Color shadowColor = Color(0xFFBEBEBE);

  // Text color
  static const Color textColor = Color(0XFF597393);
  static const Color textSecondaryColor = Color(0XFF6A6A6A);
  static const Color textReadyStockColor = Color(0XFF007025);
  static const Color textEmptyStockColor = Color.fromARGB(255, 216, 16, 9);

  // Shimmer
  static const Color shimmerHighlightColor = Color(0xFFF9F9FB);
  static const Color shimmerBaseColor = Color(0xFFE6E8EB);

  // Etc
  static const Color orange = Color(0xFFFF7200);
  static const Color red = Color(0xFFEB0004);
  static const Color greenBackground = Color(0xFFB3FFCB);
  static const Color redBackground = Color.fromARGB(255, 243, 165, 165);

  static final appTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: backgroundColor,
    primaryColor: primaryColor,
    textTheme: TextTheme(
      displayLarge: TextStyle(
        color: primaryColor,
        fontSize: 28.sp,
        fontWeight: FontWeight.w800,
        fontFamily: AssetsConstants.gilroyFontFamily,
      ),
      displayMedium: TextStyle(
        color: primaryColor,
        fontSize: 28.sp,
        fontWeight: FontWeight.w600,
        fontFamily: AssetsConstants.gilroyFontFamily,
      ),
      headlineLarge: TextStyle(
        color: textColor,
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        fontFamily: AssetsConstants.gilroyFontFamily,
      ),
      headlineMedium: TextStyle(
        color: textColor,
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        fontFamily: AssetsConstants.gilroyFontFamily,
      ),
      headlineSmall: TextStyle(
        color: primaryColor,
        fontSize: 14.sp,
        fontWeight: FontWeight.w700,
        fontFamily: AssetsConstants.gilroyFontFamily,
      ),
      titleLarge: TextStyle(
        color: primaryColor,
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        fontFamily: AssetsConstants.gilroyFontFamily,
      ),
      titleMedium: TextStyle(
        color: textColor,
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        fontFamily: AssetsConstants.gilroyFontFamily,
      ),
      titleSmall: TextStyle(
        color: textColor,
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        fontFamily: AssetsConstants.milliardFontFamily,
      ),
      bodyLarge: TextStyle(
        color: textSecondaryColor,
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        fontFamily: AssetsConstants.milliardFontFamily,
      ),
      bodyMedium: TextStyle(
        color: textSecondaryColor,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        fontFamily: AssetsConstants.milliardFontFamily,
      ),
      bodySmall: TextStyle(
        color: textSecondaryColor,
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        fontFamily: AssetsConstants.milliardFontFamily,
      ),
      labelMedium: TextStyle(
        color: textColor,
        fontSize: 10.sp,
        fontWeight: FontWeight.w600,
        fontFamily: AssetsConstants.milliardFontFamily,
      ),
      labelSmall: TextStyle(
        color: textColor,
        fontSize: 8.sp,
        fontWeight: FontWeight.w600,
        fontFamily: AssetsConstants.milliardFontFamily,
      ),
    ),
    colorScheme: const ColorScheme.light(
      primary: AppTheme.primaryColor,
      secondary: AppTheme.primaryColor,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      floatingLabelStyle: TextStyle(color: AppTheme.primaryColor),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: AppTheme.primaryColor),
      ),
    ),
    appBarTheme: AppBarTheme(
      elevation: 4,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarColor: Colors.white,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarContrastEnforced: true,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
      backgroundColor: Colors.white,
      shadowColor: shadowColor,
      titleTextStyle: TextStyle(
        color: textColor,
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: const IconThemeData(
        color: AppTheme.primaryColor,
      ),
    ),
  );
}
