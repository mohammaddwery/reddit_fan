import 'package:posts/src/data/models/reply/reply.dart';
import 'base_comment.dart';

class Comment extends BaseComment {
  List<Reply> replies;
  Comment({
    required super.authorName,
    required super.name,
    required super.body,
    required this.replies,
  });
}