import '../../models/post/post.dart';
import '../base_response/base_response.dart';

class PostResponseDataChild extends ResponseDataChild {
  final Post post;
  PostResponseDataChild({
    required this.post,
    required super.kind,
  });
}