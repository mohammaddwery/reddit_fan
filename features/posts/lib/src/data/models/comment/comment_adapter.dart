import 'package:posts/src/data/models/post/post.dart';
import 'package:posts/src/data/models/reply/reply_adapter.dart';
import 'package:posts/src/data/responses/base_response/base_response_adapter.dart';
import 'package:posts/src/data/responses/post_response_data_children/post_response_data_child.dart';

import '../../responses/base_response/base_response.dart';
import '../../responses/comment_response_data_children/comment_response_data_child.dart';
import 'comment.dart';
import '../reply/reply.dart';

List<Comment> adaptBaseResponseToComments(BaseResponse baseResponse) =>
    (baseResponse.responseData.children as List<CommentResponseDataChild>).map((e) => e.comment).toList();

Comment adaptJsonToComment(json) => Comment(
  authorName: json['author_fullname']??'',
  name: json['name']??'',
  body: json['body']??'',
  replies: adaptJsonToReplies(json['replies']),
);
