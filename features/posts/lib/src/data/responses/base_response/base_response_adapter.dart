import 'package:core/core.dart';
import 'package:posts/src/core/enum.dart';
import 'package:posts/src/data/models/reply/reply.dart';
import 'package:posts/src/data/responses/post_response_data_children/post_response_data_children_adapter.dart';
import '../../models/comment/comment.dart';
import '../../models/post/post.dart';
import '../comment_response_data_children/comment_response_data_children_adapter.dart';
import '../reply_response_data_children/reply_response_data_children_adapter.dart';
import 'base_response.dart';

BaseResponse adaptJsonToBaseResponse<T>(json) => BaseResponse(
  kind: stringToEnum(json['kind'], ResponseKind.values)??ResponseKind.Listing,
  responseData: adaptJsonToResponseData<T>(json['data']),
);

ResponseData adaptJsonToResponseData<T>(json) => ResponseData(
  children: adaptJsonToResponseDataChildren<T>(json['children']),
);

List<ResponseDataChild> adaptJsonToResponseDataChildren<T>(List json) {
  switch(T) {
    case Comment:
      json.removeWhere((value) => stringToEnum(value['kind'], ResponseDataChildKind.values) != ResponseDataChildKind.t1);
      return adaptJsonToCommentResponseDataChildren(json);

    case Reply:
      json.removeWhere((value) => stringToEnum(value['kind'], ResponseDataChildKind.values) != ResponseDataChildKind.t1);
      return adaptJsonToReplyResponseDataChildren(json);

    case Post:
      json.removeWhere((value) => stringToEnum(value['kind'], ResponseDataChildKind.values) != ResponseDataChildKind.t3);
      return adaptJsonToPostResponseDataChildren(json);

    default: return [];
  }
}
