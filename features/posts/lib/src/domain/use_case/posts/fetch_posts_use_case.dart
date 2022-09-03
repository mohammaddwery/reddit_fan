import 'package:posts/src/data/data_resource/remote_data_resource/post_api_provider.dart';
import 'package:posts/src/data/models/post/post.dart';
import 'package:posts/src/data/responses/base_response/base_response_adapter.dart';
import '../../../data/models/post/post_adapter.dart';

class FetchPostsUseCase {
  final PostApiProvider _apiProvider;
  FetchPostsUseCase({required PostApiProvider apiProvider}): _apiProvider = apiProvider;

  static const String logTag = 'FetchPostsUseCase';

  Future<List<Post>> call({String? after}) async {
      final response = await _apiProvider.fetchPosts(after: after);
      final baseResponse = adaptJsonToBaseResponse<Post>(response);
      return adaptBaseResponseToPosts(baseResponse);
  }
}