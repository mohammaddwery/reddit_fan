import 'package:core/core.dart';
import 'package:flutter/material.dart';
import '../../shared_presentation.dart';

// TODO: Need REFACTORING
class AppThemeFactory {
  static ThemeData getAppThemeData(AppThemeMode themeMode,) {
    switch(themeMode) {
      case AppThemeMode.dark:
        return _darkTheme;

      default: return _lightTheme;
    }
  }

  static ThemeData get _darkTheme => ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: AppColors.primaryDark,
    brightness: Brightness.dark,
    backgroundColor:  AppColors.backgroundDark,
    dividerColor: Colors.black12,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: Colors.white
      ),
      bodyLarge: TextStyle(
          color: Colors.white
      ),
    ),
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.primaryDark,
      onPrimary: AppColors.primaryDark,
      secondary: AppColors.secondary,
      onSecondary: AppColors.secondary,
      error: Colors.red,
      onError: Colors.red,
      background: AppColors.backgroundDark,
      onBackground: AppColors.backgroundDark,
      surface: AppColors.primaryDark,
      onSurface: AppColors.primaryDark,
    ),
  );

  static ThemeData get _lightTheme => ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: AppColors.primaryLight,
    brightness: Brightness.light,
    backgroundColor: AppColors.backgroundLight,
    dividerColor: Colors.white54,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
          color: Colors.black
      ),
      bodyLarge: TextStyle(
          color: Colors.black
      ),
    ),
    colorScheme:  const ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primaryLight,
      onPrimary: AppColors.primaryLight,
      secondary: AppColors.secondary,
      onSecondary: AppColors.secondary,
      error: Colors.red,
      onError: Colors.red,
      background: AppColors.backgroundLight,
      onBackground: AppColors.backgroundLight,
      surface: Colors.white,
      onSurface: Colors.white,
    ),
  );

  static TextStyle getSmallBodyTextStyle(BuildContext context) => TextStyle(
    fontSize: AppFonts.getSize14(context),
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondaryBody,
    height: 1.0,
  );

  static TextStyle getMediumBodyTextStyle(BuildContext context, {color=Colors.white}) => TextStyle(
    fontSize: AppFonts.getSize14(context),
    fontWeight: FontWeight.w500,
    color: color,
    height: 1.2,
  );

  static TextStyle getLargeBodyTextStyle(BuildContext context, {color=Colors.white}) => TextStyle(
    fontSize: AppFonts.getSize18(context),
    fontWeight: FontWeight.w600,
    color: color,
    height: 1.0,
  );
}