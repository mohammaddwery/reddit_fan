import 'package:posts/src/core/posts_constants.dart';
import 'package:posts/src/data/data_resource/remote_data_resource/post_endpoints.dart';
import 'package:shared_data/shared_data.dart';

class PostApiProvider {
  final ApiManager _apiManager;
  PostApiProvider({required ApiManager apiManager}): _apiManager = apiManager;

  Future<dynamic> fetchPosts({
    String? after,
  }) async {
    final query = ApiUtils.buildApiQuery({
      "after": after,
      "limit": PostsConstants.fetchPostsLimit
    });
    final String url = '${PostEndpoints.getPosts}$query';
    return await _apiManager.get(url: url,);
  }

}