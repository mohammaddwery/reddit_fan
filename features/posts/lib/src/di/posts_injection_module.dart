import 'dart:async';

import 'package:common_dependencies/common_dependencies.dart';
import 'package:core/core.dart';
import 'package:posts/src/data/data_resource/remote_data_resource/post_api_provider.dart';
import 'package:posts/src/presentation/screens/posts/posts_screen_bloc.dart';
import 'package:shared_data/shared_data.dart';
import '../domain/use_case/posts/fetch_posts_use_case.dart';
import '../presentation/router/app_home_navigator.dart';

class PostsInjectionModule implements InjectionModule {
  @override
  FutureOr<void> registerDependencies({
    required Injector injector,
    required BuildConfig buildConfig,
  }) async {
    final dioFactory = injector.get<DioFactory>();
    final dio = dioFactory.provideDio(
        baseUrl: buildConfig.configs[BuildConfig.apiBaseUrlKey],
    );

    injector
        // DATA
      ..registerFactory(() => PostApiProvider(apiManager: injector.get<DioApiManager>(
        param1: dio,
      )))
        // DOMAIN
      ..registerFactory(() => FetchPostsUseCase(
        apiProvider: injector.get(),
      ),)
        // PRESENTATION
      ..registerFactory(() => PostsScreenBloc(
        fetchPostsUseCase: injector.get(),
      ),)
      ..registerFactory<PostsNavigator>(() => AppPostsNavigator(),)
    ;
  }
}
