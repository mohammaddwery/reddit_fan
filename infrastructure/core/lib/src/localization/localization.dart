import 'dart:collection';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

/// Base class to create a Locale Delegate
class BaseLocalization {
  final Locale locale;
  final String Function(Locale locale) appPathFunction;
  BaseLocalization({
    required this.locale,
    required this.appPathFunction,
  });

  static BaseLocalization of(BuildContext context) =>
      Localizations.of<BaseLocalization>(context, BaseLocalization)!;

  final Map<String, dynamic> _subtitles = HashMap();
  static const String LOG_TAG = 'BaseLocalization';
  
  /// Initialize the locale-specific strings.
  /// It searchs for a string file in the
  /// provided appPathFunction and set them into the Intl.defaultLocale.
  Future<void> load() async {
    try {
      _debugPrint('Loading locale: $locale');
      final data = await rootBundle.loadString(appPathFunction(locale));
      final Map<String, dynamic> _subtitles = json.decode(data);
      _debugPrint('Loaded ${_subtitles.keys.length} keys');

      final localeName = locale.countryCode?.isEmpty == null
          ? locale.languageCode
          : locale.toString();
      final canonicalLocaleName = Intl.canonicalizedLocale(localeName);
      Intl.defaultLocale = canonicalLocaleName;
    } catch (exception) {
      _debugPrint(exception.toString());
    }
  }

  String translate(String key,) {
    String? message = _loadMessage(key);


    if (message == null) {
      _debugPrint('WARN [LOCALIZATION]: Could not find valid localization string for key $key, $locale');
      return key;
    }

    return message;
  }

  String? _loadMessage(String key) {
    final value = _subtitles[key];

    if (value == null || (value is! String)) {
      return null;
    }

    return value;
  }
  
  void _debugPrint(String message) => debugPrint('$LOG_TAG $message');
  
}
