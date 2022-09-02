import 'package:flutter/material.dart';
import 'package:posts/src/presentation/localization/posts_localization.dart';
import '../helpers/posts_subtitles_keys.dart';

class BasePostsScreen extends StatelessWidget {
  final List<Widget> appbarActions;
  final Widget screenTitleWidget;
  final Widget contentWidget;
  BasePostsScreen({
    required this.appbarActions,
    required this.screenTitleWidget,
    required this.contentWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          buildAppbar(context),
          Expanded(child: contentWidget),
        ],
      ),
    );
  }

  Widget buildAppbar(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.only(bottomRight: Radius.circular(80),),
            ),
            padding: const EdgeInsets.only(top: 54, bottom: 24,),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 44),
                Text(
                  PostsLocalization.of(context).translate(PostsSubtitlesKeys.reddit),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const Spacer(),
                ...appbarActions,
                const SizedBox(width: 32),
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(0),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(80),),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  blurRadius: 0,
                  spreadRadius: 0,
                  offset: const Offset(0.0, 2.0,),
                ),
              ],
            ),
            padding: const EdgeInsets.only(top: 30, right: 24, bottom: 24,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                screenTitleWidget,
              ],
            ),
          ),
        ),
      ],
    );
  }

}
