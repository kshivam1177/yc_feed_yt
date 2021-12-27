import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:lottie/lottie.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:yc_app/blocs/community_bloc.dart';
import 'package:yc_app/modules/community/blog_card.dart';
import 'package:yc_app/modules/community/user_post_details.dart';
import 'package:yc_app/utils/colors.dart';
import 'package:yc_app/utils/common_helpers.dart';
import 'package:yc_app/utils/assets.dart';

import 'package:yc_app/shared/models/community/post.model.dart';
import 'package:yc_app/shared/views/shared_views.dart';
import 'package:yc_app/shared/models/media.model.dart';

import 'feed_image.dart';

class BuildUserPostCard extends StatefulWidget {
  final int index;
  final bool itIsMyPost;
  final bool itIsAdminPost;
  final bool itIsFeedPost;
  final bool isPostDetailView;

  BuildUserPostCard(
      {required this.index,
      this.itIsMyPost = false,
      this.itIsAdminPost = false,
      this.itIsFeedPost = false,
      this.isPostDetailView = false});

  @override
  _BuildUserPostCardState createState() => _BuildUserPostCardState();
}

class _BuildUserPostCardState extends State<BuildUserPostCard>
    with TickerProviderStateMixin {
  double likeButtonSize = 24;
  double mainLikeButtonSize = 50;
  bool showLikeIcon = false;
  late int postViewingTimeInSeconds;
  bool isShowingInViewPort = false;
  Timer? postViewTimer;
  int _currentPage = 0;
  late bool isLiked;
  late Post _currentPost;

  void _likeEffect() {
    setState(() {
      likeButtonSize = 30;
      if (_currentPost.isLiked == true) {
        showLikeIcon = true;
        mainLikeButtonSize = 120;
      }
    });
    Timer(const Duration(seconds: 1), () {
      setState(() {
        likeButtonSize = 24;
        if (_currentPost.isLiked == true) {
          mainLikeButtonSize = 50;
          showLikeIcon = false;
        }
      });
    });
    Timer(const Duration(seconds: 1), () {
      if (showLikeIcon != 0) {
        setState(() {
          showLikeIcon = false;
        });
      }
    });
  }

  @override
  void didUpdateWidget(BuildUserPostCard oldWidget) {
    if (!widget.isPostDetailView) {
      setState(() {
        _assignCurrentPost();
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    _assignCurrentPost();
    postViewingTimeInSeconds = 0;
    super.initState();
  }

  void _assignCurrentPost() {
    //POST DETAIL VIEW.
    if (widget.isPostDetailView) {
      _currentPost = communityBloc.post!;
      return;
    }
    //FEED or MY POST VIEW.
    if (widget.itIsMyPost && !widget.itIsFeedPost) {
      _currentPost = communityBloc.allMyPosts[widget.index];
    } else {
      _currentPost = communityBloc.allFeedPosts[widget.index];
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.isPostDetailView
        ? _buildBody()
        : VisibilityDetector(
            key: ValueKey<int>(widget.index),
            onVisibilityChanged: (VisibilityInfo visibilityInfo) =>
                _handlePostVisibility(visibilityInfo),
            child: _buildBody(),
          );
  }

  Column _buildBody() {
    return Column(
      children: <Widget>[
        if (_currentPost.postType == PostType.BLOG)
          ..._buildBlogWidgets()
        else
          ..._buildPostWidgets()
      ],
    );
  }

  void _handlePostVisibility(VisibilityInfo visibilityInfo) {
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
      isShowingInViewPort = !isShowingInViewPort;
      if (postViewingTimeInSeconds != 0) {
        // FIRE TIME RECORD API

      }
      postViewingTimeInSeconds = 0;
    }
  }

  List<Widget> _buildPostWidgets() {
    return <Widget>[
      UserPostDetails(
        widget.itIsMyPost,
        widget.itIsAdminPost,
        widget.itIsFeedPost,
        index: widget.index,
        navigatedViaDeeplink: widget.isPostDetailView,
        postId: _currentPost.id,
      ),
      SizedBox(height: 10),
      _buildPostMediaWidget(widget.itIsMyPost),
      buildLikesTimeRow(widget.itIsMyPost),
      // buildFeedbackCard()
    ];
  }

  List<Widget> _buildBlogWidgets() {
    return <Widget>[
      UserPostDetails(
        widget.itIsMyPost,
        widget.itIsAdminPost,
        widget.itIsFeedPost,
        index: widget.index,
        showCaption: false,
        navigatedViaDeeplink: widget.isPostDetailView,
        postId: _currentPost.id,
      ),
      InkWell(
        onTap: () {
          // navigation.push(
          //   MaterialPageRoute(
          //     settings: RouteSettings(
          //       name: Routes.blogReader,
          //       arguments: {
          //         "index": widget.index,
          //         "post": _currentPost,
          //       },
          //     ),
          //     builder: (_) => SafeArea(
          //       child: ReadBlogView(
          //         index: widget.index,
          //         post: _currentPost,
          //         itIsAdminPost: widget.itIsAdminPost,
          //         itIsFeedPost: widget.itIsFeedPost,
          //         itIsMyPost: widget.itIsMyPost,
          //         likeRow: buildLikesTimeRow,
          //       ),
          //     ),
          //   ),
          // );
        },
        child: FeedBlogCard(
          blogContent: _currentPost.blogContent,
          index: widget.index,
          title: _currentPost.caption,
        ),
      ),
      buildLikesTimeRow(widget.itIsMyPost),
    ];
  }

  Widget _buildPostMediaWidget(bool itIsMyPost) {
    return _currentPost.media != null && _currentPost.media!.isNotEmpty
        ? Stack(
            children: <Widget>[
              _buildPostMedia(itIsMyPost),
              if (_currentPost.media!.length > 1)
                MediaCountWidget(
                    currentCount: _currentPage, post: _currentPost),
              if (showLikeIcon) PostLikeIcon(),
            ],
          )
        : SizedBox.shrink();
  }

  InkWell _buildPostMedia(bool itIsMyPost) {
    return InkWell(
      onDoubleTap: () => _handleDoubleTap(itIsMyPost),
      child: Container(
        color: AppColors.cBLACK_10,
        child: CarouselSlider(
          items: List<Widget>.generate(_currentPost.media!.length, (int index) {
            final Medias _media = _currentPost.media![index];
            if (_media.mediaType == "IMAGE") {
              return FeedImage(_media);
            } else if (_media.mediaType == "VIDEO") {
              return FeedVideo(
                currentPost: _currentPost,
                mediaIndex: index,
              );
            } else {
              return SizedBox.shrink();
            }
          }),
          options: CarouselOptions(
            //height: SharedViews.screenWidth,
            aspectRatio:
                (_currentPost.media?.length ?? 1) > 1 ? (3 / 4) : (3.5 / 4),
            viewportFraction: 1.0,
            enableInfiniteScroll: false,
            disableCenter: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentPage = index;
              });
            },
          ),
        ),
      ),
    );
  }

  void _handleDoubleTap(bool itIsMyPost) {
    if (CommonHelpers.isUserLoggedIn()) {
      if (!itIsMyPost) {
        setState(() {
          if (_currentPost.isLiked == true) {
            _likeEffect();
          } else {
            communityBloc.likePost(
              postId: _currentPost.id,
              index: widget.index,
            );
            _currentPost.isLiked = true;
            _currentPost.likesCount = _currentPost.likesCount! + 1;
            _likeEffect();
          }
        });
      }
    }
  }

  Widget buildLikesTimeRow(bool? itIsMyPost) {
    String postId = _currentPost.id!;

    return Padding(
      padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _currentPost.likesCount! > 0
                    ? buildNumberOfLikesText(_currentPost)
                    : SizedBox(height: 24, width: 32),
                FeedPostDots(currentPage: _currentPage, post: _currentPost),
                Text(
                  CommonHelpers.dateTimeAgo(_currentPost.createdAt!),
                  style: SharedViews.getTextStyle(
                    TStyle.B1_400,
                    customStyle: TextStyle(
                      color: AppColors.cBODY_TEXT_50,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 1,
            color: AppColors.cDividerColor,
          ),
          Row(
            children: <Widget>[
              StreamBuilder<bool>(
                stream: communityBloc.likeLoadingController,
                builder: (BuildContext context, snapshot) {
                  return GestureDetector(
                    onTap: () {

                    },
                    child: Row(
                      children: <Widget>[
                        AnimatedSize(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOutCubicEmphasized,
                          vsync: this,
                          child: Container(
                            height: 32,
                            width: 32,
                            alignment: AlignmentDirectional.centerStart,
                            child: Icon(
                              _currentPost.isLiked == true
                                  ? Icons.favorite
                                  : Icons.favorite_outline,
                              color: _currentPost.isLiked == true
                                  ? AppColors.cERROR
                                  : AppColors.cBODY_TEXT_75,
                              size: likeButtonSize,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Text(
                            'Like',
                            style: SharedViews.getTextStyle(
                              TStyle.B1_600,
                              customStyle: TextStyle(
                                color: AppColors.cBODY_TEXT_75,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
              if (!Platform.isIOS) _buildWhatsAppShare()
            ],
          ),
        ],
      ),
    );
  }

  GestureDetector _buildWhatsAppShare() {
    return GestureDetector(
      onTap: () async {
        // MiscEvents.shareWhatsAppClick(
        //   category: 'social',
        //   postId: _currentPost.id,
        //   source: 'feed_user_post_card',
        // );
        // await communityBloc.sharePost(_currentPost);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            SvgPicture.asset(
              Assets.whatsApp,
              height: 24,
              width: 24,
              color: AppColors.cBODY_TEXT_75,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Share',
                style: SharedViews.getTextStyle(
                  TStyle.B1_600,
                  customStyle: TextStyle(
                    color: AppColors.cBODY_TEXT_75,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildNumberOfLikesText(Post post) {
    if (post.likesCount == null) {
      return SizedBox.shrink();
    }
    return GestureDetector(
      onTap: () {
        // navigation.push(
        //   MaterialPageRoute(
        //     settings: RouteSettings(
        //       name: Routes.likesList,
        //     ),
        //     builder: (_) => LikesListEntry(post.id),
        //   ),
        // );
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 4, 4, 4),
        child: Text(
          CommonHelpers.pluralizer(howMany: post.likesCount, baseStr: 'like')!,
          style: SharedViews.getTextStyle(
            TStyle.B1_700,
            customStyle: TextStyle(
              color: AppColors.cBODY_TEXT_75,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}


class PostLikeIcon extends StatelessWidget {
  const PostLikeIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0.0,
      bottom: 0.0,
      right: 0.0,
      left: 0.0,
      child: Lottie.asset(
        Assets.likeJson,
      ),
    );
  }
}

