import 'package:flutter/material.dart';

import '../enum/enum.dart';

adaptAppMaterialThemeModeToThemeMode() {
  ThemeMode systemThemeMode = ThemeMode.system;

  switch(systemThemeMode) {
    case ThemeMode.dark:
      return AppThemeMode.dark;

    default: return AppThemeMode.light;
  }
}