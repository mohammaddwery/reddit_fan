import 'package:posts/src/core/posts_constants.dart';
import 'package:shared_data/shared_data.dart';
import 'post_endpoints.dart';

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