import 'dart:async';
import 'package:common_dependencies/common_dependencies.dart';
import 'package:core/core.dart';
import 'package:posts/src/data/data_resource/remote_data_resource/comment/comment_api_provider.dart';
import 'package:posts/src/data/data_resource/remote_data_resource/post/post_api_provider.dart';
import 'package:posts/src/presentation/screens/post_details/post_details_bloc.dart';
import 'package:posts/src/presentation/screens/posts/posts_screen_bloc.dart';
import 'package:shared_data/shared_data.dart';
import '../domain/use_case/comment/fetch_comment_use_case.dart';
import '../domain/use_case/post/fetch_posts_use_case.dart';
import '../presentation/router/app_posts_navigator.dart';

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
      ..registerFactory(() => CommentApiProvider(apiManager: injector.get<DioApiManager>(
        param1: dio,
      )))
        // DOMAIN
      ..registerFactory(() => FetchPostsUseCase(
        apiProvider: injector.get(),
      ),)
      ..registerFactory(() => FetchCommentsUseCase(
        apiProvider: injector.get(),
      ),)
        // PRESENTATION
      ..registerFactory(() => PostsScreenBloc(
        fetchPostsUseCase: injector.get(),
      ),)
      ..registerFactoryParam((param1, _) => PostDetailsScreenBloc(
        postId: param1,
        fetchCommentsUseCase: injector.get(),
      ),)
      ..registerFactory<PostsNavigator>(() => AppPostsNavigator(),)
    ;
  }
}
