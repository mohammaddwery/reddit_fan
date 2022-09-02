import 'package:common_dependencies/common_dependencies.dart';
import 'package:posts/src/data/models/post/post.dart';

extension PostExtension on Post {
  String get formattedPublishedAt => DateFormat('dd/MM/yyy').format(publishedAt);
}