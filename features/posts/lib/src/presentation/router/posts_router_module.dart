import 'package:common_dependencies/common_dependencies.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:posts/src/data/models/post/post.dart';
import 'package:posts/src/presentation/screens/post_details/post_details_screen.dart';
import '../screens/posts/posts_screen.dart';

class PostsRouterModule implements RouterModule {
  @override
  Map<String, MaterialPageRoute> getRoutes(RouteSettings settings) =>
      <String, MaterialPageRoute> {
        PostsRoutes.root: MaterialPageRoute(
          builder: (_) => const PostsScreen(),
          settings: settings,
        ),
        PostsRoutes.details: MaterialPageRoute(
          builder: (_) => PostDetailsScreen(postId: (settings.arguments as Post).id),
          settings: settings,
        ),
      };
}
