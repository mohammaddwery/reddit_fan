import '../../models/comment/comment.dart';
import '../base_response/base_response.dart';

class CommentResponseDataChild extends ResponseDataChild {
  final Comment comment;
  CommentResponseDataChild({
    required this.comment,
    required super.kind,
  });
}