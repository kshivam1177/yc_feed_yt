import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:yc_app/blocs/community_bloc.dart';
import 'package:yc_app/modules/community/user_post_card_functions.dart';
import 'package:yc_app/shared/models/community/post.model.dart';
import 'package:yc_app/shared/views/shared_views.dart';
import 'package:yc_app/shared/widgets/buttons/buttons.dart';
import 'package:yc_app/utils/assets.dart';
import 'package:yc_app/utils/colors.dart';
import 'package:yc_app/utils/spacing.dart';

import 'feed_user_post_card.dart';

class MyFeedTab extends StatefulWidget {
  const MyFeedTab({Key? key}) : super(key: key);

  @override
  _MyFeedTabState createState() => _MyFeedTabState();
}

class _MyFeedTabState extends State<MyFeedTab> {
  @override
  void initState() {
    communityBloc.scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // ScrollController mscrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: communityBloc.myPostLoadingController.stream,
      builder: (BuildContext context, AsyncSnapshot<bool> loadingSnapshot) {
        if (loadingSnapshot.data ?? true) {
          return FeedShimmer();
        } else if (communityBloc.allMyPosts.isEmpty) {
          return _buildEmptyState();
        } else {
          return _buildMyPosts();
        }
      },
    );
  }

  Widget _buildMyPosts() {
    return Column(
      children: <Widget>[
        // FeedUploadingWidget(),
        _buildMyPostItems(),
      ],
    );
  }

  Expanded _buildMyPostItems() {
    return Expanded(
      child: ListView.builder(
        itemCount: communityBloc.allMyPosts.length + 1,
        scrollDirection: Axis.vertical,
        controller: communityBloc.scrollController,
        itemBuilder: (_, int index) {
          if (index == 0 && communityBloc.allMyPosts.isNotEmpty) {
            return SizedBox.shrink();
          }
          if (index == communityBloc.allMyPosts.length &&
              communityBloc.showYouAreAllCaughtUp) {
            return SizedBox.shrink();
          } else if (index == communityBloc.allMyPosts.length) {
            return FeedShimmer();
          } else {
            return _buildPostItem(index);
          }
        },
      ),
    );
  }

  Column _buildPostItem(int index) {
    return buildCard(BuildUserPostCard(
      index: index,
      itIsMyPost: true,
    ));
  }

  Padding _buildEmptyState() {
    return Padding(
      padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Image.asset(
              Assets.no_my_posts,
              height: 130,
            ),
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text:
                  'You haven’t added any posts yet. Become a part of the community. ',
              style: SharedViews.getTextStyle(
                TStyle.B2_400,
                customStyle: TextStyle(
                  color: AppColors.cBODY_TEXT_50,
                ),
              ),
            ),
          ),
          AppSpacing.mHeight,
          buttonRectangluarFilledSmall("Create a post", onPressed: () {
            // navigation.push(
            //   MaterialPageRoute(
            //     settings: const RouteSettings(
            //       name: Routes.createPost,
            //     ),
            //     builder: (BuildContext context) => CreatePost(),
            //   ),
            // );
          }),
        ],
      ),
    );
  }
}

class FeedShimmer extends StatelessWidget {
  const FeedShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Shimmer.fromColors(
        baseColor: AppColors.cBLACK_10,
        highlightColor: AppColors.cWHITE_100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 13),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.black,
                        child: Container(),
                      ),
                      SizedBox(width: 12),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 121,
                            height: 11,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.all(
                                Radius.circular(5.0),
                              ),
                            ),
                          ),
                          SizedBox(height: 7),
                          Container(
                            width: MediaQuery.of(context).size.width - 240,
                            height: 11,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.all(
                                Radius.circular(5.0),
                              ),
                            ),
                          ),
                        ],
                      )
                    ]),
                Icon(
                  Icons.more_vert,
                )
              ],
            ),
            SizedBox(height: 12),
            Container(
              height: 480,
              color: Colors.black,
            ),
            Row(
              children: [
                Icon(Icons.favorite_outline),
                SizedBox(width: 2),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                  width: 20,
                  height: 11,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class BuildAdCard extends StatefulWidget {
  final Post? post;

  // final String caption;
  final int? index;

  BuildAdCard({
    // this.caption,
    this.post,
    this.index,
  });

  @override
  _BuildAdCardState createState() => _BuildAdCardState();
}

class _BuildAdCardState extends State<BuildAdCard> {
  late int postViewingTimeInSeconds;
  bool isShowingInViewPort = false;
  Timer? postViewTimer;

  @override
  Widget build(BuildContext context) {
    return widget.post?.media != null &&
            widget.post!.media!.isNotEmpty &&
            widget.post?.media![0].url != null &&
            widget.post?.entity?.ctaText != null
        ? VisibilityDetector(
            key: ValueKey(widget.index),
            onVisibilityChanged: (visibilityInfo) {
              if (visibilityInfo.visibleFraction > 0.1) {
                postViewTimer?.cancel();
                postViewTimer = null;
                postViewTimer = Timer.periodic(Duration(seconds: 1), (_) {
                  postViewingTimeInSeconds++;
                });
              } else {
                postViewTimer?.cancel();
                postViewTimer = null;
              }
              if (visibilityInfo.visibleFraction == 0) {
                // SharedViews.showToast(msg: '${widget.index} : view0');
                isShowingInViewPort = !isShowingInViewPort;
                if (postViewingTimeInSeconds != 0) {
                  // FIRE TIME RECORD API
                  //   communityBloc.recordPostTimepent(
                  //     postId: widget.post!.id!,
                  //     postType: widget.post!.postType.string!,
                  //     viewTime: postViewingTimeInSeconds,
                  //   );
                }
                postViewingTimeInSeconds = 0;
              }
            },
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  color: AppColors.cBLACK_10,
                  height: 200,
                  child: Image.network(
                    widget.post!.media![0].url!,
                  ),
                ),
                InkWell(
                  onTap: () {
                    // buildNavigation(context, widget.post!.entity);
                  },
                  child: Container(
                    width: SharedViews.screenWidth,
                    height: 40,
                    color: AppColors.cGREEN_100,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: SharedViews.screenWidth! - 50,
                            child: Text(
                              widget.post!.entity!.ctaText!,
                              style: SharedViews.getTextStyle(
                                TStyle.B2_700,
                                customStyle: TextStyle(
                                  color: AppColors.cWHITE_100,
                                ),
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: AppColors.cWHITE_100,
                            size: 20,
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        : Container();
  }
}
