import 'package:common_dependencies/common_dependencies.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:shared_data/data_resource/data_resource.dart';


class AppThemeModeBloc {
  final ThemeModeStore _themeModeStore;
  AppThemeModeBloc({
    required ThemeModeStore themeModeStore
  }): _themeModeStore = themeModeStore {
    _initAppThemeData();
  }

  static const String logTag = 'AppThemeModeBloc';

  final BehaviorSubject<AppThemeMode> _appThemeModeController = BehaviorSubject.seeded(adaptAppMaterialThemeModeToThemeMode());
  ValueStream<AppThemeMode> get appThemeModeStream => _appThemeModeController.stream;
  AppThemeMode getAppThemeMode() => _appThemeModeController.value;
  void setAppThemeMode(AppThemeMode themeMode) => _appThemeModeController.sink.add(themeMode);

  _initAppThemeData() {
    AppThemeMode? appThemeMode;
    try {
      appThemeMode = _themeModeStore.getThemeMode();
    } catch (e) {
      debugPrint('$logTag _initAppThemeData(): $e');
    }

    if(appThemeMode==null) {
      appThemeMode = adaptAppMaterialThemeModeToThemeMode();
      _themeModeStore.saveThemeMode(appThemeMode!);
    }

    setAppThemeMode(appThemeMode);
  }

  switchDisplayMode() {
    if(getAppThemeMode() == AppThemeMode.light) {
      _updateDisplayMode(AppThemeMode.dark);
    } else {
      _updateDisplayMode(AppThemeMode.light);
    }
  }

  _updateDisplayMode(AppThemeMode appThemeMode) {
    _themeModeStore.saveThemeMode(appThemeMode);
    setAppThemeMode(appThemeMode);
  }
}