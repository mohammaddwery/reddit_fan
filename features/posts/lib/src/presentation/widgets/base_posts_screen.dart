import 'package:flutter/material.dart';
import 'package:posts/src/presentation/localization/posts_localization.dart';
import 'package:shared_presentation/shared_presentation.dart';
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
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: [
          buildAppbar(context),
          Expanded(child: contentWidget),
        ],
      ),
    );
  }

  Widget buildAppbar(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top:0.0,
          right: 0.0,
          bottom: 0.0,
          left: 0.0,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: AlignmentDirectional.centerStart,
                end: AlignmentDirectional.centerEnd,
                stops: const [0.25, .5, .75, 1.0],
                colors: [
                  Theme.of(context).primaryColor,
                  Theme.of(context).primaryColor,
                  Theme.of(context).backgroundColor,
                  Theme.of(context).backgroundColor,
                ],
              ),
            ),
          ),
        ),
        Column(
          children: [
            Container(
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
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: AppFonts.getSize32(context),
                      height: 1.0,
                    ),
                  ),
                  const Spacer(),
                  ...appbarActions,
                  const SizedBox(width: 32),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(80),),
              ),
              padding: const EdgeInsets.only(top: 30, right: 24, bottom: 24,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  screenTitleWidget,
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

}
