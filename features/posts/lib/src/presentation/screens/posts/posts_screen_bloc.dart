import 'package:posts/src/presentation/ui_state.dart';
import 'package:posts/src/presentation/widgets/paging_results_listing/base_paging_results_listing_widget_bloc.dart';
import '../../../data/models/post/post.dart';

class PostsScreenBloc extends BasePagingResultsListingWidgetBloc<Post> {
  // final UseCase fetchPostsUseCase;
  // PostsScreenBloc({required this.fetchPostsUseCase});

  @override
  fetchPagingListItems({
    int? skip,
    required Function(bool loadMore) onData,
    Function(String message)? onError,
  }) async {
    if((getPagingListItems()?.data?.length??0) == 0) setPagingListItems(UiState.loading());
    else setPagingListItems(UiState.loadingMore(mockPosts));

    Future.delayed(const Duration(seconds: 2), () {
      setPagingListItems(UiState.success(mockPosts));
      onData(true);
    },);
  }

  List<Post> get mockPosts => [
    Post(authorName: 'Gol D Roger', body: 'Hello There What are you doing for now! Hello There What are you doing for now! Hello There What are you doing for now! Hello There What are you doing for now! Hello There What are you doing for now! Hello There What are you doing for now!', commentsCount: 5, publishedAt: DateTime.now().toLocal()),
    Post(authorName: 'Gol D Roger', body: 'Hello There What are you doing for now! Hello There What are you doing for now!', commentsCount: 5, publishedAt: DateTime.now().toLocal()),
    Post(authorName: 'Gol D Roger', body: 'Hello There What are you doing for now!', commentsCount: 5, publishedAt: DateTime.now().toLocal()),
    Post(authorName: 'Gol D Roger', body: 'Hello There What are you doing for now! Hello There What are you doing for now!', commentsCount: 5, publishedAt: DateTime.now().toLocal()),
    Post(authorName: 'Gol D Roger', body: 'Hello There What are you doing for now! Hello There What are you doing for now! Hello There What are you doing for now!', commentsCount: 5, publishedAt: DateTime.now().toLocal()),
    Post(authorName: 'Gol D Roger', body: 'Hello There What are you doing for now!', commentsCount: 5, publishedAt: DateTime.now().toLocal()),
    Post(authorName: 'Gol D Roger', body: 'Hello There What are you doing for now! Hello There What are you doing for now! Hello There What are you doing for now! Hello There What are you doing for now! Hello There What are you doing for now!', commentsCount: 5, publishedAt: DateTime.now().toLocal()),
    Post(authorName: 'Gol D Roger', body: 'Hello There What are you doing for now!', commentsCount: 5, publishedAt: DateTime.now().toLocal()),
    Post(authorName: 'Gol D Roger', body: 'Hello There What are you doing for now!', commentsCount: 5, publishedAt: DateTime.now().toLocal()),
    Post(authorName: 'Gol D Roger', body: 'Hello There What are you doing for now!', commentsCount: 5, publishedAt: DateTime.now().toLocal()),
    Post(authorName: 'Gol D Roger', body: 'Hello There What are you doing for now!', commentsCount: 5, publishedAt: DateTime.now().toLocal()),
    Post(authorName: 'Gol D Roger', body: 'Hello There What are you doing for now!', commentsCount: 5, publishedAt: DateTime.now().toLocal()),
  ];
}