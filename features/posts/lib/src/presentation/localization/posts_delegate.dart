import 'package:core/core.dart';
import 'package:posts/src/presentation/localization/posts_localization.dart';

final postsLocalizationDelegate = PostsLocalizationDelegate(
  getPathFunction: (locale) => getTranslationFilePath(packageName: 'posts', locale: locale),
  supportedLocales: appSupportedLocales,
);
