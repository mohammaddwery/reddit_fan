import 'dart:async';
import 'package:core/core.dart';

class AppInjectionModule implements InjectionModule {
  @override
  FutureOr<void> registerDependencies({
    required Injector injector,
    required BuildConfig buildConfig,
  }) async {
    injector
      .registerSingleton<BuildConfig>(buildConfig);
  }
}
