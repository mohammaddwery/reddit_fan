import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:posts/src/presentation/widgets/base_widget_state.dart';
import 'package:shared_presentation/shared_presentation.dart';
import '../../core/posts_constants.dart';
import '../helpers/posts_icons.dart';

class DisplayModeSwitchButton extends StatefulWidget {
  const DisplayModeSwitchButton({Key? key}) : super(key: key);

  @override
  State<DisplayModeSwitchButton> createState() => _DisplayModeSwitchButtonState();
}

class _DisplayModeSwitchButtonState extends BaseWidgetState<DisplayModeSwitchButton> {

  late AppThemeModeBloc appThemeModeBloc;

  @override
  void initState() {
    appThemeModeBloc = AppInjector.I.get();
    super.initState();
  }

  @override
  Widget buildContent(BuildContext context) {
    return StreamBuilder<AppThemeMode>(
      stream: appThemeModeBloc.appThemeModeStream,
      builder: (context, themeModeSnapshot) {
        bool isDark = themeModeSnapshot.data! == AppThemeMode.dark;
        return InkWell(
          onTap: appThemeModeBloc.switchDisplayMode,
          child: AnimatedCrossFade(
            firstChild: buildImageWidget(PostsIcons.icSun),
            secondChild: buildImageWidget(PostsIcons.icMoon),
            crossFadeState: isDark ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            duration: const Duration(milliseconds: 300),
          ),
        );
      }
    );
  }

  Widget buildImageWidget(String imageUrl) {
    return ImageWidget(
      url: imageUrl,
      packageName: PostsConstants.packageName,
      height: 30,
      width: 30,
      fit: BoxFit.contain,
    );
  }
}
