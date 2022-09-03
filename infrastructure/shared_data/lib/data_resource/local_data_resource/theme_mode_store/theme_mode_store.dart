
import 'package:core/core.dart';

abstract class ThemeModeStore {
  Future<bool> saveThemeMode(AppThemeMode themeMode);
  AppThemeMode? getThemeMode();
  Future<bool> deleteThemeMode();
}