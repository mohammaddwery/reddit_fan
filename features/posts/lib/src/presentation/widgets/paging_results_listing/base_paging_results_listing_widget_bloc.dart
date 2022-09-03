import 'package:common_dependencies/common_dependencies.dart';
import 'package:core/core.dart';
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
    required Function(bool loadMore) onData,
    Function(String message)? onError,
  });

  handlePagingRequest({
    required int limit,
    required UiState<List<T>>? Function() getCurrentState,
    required Function(UiState<List<T>>? uiState) setCurrentState,
    required Future<List<T>> Function() getResponseResult,
    required Function(bool loadMore) onData,
    Function(String)? onError,
    required exceptionTag,
  }) async {
    try {
      _setInitialState(
        getPrevState: getCurrentState,
        setCurrentState: setCurrentState,
      );

      var items = await getResponseResult();

      _setFinalState(
        limit: limit,
        getPrevState: getCurrentState,
        currentData: items,
        setCurrentState: setCurrentState,
        onData: onData,
      );
    } on FormatException catch (error) {
      debugPrint('$logTag: $exceptionTag $error');
      UiState<List<T>>? dataRes = UiState.failure(error.message, oldData: getCurrentState()?.data);
      setCurrentState(dataRes);
      if (onError != null) onError(AppConstants.generalErrorMessageKey);
    } catch (error) {
      debugPrint('$logTag: $exceptionTag $error');
      UiState<List<T>>? dataRes = UiState.failure(AppConstants.generalErrorMessageKey, oldData: getCurrentState()?.data);
      setCurrentState(dataRes);
      if (onError != null) onError(AppConstants.generalErrorMessageKey);
    }
  }

  _setInitialState({
    required UiState<List<T>>? Function() getPrevState,
    required Function(UiState<List<T>>? uiState) setCurrentState,
  }) {
    if (getPrevState()?.data?.isNotEmpty ?? false) {
      setCurrentState(UiState.loadingMore(getPrevState()!.data!));
    } else {
      setCurrentState(UiState.loading());
    }
  }

  _setFinalState({
    required int limit,
    required Function(bool loadMore) onData,
    required UiState<List<T>>? Function() getPrevState,
    required List<T> currentData,
    required Function(UiState<List<T>>? uiState) setCurrentState,
  }) {
    UiState<List<T>>? uiState;
    bool loadMore = true;
    if (getPrevState()?.data?.isNotEmpty ?? false) {
      if (currentData.isNotEmpty) {
        if (currentData.length < limit) {
          loadMore = false;
          uiState = UiState.noMoreResults(getPrevState()!.data!..addAll(currentData));
        } else {
          uiState = UiState.success(
              getPrevState()!.data!.isEmpty
                  ? currentData
                  : getPrevState()!.data!..addAll(currentData)
          );
        }
      } else {
        loadMore = false;
        uiState = UiState.noMoreResults(getPrevState()!.data!);
      }
    } else {
      if (currentData.isNotEmpty) {
        if (currentData.length < limit) {
          loadMore = false;
          uiState = UiState.noMoreResults(currentData);
        } else {
          uiState = UiState.success(currentData);
        }
      } else {
        uiState = UiState.noResults();
      }
    }

    setCurrentState(uiState);
    onData(loadMore,);
  }
}