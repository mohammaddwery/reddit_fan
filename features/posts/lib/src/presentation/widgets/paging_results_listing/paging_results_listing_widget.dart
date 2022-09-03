import 'package:flutter/widgets.dart';
import 'package:posts/src/presentation/widgets/base_widget_state.dart';
import 'package:shared_presentation/shared_presentation.dart';
import '../../../core/enum.dart';
import '../../helpers/posts_subtitles_keys.dart';
import '../../ui_state.dart';
import 'base_paging_results_listing_widget_bloc.dart';

class PagingResultsListingWidget<T> extends StatefulWidget {
  final BasePagingResultsListingWidgetBloc<T> bloc;
  final Widget Function(T item) listItemBuilder;

  PagingResultsListingWidget({
    required this.listItemBuilder,
    required this.bloc,
  });

  @override
  State<PagingResultsListingWidget<T>> createState() => _PagingResultsListingWidgetState<T>();
}

class _PagingResultsListingWidgetState<T> extends BaseWidgetState<PagingResultsListingWidget<T>> {
  late BasePagingResultsListingWidgetBloc<T> bloc;
  
  @override
  void initState() {
    bloc = widget.bloc;
    super.initState();
  }


  @override
  Widget buildContent(BuildContext context) {
    return StreamBuilder<UiState<List<T>>?>(
        stream: bloc.pagingListItemsStream,
        builder: (context, listSnapshot) {
          switch (listSnapshot.data?.status) {
            case UiStateStatus.loading:
              return LoadingWidget();

            case UiStateStatus.success:
              return buildList(
                items: listSnapshot.data!.data!,
              );

            case UiStateStatus.noMoreResults:
              return buildList(
                items: listSnapshot.data!.data!,
                bottomExtraWidget: ExtraListItemWidget(postsLocal.translate(PostsSubtitlesKeys.noMoreResultsFound)),
              );

            case UiStateStatus.loadingMore:
              return buildList(
                items: listSnapshot.data!.data!,
                bottomExtraWidget: LoadingWidget(),
              );

            case UiStateStatus.noResults:
              return ErrorPlaceholderWidget(postsLocal.translate(PostsSubtitlesKeys.noResultsFound),);

            case UiStateStatus.failure:
              return buildFailedState(listSnapshot.data!);

            default:
              return Container();
          }
        });
  }

  Widget buildList({
    required List<T> items,
    Widget? bottomExtraWidget,
  }) {
    int itemCount = items.length + 1;

    return ListView.builder(
      itemCount: itemCount,
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      controller: bloc.scrollController,
      itemBuilder: (context, index) {
        return Column(
          children: [
            SizedBox(height: index == 0 ? 8 : 0,),
            if (index < itemCount - 1) widget.listItemBuilder(items[index],),
            if (index == itemCount - 1) Padding(
              padding: const EdgeInsets.all(8.0),
              child: bottomExtraWidget ?? Container(),
            ),
            SizedBox(height: index == items.length - 1 ? 32 : 20,),
          ],
        );
      },
    );
  }

  Widget buildFailedState(UiState<List<T>> uiState) {
    if (bloc.getPagingListItems()?.data?.isEmpty ?? true) {
      return ErrorPlaceholderWidget(postsLocal.translate(uiState.message!),);
    } else {
      return buildList(
        items: uiState.data!,
        bottomExtraWidget: ExtraListItemWidget(postsLocal.translate(uiState.message!)),
      );
    }
  }
}
