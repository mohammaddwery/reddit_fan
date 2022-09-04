import 'package:flutter/material.dart';
import 'package:posts/src/core/posts_constants.dart';
import 'package:posts/src/data/models/comment/base_comment.dart';
import 'package:posts/src/presentation/helpers/posts_images.dart';
import 'package:shared_presentation/shared_presentation.dart';

class CommentWidget extends StatelessWidget {
  final BaseComment comment;
  CommentWidget(this.comment);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 24,
          child: ImageWidget(
            url: PostsImages.userPlaceholder,
            packageName: PostsConstants.packageName,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 16,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8,),
              Text(
                comment.authorName,
                style: AppThemeFactory.getLargeBodyTextStyle(context, color: Theme.of(context).textTheme.bodyMedium?.color),
              ),
              const SizedBox(height: 8,),
              Text(
                comment.body,
                style: AppThemeFactory.getSmallBodyTextStyle(context,),
              ),
            ],
          ),
        )
      ],
    );
  }
}
