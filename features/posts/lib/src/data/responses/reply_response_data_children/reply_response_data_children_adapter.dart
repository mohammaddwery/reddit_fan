import 'package:core/core.dart';
import '../../../core/enum.dart';
import '../../models/reply/reply_adapter.dart';
import 'reply_response_data_child.dart';

List<ReplyResponseDataChild> adaptJsonToReplyResponseDataChildren(json) =>
    List<ReplyResponseDataChild>.from(json.map((x) => adaptJsonToReplyResponseDataChild(x)));

ReplyResponseDataChild adaptJsonToReplyResponseDataChild(json) => ReplyResponseDataChild(
  // kind: stringToEnum(json['kind'], ResponseDataChildKind.values)??ResponseDataChildKind.more,
  kind: ResponseDataChildKind.t1,
  reply: adaptJsonToReply(json['data']),
);