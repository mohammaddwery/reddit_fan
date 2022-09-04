import 'package:common_dependencies/common_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:posts/src/presentation/helpers/posts_subtitles_keys.dart';
import 'package:posts/src/presentation/localization/posts_localization.dart';
import 'package:shared_presentation/shared_presentation.dart';
import '../../../core/enum.dart';
import '../../ui_state.dart';

class ResultListingWidget<T> extends StatelessWidget {
  final ValueStream<UiState<List<T>>?> resultsStream;
  final Function(BuildContext context, T item) listItemBuilder;
  ResultListingWidget({
    required this.resultsStream,
    required this.listItemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return buildResult();
  }

  Widget buildResult() {
    return StreamBuilder<UiState<List<T>>?>(
        stream: resultsStream,
        builder: (context, resultsSnapshot) {
          switch (resultsSnapshot.data?.status) {
            case UiStateStatus.loading:
              return LoadingWidget();
            case UiStateStatus.success:
              return buildList(resultsSnapshot.data!.data!);
            case UiStateStatus.noResults:
              return ErrorPlaceholderWidget(PostsLocalization.of(context).translate(PostsSubtitlesKeys.noResultsFound));
            case UiStateStatus.failure:
              return ErrorPlaceholderWidget(resultsSnapshot.data!.message!,);

            default:
              return Container();
          }
        });
  }

  Widget buildList(List<T> items) {
    return ListView.separated(
      itemCount: items.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      itemBuilder: (context, index) {
        return Column(
            children: [
              listItemBuilder(context, items[index],),
              SizedBox(height: index == items.length - 1 ? 32 : 0,),
            ]
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Padding(
          padding: EdgeInsets.symmetric(vertical: 12),
          child: Divider(),
        ),
    );
  }

}
