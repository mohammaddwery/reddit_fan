import 'dart:async';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:posts/posts.dart';
import 'package:shared_data/data_resource/data_resource.dart';
import 'package:shared_presentation/shared_presentation.dart';
import '../app/my_app.dart';
import '../di/app_component.dart';
import '../resolvers/app_resolver.dart';

abstract class AppStart {
  final BuildConfig buildConfig;

  /// The order of initialization matters, otherwise you will end up with
  /// an exception because of gitIt registration.
  final resolvers = <FeatureResolver>[
    // App
    AppResolver(),

    // Features
    PostsResolver(),
  ];

  AppStart(this.buildConfig);

  Future<void> startApp() async {
    WidgetsFlutterBinding.ensureInitialized();

    final routerModules = <RouterModule>[];

    final delegates = <LocalizationsDelegate>[
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ];
    final injections = <InjectionModule>[];

    for (final resolver in resolvers) {
      if (resolver.routerModule != null) {
        routerModules.add(resolver.routerModule!);
      }

      if (resolver.localeDelegate != null) {
        delegates.add(resolver.localeDelegate!);
      }

      if (resolver.injectionModule != null) {
        injections.add(resolver.injectionModule!);
      }
    }

    await AppInjectionComponent.instance.registerModules(
      config: buildConfig,
      modules: injections,
    );
    AppThemeModeBloc appThemeModeBloc = AppInjector.I.get();
    await runZonedGuarded<Future<void>>(
      () async {
        runApp(
          _buildMyApp(
            routerModules: routerModules,
            localeDelegates: delegates,
            appThemeModeBloc: appThemeModeBloc,
          )
        );
      },
      (_, __) {
        debugPrint('runZonedGuarded() MyApp failed.');
      },
    );
  }

  Widget _buildMyApp({
    required List<LocalizationsDelegate> localeDelegates,
    required List<RouterModule> routerModules,
    required AppThemeModeBloc appThemeModeBloc,
  }) {
    return StreamBuilder<AppThemeMode>(
        initialData: adaptAppMaterialThemeModeToThemeMode(),
        stream: appThemeModeBloc.appThemeModeStream,
        builder: (context, appThemeModeSnapshot) {
          return MyApp(
            routes: routerModules,
            localeDelegates: localeDelegates,
            themeMode: appThemeModeSnapshot.data!,
          );
        }
    );
  }
}
