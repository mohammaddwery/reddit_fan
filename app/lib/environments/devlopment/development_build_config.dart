import 'package:core/core.dart';

class DevelopmentBuildConfig extends BuildConfig {
  @override
  // ignore: overridden_fields
  Map<String, dynamic> configs = {
    BuildConfig.apiBaseUrlKey: const String.fromEnvironment('DEVELOPMENT_API_BASE_URL'),
  };
}
