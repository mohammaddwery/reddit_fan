import 'package:core/core.dart';

class DevelopmentBuildConfig extends BuildConfig {
  @override
  // ignore: overridden_fields
  Map<String, dynamic> configs = {
    BuildConfig.apiBaseUrlKey: 'https://www.reddit.com/r/FlutterDev/',
  };
}
