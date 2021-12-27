import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:yc_app/blocs/community_bloc.dart';

import 'package:yc_app/shared/views/shared_views.dart';
import 'package:yc_app/shared/widgets/errors/overall_error_screen.dart';
import 'package:yc_app/utils/colors.dart';
import 'package:yc_app/utils/common_helpers.dart';
import 'feeds_tab.dart';
import 'my_feed_tab.dart';

class SocialFeed extends StatefulWidget {
  final int initialIndex;

  SocialFeed({Key? key, this.initialIndex = 0}) : super(key: key);

  @override
  _SocialFeedState createState() => _SocialFeedState();
}

class _SocialFeedState extends State<SocialFeed>
    with SingleTickerProviderStateMixin {
  int skip = 20;
  int limit = 20;

  // GlobalKey _animatedShortsFabKey = GlobalKey();

  void getMoreFeeds() {
    communityBloc.getFeeds(showLoader: true);
  }

  void getMoreMyPosts() {
    communityBloc.getMyPosts(skip: skip, limit: limit, showLoader: false);
    setState(() {
      skip += 20;
    });
  }

  @override
  void dispose() {
    communityBloc.pageCount = 0;
    communityBloc.showYouAreAllCaughtUp = false;
    super.dispose();
  }

  @override
  void initState() {
    _initializeSocialFeed();
    super.initState();
  }

  void _initializeSocialFeed() {
    communityBloc.scrollController = ScrollController();
    communityBloc.pageCount = 0;
    communityBloc.showYouAreAllCaughtUp = false;

    getMoreFeeds();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool?>(
      stream: communityBloc.loadingController.stream,
      builder: (BuildContext context, AsyncSnapshot<bool?> snapshot) {
        if (snapshot.hasError) {
          return OverallErrorScreen(
            onRetry: () => communityBloc.getData(
              isFeed: true,
              pullToRefresh: true,
            ),
          );
        }
        return _buildSocialFeed();
      },
    );
  }

  DefaultTabController _buildSocialFeed() {
    return DefaultTabController(
      initialIndex: widget.initialIndex,
      length: 2,
      child: Scaffold(
        appBar: _buildAppbar(context),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            _buildFeed(),
            _buildMyPosts(),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppbar(BuildContext context) {
    return AppBar(
      title: Text(
        "Create a Post",
        style: SharedViews.getTextStyle(TStyle.H4_700),
      ),
      bottom: _buildTabBarHeader(),
    );
  }

  PreferredSize _buildTabBarHeader() {
    return PreferredSize(
      preferredSize: Size(44, 44),
      child: Container(
        width: double.infinity,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              width: 1,
              color: AppColors.cDividerColor,
            ),
          ),
        ),
        child: SizedBox(
          width: 170,
          child: TabBar(
            padding: EdgeInsets.all(0),
            labelPadding: EdgeInsets.all(0),
            indicatorWeight: 3,
            indicatorColor: AppColors.cGREEN_100,
            labelColor: AppColors.cGREEN_100,
            unselectedLabelColor: AppColors.cBODY_TEXT_50,
            labelStyle: SharedViews.getTextStyle(
              TStyle.B1_700,
              customStyle: TextStyle(letterSpacing: 0.7),
            ),
            onTap: (int index) {},
            tabs: <Widget>[
              Tab(text: "FEED"),
              Tab(text: "MY POSTS"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeed() {
    return RefreshIndicator(
      displacement: 30.0,
      onRefresh: () => communityBloc.getData(pullToRefresh: true, isFeed: true),
      child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          if (!communityBloc.showYouAreAllCaughtUp) {
            if (scrollInfo.metrics.pixels >=
                    scrollInfo.metrics.maxScrollExtent - 500 &&
                scrollInfo.metrics.axisDirection == AxisDirection.down) {
              if (communityBloc.apiCalled) {
                //WANTED TO GET MORE FEEDS, BUT IS ALREADY LOADING
                return false;
              } else {
                //GETTING MORE FEEDS BECAUSE IT'S NOT LOADING
                getMoreFeeds();
                return true;
              }
            }
          }
          return false;
        },
        child: FeedsTab(),
      ),
    );
  }

  Widget _buildMyPosts() {
    return CommonHelpers.isUserLoggedIn()
        ? myPostEmptyState
        : RefreshIndicator(
            displacement: 30.0,
            onRefresh: () =>
                communityBloc.getData(pullToRefresh: true, isFeed: false),
            child: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollInfo) {
                if (!communityBloc.showYouAreAllCaughtUp) {
                  if (scrollInfo.metrics.pixels >=
                          scrollInfo.metrics.maxScrollExtent - 500 &&
                      scrollInfo.metrics.axisDirection == AxisDirection.down) {
                    if (communityBloc.apiCalled) {
                      //WANTED TO GET MORE FEEDS, BUT IS ALREADY LOADING
                      return false;
                    } else {
                      //GETTING MORE FEEDS BECAUSE NOT LOADING
                      getMoreMyPosts();
                      return true;
                    }
                  }
                }
                return false;
              },
              child: MyFeedTab(),
            ),
          );
  }

  Widget myPostEmptyState = Center(
    child: Text(
      "Register to add your posts",
      style: SharedViews.getTextStyle(TStyle.B1_400,
          customStyle: TextStyle(color: AppColors.cBODY_TEXT_50)),
    ),
  );
}
