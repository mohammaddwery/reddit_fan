import 'package:common_dependencies/common_dependencies.dart';
import 'package:flutter/material.dart';

class AppPostsNavigator with AppNavigator implements PostsNavigator {
  @override
  void navigateToDetails(BuildContext context, {String? anchor}) => navigateTo(
    context: context,
    routeName: PostsRoutes.details,
    anchor: anchor,
  );
}
