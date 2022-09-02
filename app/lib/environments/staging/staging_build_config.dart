import 'package:core/core.dart';

class StagingBuildConfig extends BuildConfig {
  @override
  // ignore: overridden_fields
  Map<String, dynamic> configs = {
    BuildConfig.apiBaseUrlKey: const String.fromEnvironment('STAGE_API_BASE_URL'),
  };
}
