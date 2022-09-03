import 'package:core/core.dart';
import '../../../core/enum.dart';
import '../../models/post/post_adapter.dart';
import 'post_response_data_child.dart';

List<PostResponseDataChild> adaptJsonToPostResponseDataChildren(json) =>
    List<PostResponseDataChild>.from(json.map((x) => adaptJsonToPostResponseDataChild(x)));

PostResponseDataChild adaptJsonToPostResponseDataChild(json) => PostResponseDataChild(
  kind: stringToEnum(json['kind'], ResponseDataChildKind.values)??ResponseDataChildKind.more,
  post: adaptJsonToPost(json['data']),
);