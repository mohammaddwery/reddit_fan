import '../../models/comment/comment.dart';
import '../../models/reply/reply.dart';
import '../base_response/base_response.dart';

class ReplyResponseDataChild extends ResponseDataChild {
  final Reply reply;
  ReplyResponseDataChild({
    required this.reply,
    required super.kind,
  });
}