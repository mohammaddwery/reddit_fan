import 'package:common_dependencies/common_dependencies.dart';
import 'package:flutter/material.dart';

class AppPostsNavigator with AppNavigator implements PostsNavigator {
  @override
  void navigateToDetails<A>(BuildContext context, A arguments,) => navigateTo(
    context: context,
    routeName: PostsRoutes.details,
    arguments: arguments,
  );
}
