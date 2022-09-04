import 'package:posts/src/data/models/comment/comment_adapter.dart';
import 'package:posts/src/data/responses/base_response/base_response_adapter.dart';
import '../../../data/data_resource/remote_data_resource/comment/comment_api_provider.dart';
import '../../../data/models/comment/comment.dart';

class FetchCommentsUseCase {
  final CommentApiProvider _apiProvider;
  FetchCommentsUseCase({required CommentApiProvider apiProvider}): _apiProvider = apiProvider;

  static const String logTag = 'FetchCommentsUseCase';

  Future<List<Comment>> call(String postId) async {
      final response = await _apiProvider.fetchComments(postId: postId);
      /// The returned response is list contains post object and comments object so we just took the comments object
      final commentsResponse = (response as List)[1];
      final baseResponse = adaptJsonToBaseResponse<Comment>(commentsResponse);
      return adaptBaseResponseToComments(baseResponse);
  }
}