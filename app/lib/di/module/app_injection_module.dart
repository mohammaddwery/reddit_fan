import 'dart:async';
import 'package:core/core.dart';
import 'package:shared_data/data_resource/data_resource.dart';
import 'package:shared_presentation/shared_presentation.dart';

class AppInjectionModule implements InjectionModule {
  @override
  FutureOr<void> registerDependencies({
    required Injector injector,
    required BuildConfig buildConfig,
  }) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    injector
        ..registerSingleton<BuildConfig>(buildConfig)
        ..registerSingleton<DioFactory>(DioFactory())
        ..registerFactoryParam((dio, _) => DioApiManager(
          dio: dio,
        ))
        ..registerSingleton<SharedPreferencesManager>(AppSharedPreferencesManager(
          preferences: preferences,
        ))
      ..registerSingleton<ThemeModeStore>(AppThemeModePreferencesStore(
          preferencesManager: injector.get(),
        ))
      ..registerSingleton<AppThemeModeBloc>(AppThemeModeBloc(
          themeModeStore: injector.get(),
        ))
    ;
  }
}
