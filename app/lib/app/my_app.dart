import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:shared_presentation/shared_presentation.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  final List<LocalizationsDelegate> localeDelegates;
  final List<RouterModule> routes;
  final AppThemeMode themeMode;

  const MyApp({
    required this.localeDelegates,
    required this.routes,
    required this.themeMode,
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) => MaterialApp(
    onGenerateRoute: (settings) => generateRoute(
      settings: settings,
      routes: routes,
    ),
    navigatorKey: navigatorKey,
    theme: AppThemeFactory.getAppThemeData(themeMode),
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
