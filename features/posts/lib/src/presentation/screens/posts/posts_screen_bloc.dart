import 'package:posts/src/core/posts_constants.dart';
import 'package:posts/src/presentation/widgets/paging_results_listing/base_paging_results_listing_widget_bloc.dart';
import '../../../data/models/post/post.dart';
import '../../../domain/use_case/posts/fetch_posts_use_case.dart';

class PostsScreenBloc extends BasePagingResultsListingWidgetBloc<Post> {
  final FetchPostsUseCase _fetchPostsUseCase;
  PostsScreenBloc({required FetchPostsUseCase fetchPostsUseCase})
      : _fetchPostsUseCase = fetchPostsUseCase;

  @override
  fetchPagingListItems({
    required Function(bool loadMore) onData,
    Function(String message)? onError,
  }) => handlePagingRequest(
    limit: PostsConstants.fetchPostsLimit,
    getCurrentState: getPagingListItems,
    setCurrentState: setPagingListItems,
    onData: onData,
    exceptionTag: 'fetchPosts()',
    getResponseResult: () async {
      String? after = getPagingListItems()?.data?.last.name;
      return await _fetchPostsUseCase.call(after: after);
    },
  );
}