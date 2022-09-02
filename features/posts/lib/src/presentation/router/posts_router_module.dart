import 'package:common_dependencies/common_dependencies.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../screens/posts/posts_screen.dart';

class PostsRouterModule implements RouterModule {
  @override
  Map<String, MaterialPageRoute> getRoutes(RouteSettings settings) =>
      <String, MaterialPageRoute> {
        PostsRoutes.root: MaterialPageRoute(
          builder: (_) => const PostsScreen(),
          settings: settings,
        ),
      };
}
