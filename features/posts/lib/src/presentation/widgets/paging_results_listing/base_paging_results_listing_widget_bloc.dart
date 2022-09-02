import 'package:common_dependencies/common_dependencies.dart';
import 'package:flutter/material.dart';
import '../../ui_state.dart';

abstract class BasePagingResultsListingWidgetBloc<T> {

  BasePagingResultsListingWidgetBloc() {
    _listenScrollController();
    fetchPagingListItems(
      onData: (loadMore) => this.loadMore = loadMore,
    );
  }

  static const logTag = 'BasePagingResultsListingWidgetBloc';

  void dispose() {
    scrollController.dispose();
    _pagingListItemsController.close();
  }

  final BehaviorSubject<UiState<List<T>>?> _pagingListItemsController = BehaviorSubject();
  ValueStream<UiState<List<T>>?> get pagingListItemsStream => _pagingListItemsController.stream;
  UiState<List<T>>? getPagingListItems() => _pagingListItemsController.valueOrNull;
  void setPagingListItems(UiState<List<T>>? uiState) => _pagingListItemsController.sink.add(uiState);

  final ScrollController scrollController = ScrollController();

  bool loadMore = true;
  bool get _isBottom {
    return scrollController.position.atEdge && (scrollController.position.pixels != 0);
  }

  _listenScrollController() {
    scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_isBottom && loadMore) {
      loadMore = false;
      fetchPagingListItems(
        onData: (loadMore) => this.loadMore = loadMore,
      );
    }
  }

  fetchPagingListItems({
    int? skip,
    required Function(bool loadMore) onData,
    Function(String message)? onError,
  });
}