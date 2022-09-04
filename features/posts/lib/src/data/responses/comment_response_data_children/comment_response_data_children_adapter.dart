import 'package:core/core.dart';
import '../../../core/enum.dart';
import '../../models/comment/comment_adapter.dart';
import 'comment_response_data_child.dart';

List<CommentResponseDataChild> adaptJsonToCommentResponseDataChildren(json) =>
    List<CommentResponseDataChild>.from(json.map((x) => adaptJsonToCommentResponseDataChild(x)));

CommentResponseDataChild adaptJsonToCommentResponseDataChild(json) => CommentResponseDataChild(
  kind: stringToEnum(json['kind'], ResponseDataChildKind.values)??ResponseDataChildKind.more,
  comment: adaptJsonToComment(json['data']),
);