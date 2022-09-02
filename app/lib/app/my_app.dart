import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:shared_presentation/shared_presentation.dart';

class MyApp extends StatelessWidget {
  final List<LocalizationsDelegate> localeDelegates;
  final List<RouterModule> routes;

  const MyApp({
    required this.localeDelegates,
    required this.routes,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        onGenerateRoute: (settings) => generateRoute(
          settings: settings,
          routes: routes,
        ),
        theme: ThemeData(
          fontFamily: AppFonts.fontFamily,

        ),
        localeResolutionCallback: localeResolutionCallback,
        supportedLocales: appSupportedLocales,
        localizationsDelegates: localeDelegates,
        debugShowCheckedModeBanner: false,
      );

  Route<dynamic>? generateRoute({
    required List<RouterModule> routes,
    required RouteSettings settings,
  }) {
    final routesMap = <String, MaterialPageRoute>{};
    for (final route in routes) {
      routesMap.addAll(route.getRoutes(settings));
    }
    return routesMap[settings.name];
  }
}
