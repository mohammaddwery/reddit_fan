import 'dart:async';

import 'package:common_dependencies/common_dependencies.dart';
import 'package:core/core.dart';
import 'package:posts/src/presentation/screens/posts/posts_screen_bloc.dart';
import '../presentation/router/app_home_navigator.dart';

class PostsInjectionModule implements InjectionModule {
  @override
  FutureOr<void> registerDependencies({
    required Injector injector,
    required BuildConfig buildConfig,
  }) async {
    injector
        // PRESENTATION
      ..registerFactory(() => PostsScreenBloc(),)
        ..registerFactory<PostsNavigator>(() => AppPostsNavigator(),)
    ;
  }
}
