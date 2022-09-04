import 'package:posts/src/core/posts_constants.dart';
import 'package:posts/src/data/data_resource/remote_data_resource/comment/comment_endpoints.dart';
import 'package:shared_data/shared_data.dart';

class CommentApiProvider {
  final ApiManager _apiManager;
  CommentApiProvider({required ApiManager apiManager}): _apiManager = apiManager;

  Future<dynamic> fetchComments({
    required String postId,
  }) async {
    final query = ApiUtils.buildApiQuery({
      "depth": PostsConstants.commentsLevelDepth,
      "limit": PostsConstants.fetchPostsLimit
    });
    final String url = '${CommentEndpoints.getComments}/$postId.json$query';
    return await _apiManager.get(url: url,);
  }

}