import 'package:flutter/material.dart';

class AppColors {
  // Primary color
  static const Color primaryColor = Color(0xFF61a146);
  static const Color onPrimaryColor = Color(0xFFafd89d);

  // Secondary color
  static const Color secondaryColor = Color(0xFF3d692c);
  static const Color onSecondaryColor = Color(0xFFd3eac8);

  // Tertiary color
  static const Color surfaceColor = Color(0xFFd3eac8);
  static const Color onSurfaceColor = Color(0xFF61a146);
  // Background color
  static const Color backgroundColor = Color(0xFFf6faf3);
  static const Color onBackgroundColor = Color(0xFF2b4522);
  // Error color
  static const Color errorColor = Color(0xFFe53935);
  static const Color onErrorColor = Color(0xFFffc9c8);
}

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primaryColor,
      onPrimary: AppColors.onPrimaryColor,
      secondary: AppColors.secondaryColor,
      onSecondary: AppColors.onSecondaryColor,
      error: AppColors.errorColor,
      onError: AppColors.onErrorColor,
      background: AppColors.backgroundColor,
      onBackground: AppColors.onBackgroundColor,
      surface: AppColors.surfaceColor,
      onSurface: AppColors.onSurfaceColor,
    ),
  );
}

// #82bd69: {
//     '50': '#f6faf3',
//     '100': '#e9f5e3',
//     '200': '#d3eac8',
//     '300': '#afd89d',
//     '400': '#82bd69',
//     '500': '#61a146',
//     '600': '#4c8435',
//     '700': '#3d692c',
//     '800': '#345427',
//     '900': '#2b4522',
//     '950': '#13250e',
// }
