import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:posts/src/di/posts_injection_module.dart';
import 'package:posts/src/presentation/localization/posts_delegate.dart';
import 'package:posts/src/presentation/router/posts_router_module.dart';

class PostsResolver extends FeatureResolver {
  @override
  InjectionModule? get injectionModule => PostsInjectionModule();

  @override
  RouterModule? get routerModule => PostsRouterModule();

  @override
  LocalizationsDelegate? get localeDelegate => postsLocalizationDelegate;
}
