import 'package:flutter/material.dart';

String getTranslationFilePath({
  required Locale locale,
  String? packageName,
}) =>
    packageName != null
        ? 'packages/$packageName/assets/languages/${locale.languageCode}.json'
        : 'assets/languages/${locale.languageCode}.json';
