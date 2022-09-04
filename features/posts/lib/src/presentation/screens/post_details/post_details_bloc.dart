import 'package:posts/src/data/models/comment/comment.dart';
import '../../../domain/use_case/comment/fetch_comment_use_case.dart';
import '../../widgets/results_listing/base_results_listing_widget_bloc.dart';

class PostDetailsScreenBloc extends BaseResultsListingWidgetBloc<Comment> {
  final FetchCommentsUseCase _fetchCommentsUseCase;
  final String _postId;
  PostDetailsScreenBloc({required String postId, required FetchCommentsUseCase fetchCommentsUseCase})
      : _postId = postId, _fetchCommentsUseCase = fetchCommentsUseCase {
    fetchListItems();
  }

  @override
  fetchListItems({
    Function()? onData,
    Function(String message)? onError,
  }) {
    handleResultListRequest(
      getCurrentState: getListItems,
      setCurrentState: setListItems,
      onData: onData,
      onError: onError,
      exceptionTag: 'fetchComments()',
      getResponseResult: () async {
        return await _fetchCommentsUseCase.call(_postId);
      },
    );
  }


}