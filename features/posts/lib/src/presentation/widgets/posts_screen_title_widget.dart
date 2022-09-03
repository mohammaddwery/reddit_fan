import 'package:flutter/material.dart';
import 'package:posts/src/core/posts_constants.dart';
import 'package:posts/src/presentation/localization/posts_localization.dart';
import 'package:shared_presentation/shared_presentation.dart';

class PostScreenTitleWidget extends StatelessWidget {
  final String titleKey;
  final Color titleColor;
  final String iconUrl;
  PostScreenTitleWidget({
    required this.titleColor,
    required this.titleKey,
    required this.iconUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          PostsLocalization.of(context).translate(titleKey),
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: AppFonts.getSize24(context),
            color: titleColor,
          ),
        ),
        const SizedBox(width: 12,),
        ImageWidget(
          url: iconUrl,
          packageName: PostsConstants.packageName,
          width: 30,
          height: 30,
          fit: BoxFit.contain,
        ),
      ],
    );
  }
}
