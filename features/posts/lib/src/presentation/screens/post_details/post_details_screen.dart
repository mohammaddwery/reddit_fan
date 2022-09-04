import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:posts/src/data/models/comment/comment.dart';
import 'package:posts/src/data/models/reply/reply.dart';
import 'package:posts/src/presentation/screens/post_details/post_details_bloc.dart';
import 'package:posts/src/presentation/widgets/comment_widget.dart';
import 'package:posts/src/presentation/widgets/post_card.dart';
import 'package:shared_presentation/shared_presentation.dart';
import '../../../data/models/post/post.dart';
import '../../helpers/posts_icons.dart';
import '../../helpers/posts_subtitles_keys.dart';
import '../../widgets/base_posts_screen.dart';
import '../../widgets/base_widget_state.dart';
import '../../widgets/posts_screen_title_widget.dart';
import '../../widgets/results_listing/result_listing_widget.dart';

class PostDetailsScreen extends StatefulWidget {
  final String postId;
  PostDetailsScreen({required this.postId});

  @override
  State<PostDetailsScreen> createState() => _PostDetailsScreenState();
}

class _PostDetailsScreenState extends BaseWidgetState<PostDetailsScreen> {

  late PostDetailsScreenBloc postDetailsScreenBloc;

  @override
  void initState() {
    postDetailsScreenBloc = AppInjector.I.get(param1: widget.postId);
    super.initState();
  }

  @override
  void dispose() {
    postDetailsScreenBloc.dispose();
    super.dispose();
  }

  @override
  Widget buildContent(BuildContext context) {
    return BasePostsScreen(
      appbarActions: [ buildBackButton() ],
      screenTitleWidget: PostScreenTitleWidget(
        titleKey: PostsSubtitlesKeys.hotPost,
        titleColor: Theme.of(context).colorScheme.secondary,
        iconUrl: PostsIcons.icFlame,
      ),
      contentWidget: buildScreenContent(),
    );
  }

  Widget buildBackButton() {
    return InkWell(
      onTap: () => Navigator.of(context).pop(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 20,
          ),
          const SizedBox(width: 12,),
          Text(
            postsLocal.translate(PostsSubtitlesKeys.back),
            style: TextStyle(
              color: Colors.white,
              height: 1.0,
              fontSize: AppFonts.getSize14(context),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildScreenContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 4,),
          PostCard(ModalRoute.of(context)!.settings.arguments as Post),
          const SizedBox(height: 32,),
          Text(
            postsLocal.translate(PostsSubtitlesKeys.latestComments),
            style: AppThemeFactory.getLargeBodyTextStyle(context, color: Theme.of(context).textTheme.bodyMedium?.color),
          ),
          const SizedBox(height: 16,),
          ResultListingWidget(
            resultsStream: postDetailsScreenBloc.listItemsStream,
            listItemBuilder: commentRepliesBuilder,
          ),
        ],
      ),
    );
  }

  Widget commentRepliesBuilder(BuildContext context, Comment comment) {
    return Column(
      children: [
        CommentWidget(comment),
        // if(comment.replies.isNotEmpty) const SizedBox(height: 8),
        ...buildRepliesWidgets(comment.replies),
      ],
    );
  }

  List<Widget> buildRepliesWidgets(List<Reply> replies) {
    return replies.map((reply) => Padding(
      padding: const EdgeInsets.only(left: 64, top: 8.0),
      child  : CommentWidget(reply),
    )).toList();
  }
}
