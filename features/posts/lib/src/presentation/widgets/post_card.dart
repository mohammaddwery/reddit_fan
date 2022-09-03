import 'package:flutter/material.dart';
import 'package:posts/src/data/models/post/post_extension.dart';
import 'package:posts/src/presentation/helpers/posts_subtitles_keys.dart';
import 'package:posts/src/presentation/localization/posts_localization.dart';
import 'package:shared_presentation/shared_presentation.dart';
import '../../data/models/post/post.dart';
import '../helpers/posts_icons.dart';

class PostCard extends StatelessWidget {
  final Post post;
  PostCard(this.post);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(24),
        boxShadow: AppColors.cardShadow,
      ),
      padding: const EdgeInsets.only(left: 12, top: 24, right: 12, bottom: 12,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${PostsLocalization.of(context).translate(PostsSubtitlesKeys.publishedBy)}: ${post.authorName}',
            style: AppThemeFactory.getSmallBodyTextStyle(context),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 2),
          Text(
            post.formattedPublishedAt,
            style: AppThemeFactory.getSmallBodyTextStyle(context),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 12),
          Text(
            post.body,
            style: AppThemeFactory.getMediumBodyTextStyle(context, color: Theme.of(context).textTheme.bodyMedium?.color),
            maxLines: 30,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ImageWidget(
                url: PostsIcons.icComment,
                packageName: 'posts',
                width: 20,
                height: 20,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 8,),
              Text(
                '${post.commentsCount}',
                style: AppThemeFactory.getSmallBodyTextStyle(context),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
