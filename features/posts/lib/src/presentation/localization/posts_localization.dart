import 'package:core/core.dart';
import 'package:flutter/widgets.dart';

class PostsLocalization extends BaseLocalization {
  PostsLocalization({
    required this.appLocale,
    required this.appPathFunction,
  }) : super(appPathFunction: appPathFunction, locale: appLocale);
  @override
  // ignore: overridden_fields
  final String Function(Locale locale) appPathFunction;
  final Locale appLocale;
  static PostsLocalization of(BuildContext context) =>
      Localizations.of<PostsLocalization>(context, PostsLocalization)!;
}

class PostsLocalizationDelegate extends LocalizationsDelegate<PostsLocalization> {
  PostsLocalizationDelegate({
    required this.supportedLocales,
    required this.getPathFunction,
  });

  final List<Locale> supportedLocales;
  final String Function(Locale locale) getPathFunction;
  late Locale locale;

  @override
  bool isSupported(Locale locale) =>
      getSupportedLocaleForLanguageCode(supportedLocales, locale) != null;

  @override
  Future<PostsLocalization> load(Locale locale) async {
    this.locale = locale;
    final localization = PostsLocalization(
      appLocale: locale,
      appPathFunction: getPathFunction,
    );

    await localization.load();

    return localization;
  }

  @override
  bool shouldReload(PostsLocalizationDelegate old) => old.locale != locale;
}
