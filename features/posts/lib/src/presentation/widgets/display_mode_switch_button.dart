import 'package:flutter/material.dart';
import 'package:posts/src/presentation/widgets/base_widget_state.dart';
import 'package:shared_presentation/shared_presentation.dart';
import '../helpers/posts_icons.dart';

class DisplayModeSwitchButton extends StatefulWidget {
  const DisplayModeSwitchButton({Key? key}) : super(key: key);

  @override
  State<DisplayModeSwitchButton> createState() => _DisplayModeSwitchButtonState();
}

class _DisplayModeSwitchButtonState extends BaseWidgetState<DisplayModeSwitchButton> {

  @override
  Widget buildContent(BuildContext context) {
    return ImageWidget(
      url: PostsIcons.icMoon,
      packageName: 'posts',
      height: 24,
      width: 24,
      fit: BoxFit.contain,
    );
  }
}
