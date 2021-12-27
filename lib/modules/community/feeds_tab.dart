import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yc_app/blocs/community_bloc.dart';
import 'package:yc_app/modules/community/user_post_card_functions.dart';
import 'package:yc_app/shared/views/shared_views.dart';
import 'package:yc_app/utils/assets.dart';
import 'package:yc_app/utils/colors.dart';
import 'package:yc_app/shared/models/community/post.model.dart';
import 'package:yc_app/shared/services/shared_preferences_service.dart';
import 'package:yc_app/utils/spacing.dart';

import 'feed_hook1_card.dart';
import 'feed_user_post_card.dart';
import 'my_feed_tab.dart';

class FeedsTab extends StatefulWidget {
  FeedsTab({Key? key}) : super(key: key);

  @override
  _FeedsTabState createState() => _FeedsTabState();
}

class _FeedsTabState extends State<FeedsTab> {
  @override
  void initState() {
    if (communityBloc.allFeedPosts.isNotEmpty &&
        communityBloc.loadingController.valueWrapper?.value == true) {
      //CODE: HANDLED EDGE CASE, i.e FEED STUCK IN LOADING STATE,
      //IF USER PULL REFRESH MY POST AND SWITCHES TO FEED TAB.
      communityBloc.loadingController.add(false);
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildFeedItems();
  }

  Widget _buildFeedItems() {
    return ListView.builder(
      controller: communityBloc.scrollController,
      itemCount: communityBloc.allFeedPosts.length + 1,
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) {
        if ((index != communityBloc.allFeedPosts.length) &&
            communityBloc.allFeedPosts.isNotEmpty) {
          final Post post = communityBloc.allFeedPosts[index];
          return _buildPostType(post, index);
        } else {
          return _buildLoadMoreFeedsWidget();
        }
      },
    );
  }

  Widget _buildPostType(Post post, int index) {
    Widget _postWidget = SizedBox.shrink();
    switch (post.postType!) {
      case PostType.HOOK1:
        if (post.hookImageUrl != null) {
          _postWidget = FeedHook1Card(
            imgUrl: post.hookImageUrl,
            clickActionType: post.clickAction?.clickActionType,
            clickActionUrl: post.clickAction?.clickActionUrl,
            separator: Border(
              bottom: BorderSide(
                color: AppColors.cMISC_SEPARATOR_BLUE,
                width: 4,
              ),
            ),
          );
        }
        break;
      case PostType.BLOG:
      case PostType.USER:
        if (sharedPreferenceService.containsUserData &&
            sharedPreferenceService.userData != null &&
            (post.postType == PostType.USER ||
                post.postType == PostType.BLOG) &&
            post.user!.id == sharedPreferenceService.userData!.id) {
          _postWidget = buildCard(
            BuildUserPostCard(
              index: index,
              itIsMyPost: true,
              itIsFeedPost: true,
            ),
          );
        } else {
          _postWidget = buildCard(
            BuildUserPostCard(
              index: index,
            ),
          );
        }
        break;
      case PostType.ADMIN:
        _postWidget = buildCard(
          BuildUserPostCard(
            index: index,
            itIsAdminPost: true,
          ),
        );
        break;
      case PostType.ADCARD:
        _postWidget = buildAdCards(
          BuildAdCard(
            post: post,
            index: index,
          ),
        );
        break;
      case PostType.RECENT_CLASS:
        _postWidget = buildCard(
          Text("N/A"),
        );
        break;
      case PostType.UPCOMING_CLASS:
        _postWidget = buildCard(
          Text("N/A"),
        );
        break;
      default:
        _postWidget = Text('');
    }
    return _postWidget;
  }
}

StreamBuilder<bool?> _buildLoadMoreFeedsWidget() {
  return StreamBuilder<bool?>(
    stream: communityBloc.loadingController.stream,
    initialData: true,
    builder: (BuildContext context, AsyncSnapshot<bool?> snapshot) {
      if (communityBloc.showYouAreAllCaughtUp &&
          communityBloc.allFeedPosts.isNotEmpty) {
        return AllCaughtUp();
      } else if (snapshot.data != null && snapshot.data!) {
        return FeedShimmer();
      } else {
        return SizedBox.shrink();
      }
    },
  );
}

class AllCaughtUp extends StatelessWidget {
  const AllCaughtUp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(Assets.allSeenTick),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSpacing.s),
            child: Text(
              "You've seen all the new posts",
              textAlign: TextAlign.center,
              style: SharedViews.getTextStyle(
                TStyle.H5_700,
                customStyle: TextStyle(
                  color: AppColors.cBODY_TEXT_50,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
