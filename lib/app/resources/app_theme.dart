import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@immutable
class AppTheme extends ThemeExtension<AppTheme> {
  // SF Pro Display - w400
  final TextStyle sfPro8w400;
  final TextStyle sfPro12w400;
  final TextStyle sfPro14w400;
  final TextStyle sfPro16w400;
  final TextStyle sfPro20w400; // Added sfPro20w400

  // SF Pro Display - w500
  final TextStyle sfPro12w500;

  // SF Pro Display - w600
  final TextStyle sfPro14w600;
  final TextStyle sfPro16w600; // Added sfPro16w600
  final TextStyle sfPro20w600; // Added sfPro20w600

  // SF Pro Display - w700
  final TextStyle sfPro12w700;
  final TextStyle sfPro16w700;

  // Colors
  final Color white;
  final Color black;
  final Color orangeColor;

  const AppTheme({
    // SF Pro Display
    required this.sfPro8w400,
    required this.sfPro12w400,
    required this.sfPro14w400,
    required this.sfPro16w400,
    required this.sfPro20w400, // Added sfPro20w400
    required this.sfPro12w500,
    required this.sfPro14w600,
    required this.sfPro16w600, // Added sfPro16w600
    required this.sfPro20w600, // Added sfPro20w600
    required this.sfPro12w700,
    required this.sfPro16w700,
    // Colors
    required this.white,
    required this.black,
    required this.orangeColor,
  });

  @override
  ThemeExtension<AppTheme> lerp(
      covariant ThemeExtension<AppTheme>? other, double t) {
    if (other is! AppTheme) {
      return this;
    }
    return AppTheme(
      // SF Pro Display
      sfPro8w400: TextStyle.lerp(sfPro8w400, other.sfPro8w400, t)!,
      sfPro12w400: TextStyle.lerp(sfPro12w400, other.sfPro12w400, t)!,
      sfPro14w400: TextStyle.lerp(sfPro14w400, other.sfPro14w400, t)!,
      sfPro16w400: TextStyle.lerp(sfPro16w400, other.sfPro16w400, t)!,
      sfPro20w400: TextStyle.lerp(sfPro20w400, other.sfPro20w400, t)!, // Added interpolation for sfPro20w400
      sfPro12w500: TextStyle.lerp(sfPro12w500, other.sfPro12w500, t)!,
      sfPro14w600: TextStyle.lerp(sfPro14w600, other.sfPro14w600, t)!,
      sfPro16w600: TextStyle.lerp(sfPro16w600, other.sfPro16w600, t)!, // Added interpolation for sfPro16w600
      sfPro20w600: TextStyle.lerp(sfPro20w600, other.sfPro20w600, t)!, // Added interpolation for sfPro20w600
      sfPro12w700: TextStyle.lerp(sfPro12w700, other.sfPro12w700, t)!,
      sfPro16w700: TextStyle.lerp(sfPro16w700, other.sfPro16w700, t)!,
      // Colors
      white: Color.lerp(white, other.white, t)!,
      black: Color.lerp(black, other.black, t)!,
      orangeColor: Color.lerp(orangeColor, other.orangeColor, t)!,
    );
  }

  static final light = AppTheme(
    // SF Pro Display
    sfPro8w400: TextStyle(
      fontFamily: 'SF Pro Display',
      fontSize: 8.sp,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    sfPro12w400: TextStyle(
      fontFamily: 'SF Pro Display',
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    sfPro14w400: TextStyle(
      fontFamily: 'SF Pro Display',
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    sfPro16w400: TextStyle(
      fontFamily: 'SF Pro Display',
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    sfPro20w400: TextStyle( // Added sfPro20w400 style
      fontFamily: 'SF Pro Display',
      fontSize: 20.sp,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    sfPro12w500: TextStyle(
      fontFamily: 'SF Pro Display',
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    sfPro14w600: TextStyle(
      fontFamily: 'SF Pro Display',
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    sfPro16w600: TextStyle( // Added sfPro16w600 style
      fontFamily: 'SF Pro Display',
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    sfPro20w600: TextStyle( // Added sfPro20w600 style
      fontFamily: 'SF Pro Display',
      fontSize: 20.sp,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    sfPro12w700: TextStyle(
      fontFamily: 'SF Pro Display',
      fontSize: 12.sp,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    sfPro16w700: TextStyle(
      fontFamily: 'SF Pro Display',
      fontSize: 16.sp,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    // Colors
    white: Colors.white,
    black: Colors.black,
    orangeColor: const Color(0xFFF93C00),
  );

  AppTheme copyWith({
    // SF Pro Display
    TextStyle? sfPro8w400,
    TextStyle? sfPro12w400,
    TextStyle? sfPro14w400,
    TextStyle? sfPro16w400,
    TextStyle? sfPro20w400, // Added sfPro20w400 to copyWith
    TextStyle? sfPro12w500,
    TextStyle? sfPro14w600,
    TextStyle? sfPro16w600, // Added sfPro16w600 to copyWith
    TextStyle? sfPro20w600, // Added sfPro20w600 to copyWith
    TextStyle? sfPro12w700,
    TextStyle? sfPro16w700,
    // Colors
    Color? white,
    Color? black,
    Color? orangeColor,
  }) {
    return AppTheme(
      // SF Pro Display
      sfPro8w400: sfPro8w400 ?? this.sfPro8w400,
      sfPro12w400: sfPro12w400 ?? this.sfPro12w400,
      sfPro14w400: sfPro14w400 ?? this.sfPro14w400,
      sfPro16w400: sfPro16w400 ?? this.sfPro16w400,
      sfPro20w400: sfPro20w400 ?? this.sfPro20w400, // Added sfPro20w400 to copyWith
      sfPro12w500: sfPro12w500 ?? this.sfPro12w500,
      sfPro14w600: sfPro14w600 ?? this.sfPro14w600,
      sfPro16w600: sfPro16w600 ?? this.sfPro16w600, // Added sfPro16w600 to copyWith
      sfPro20w600: sfPro20w600 ?? this.sfPro20w600, // Added sfPro20w600 to copyWith
      sfPro12w700: sfPro12w700 ?? this.sfPro12w700,
      sfPro16w700: sfPro16w700 ?? this.sfPro16w700,
      // Colors
      white: white ?? this.white,
      black: black ?? this.black,
      orangeColor: orangeColor ?? this.orangeColor,
    );
  }
}

// light theme example with AppTheme extension
ThemeData lightTheme = ThemeData.light(useMaterial3: true).copyWith(
  scaffoldBackgroundColor: const Color(0xffF2F2F2),
  splashColor: Colors.transparent,
  canvasColor: Colors.transparent,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    titleTextStyle: AppTheme.light.sfPro16w700,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
    ),
  ),
  extensions: <ThemeExtension<dynamic>>[
    AppTheme.light,
  ],
);
