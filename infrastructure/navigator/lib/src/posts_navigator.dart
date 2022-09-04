import 'package:flutter/material.dart';

class PostsRoutes {
  PostsRoutes._();

  static const String root = '/';
  static const String details = '/details';
}

abstract class PostsNavigator {
  void navigateToDetails<A>(BuildContext context, A argument);
}
