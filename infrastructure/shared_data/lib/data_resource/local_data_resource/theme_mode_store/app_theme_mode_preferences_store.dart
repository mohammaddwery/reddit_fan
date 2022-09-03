import 'package:core/core.dart';
import '../shared_preferences_manager/shared_preferences_manager.dart';
import 'theme_mode_store.dart';

class AppThemeModePreferencesStore with ThemeModeStore {
  final SharedPreferencesManager _preferencesManager;
  AppThemeModePreferencesStore({required SharedPreferencesManager preferencesManager,})
      : _preferencesManager = preferencesManager;

  static const String _themeModeKey = 'theme_mode';

  @override
  AppThemeMode? getThemeMode() {
    return stringToEnum(_preferencesManager.fetchString(_themeModeKey), AppThemeMode.values);
  }

  @override
  Future<bool> saveThemeMode(AppThemeMode themeMode) async {
    return await _preferencesManager.save(_themeModeKey, enumToString(themeMode));
  }

  @override
  Future<bool> deleteThemeMode() async {
    return await _preferencesManager.delete(_themeModeKey);
  }
}
