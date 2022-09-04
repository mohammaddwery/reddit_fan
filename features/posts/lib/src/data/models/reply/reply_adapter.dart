import '../../responses/base_response/base_response.dart';
import '../../responses/base_response/base_response_adapter.dart';
import '../../responses/reply_response_data_children/reply_response_data_child.dart';
import '../reply/reply.dart';

List<Reply> adaptBaseResponseToReplies(BaseResponse baseResponse) =>
    (baseResponse.responseData.children as List<ReplyResponseDataChild>).map((e) => e.reply).toList();

List<Reply> adaptJsonToReplies(repliesJson) {
  if(repliesJson.toString().isEmpty) return [];

  BaseResponse repliesBaseResponse = adaptJsonToBaseResponse<Reply>(repliesJson);
  return adaptBaseResponseToReplies(repliesBaseResponse);
}

Reply adaptJsonToReply(json) => Reply(
  authorName: json['author_fullname']??'',
  name: json['name']??'',
  body: json['body']??'',
);

