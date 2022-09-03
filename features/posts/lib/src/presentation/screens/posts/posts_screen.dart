import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:posts/src/data/models/post/post.dart';
import 'package:posts/src/presentation/helpers/posts_icons.dart';
import 'package:posts/src/presentation/screens/posts/posts_screen_bloc.dart';
import '../../helpers/posts_subtitles_keys.dart';
import '../../widgets/base_posts_screen.dart';
import '../../widgets/base_widget_state.dart';
import '../../widgets/display_mode_switch_button.dart';
import '../../widgets/paging_results_listing/paging_results_listing_widget.dart';
import '../../widgets/post_card.dart';
import '../../widgets/posts_screen_title_widget.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends BaseWidgetState<PostsScreen> {

  late PostsScreenBloc postsScreenBloc = AppInjector.I.get();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget buildContent(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: BasePostsScreen(
        appbarActions: const [ DisplayModeSwitchButton() ],
        screenTitleWidget: PostScreenTitleWidget(
          titleKey: PostsSubtitlesKeys.hotPosts,
          titleColor: Theme.of(context).colorScheme.secondary,
          iconUrl: PostsIcons.icFlame,
        ),
        contentWidget: PagingResultsListingWidget<Post>(
          bloc: postsScreenBloc,
          listItemBuilder: (post) => PostCard(post),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() {
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    return Future.value(false);
  }
}
