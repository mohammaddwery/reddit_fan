import 'dart:async';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:posts/posts.dart';
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

    await runZonedGuarded<Future<void>>(
      () async {
        runApp(
          MyApp(
            routes: routerModules,
            localeDelegates: delegates,
          ),
        );
      },
      (_, __) {
        debugPrint('runZonedGuarded() MyApp failed.');
      },
    );
  }
}
