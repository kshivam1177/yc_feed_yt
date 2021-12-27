import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yc_app/blocs/community_bloc.dart';
import 'package:yc_app/modules/community/user_post_card_functions.dart';
import 'package:yc_app/shared/models/community/get_post_response.dart';
import 'package:yc_app/shared/widgets/buttons/buttons.dart';
import 'package:yc_app/shared/widgets/other_components/profile_picture_widget.dart';

import 'package:yc_app/utils/colors.dart';
import 'package:yc_app/utils/common_helpers.dart';
import 'package:yc_app/shared/models/community/post.model.dart';

import 'package:yc_app/shared/views/shared_views.dart';

class FeedConstants {
  static const String Report = ' Report';
  static const String Block = ' Block';

  static const List<String> choices = <String>[
    Report,
    Block,
  ];
}

class MyPostConstants {
  static const String Delete = ' Delete';

  static const List<String> choices = <String>[Delete];
}

class UserPostDetails extends StatelessWidget {
  final bool itIsMyPost,
      itIsAdminPost,
      itIsFeedPost,
      showCaption,
      isBlogReadView,
      navigatedViaDeeplink;
  final int index;
  final String? postId;

  const UserPostDetails(this.itIsMyPost, this.itIsAdminPost, this.itIsFeedPost,
      {this.showCaption = true,
      this.isBlogReadView = false,
      this.navigatedViaDeeplink = false,
      this.index = 0,
      this.postId,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _choiceAction(String choice) {
      if (choice == FeedConstants.Report) {
        if (!CommonHelpers.isUserLoggedIn()) {
          SharedViews.showToast(msg: "Must be logged in");
          return;
        }
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) => ReportPostDialog(
            index: index,
            postId: navigatedViaDeeplink
                ? postId
                : communityBloc.allFeedPosts[index].id,
            navigatedViaDeeplink: navigatedViaDeeplink,
          ),
        );
      } else if (choice == FeedConstants.Block) {
        if (!CommonHelpers.isUserLoggedIn()) {
          SharedViews.showToast(msg: "Must be logged in");
          return;
        }
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) => navigatedViaDeeplink
              ? BlockPostDialog(
                  index: index,
                  navigatedViaDeeplink: navigatedViaDeeplink,
                  postId: postId,
                )
              : BlockPostDialog(
                  index: index,
                  postId: communityBloc.allFeedPosts[index].id,
                ),
        );
      }
    }

    void _deleteChoiceAction(String choice) {
      if (navigatedViaDeeplink) {
        Navigator.pop(context);
        return;
      }
      if (choice == MyPostConstants.Delete) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) => DeletePostDialog(
            index: index,
            postId: communityBloc.allMyPosts[index].id,
            isReadBlogView: isBlogReadView,
          ),
        );
      }
    }

    Widget _buildPostTitle() {
      // List<PostProfile>? profiles = communityBloc.post?.profiles ?? [];

      List<PostProfile>? profiles = [];

      if (communityBloc.post?.postType == PostType.ADMIN) {
        return Text("Yellow Class");
      } else if (profiles == null || profiles.length == 0) {
        return Text(communityBloc.post?.user?.fullName ?? "User");
      }
      return BuildProfileNames(
        profiles.map((PostProfile e) => e.fullName).toList(),
      );
    }

    Widget _buildClassNavigationText(BuildContext context, bool itIsMyPost) {
      Post post = communityBloc.post!;
      if (post.entity?.title != null) {
        return Column(
          children: [
            SizedBox(height: 2),
            InkWell(
              onTap: () {
                // buildNavigation(context, post.entity);
              },
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: itIsMyPost
                      ? SharedViews.screenWidth! - 240
                      : SharedViews.screenWidth! - 150,
                ),
                child: Text(
                  post.entity?.title ?? "",
                  style: SharedViews.getTextStyle(
                    TStyle.B2_400,
                    customStyle: TextStyle(
                      color: AppColors.cGREEN_TEXT,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      } else {
        return Container();
      }
    }

    if (navigatedViaDeeplink) {
    } else if (itIsMyPost && !itIsFeedPost) {
      communityBloc.post = communityBloc.allMyPosts[index];
    } else {
      communityBloc.post = communityBloc.allFeedPosts[index];
    }

    return Padding(
      padding: EdgeInsets.fromLTRB(16, 12, 0, 0),
      child: GestureDetector(
        onTap: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.colors[buildNameColor(
                            itIsMyPost,
                            communityBloc.post,
                          )] ??
                          AppColors.cERROR,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    height: 48,
                    width: 48,
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: buildCachedNetworkImage(itIsMyPost),
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _buildPostTitle(),
                      SizedBox(height: 2),
                      _buildClassNavigationText(context, itIsMyPost)
                    ],
                  ),
                ),
                Expanded(
                  flex: itIsMyPost ? 4 : 0,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      itIsMyPost && communityBloc.post != null
                          ? _buildMyPostStatus(index)
                          : SizedBox.shrink(),
                      itIsMyPost && !itIsFeedPost
                          ? _buildMyPostMenu(_deleteChoiceAction)
                          : _buildFeedMenu(_choiceAction)
                    ],
                  ),
                ),
              ],
            ),
            showCaption
                ? communityBloc.post?.caption != null &&
                        communityBloc.post?.caption != ''
                    ? Padding(
                        padding: const EdgeInsets.fromLTRB(0, 12, 16, 8),
                        child: CaptionTextWidget(
                          text: communityBloc.post!.caption,
                        ),
                      )
                    : SizedBox(height: 12)
                : SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}

Container _buildMyPostStatus(int index) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(
        color: AppColors.cBLACK_10, // set border color
        width: 1.0,
      ), // set border width
      borderRadius: BorderRadius.all(
        Radius.circular(5.0),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(6, 4, 6, 4),
      child: buildStatusText(
        index,
        communityBloc.post!,
      ),
    ),
  );
}

PopupMenuButton<String> _buildFeedMenu(void _choiceAction(String choice)) {
  return PopupMenuButton<String>(
    icon: Icon(
      Icons.more_vert,
      color: AppColors.cBLACK_40,
    ),
    onSelected: _choiceAction,
    itemBuilder: (BuildContext context) {
      return FeedConstants.choices.map(
        (String choiced) {
          return PopupMenuItem<String>(
            value: choiced,
            child: Row(
              children: [
                SizedBox(
                  height: 20,
                  width: 20,
                  child: SvgPicture.asset(
                    choiced == " Report"
                        ? "assets/icons/icons-extra-info-24.svg"
                        : "assets/icons/icons-extra-block-24.svg",
                  ),
                ),
                Text(
                  choiced,
                  style: SharedViews.getTextStyle(
                    TStyle.B1_600,
                    customStyle: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
          );
        },
      ).toList();
    },
  );
}

PopupMenuButton<String> _buildMyPostMenu(
    void _deleteChoiceAction(String choice)) {
  return PopupMenuButton<String>(
    icon: Icon(
      Icons.more_vert,
      color: AppColors.cBLACK_40,
    ),
    onSelected: _deleteChoiceAction,
    itemBuilder: (BuildContext context) {
      return MyPostConstants.choices.map(
        (String choice) {
          return PopupMenuItem<String>(
            value: choice,
            child: Row(
              children: [
                SizedBox(
                  height: 20,
                  width: 20,
                  child: SvgPicture.asset(
                    "assets/icons/icons-extra-delete-24.svg",
                  ),
                ),
                Text(
                  choice,
                  style: SharedViews.getTextStyle(
                    TStyle.B1_600,
                  ),
                ),
              ],
            ),
          );
        },
      ).toList();
    },
  );
}

class ReportPostDialog extends StatefulWidget {
  final int? index;
  final String? postId;
  final bool navigatedViaDeeplink;

  ReportPostDialog(
      {this.index, this.postId = '', this.navigatedViaDeeplink = false});

  @override
  _ReportPostDialogState createState() => _ReportPostDialogState();
}

class _ReportPostDialogState extends State<ReportPostDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        // width: 400,
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
              child: Text(
                "Report this post?",
                style: SharedViews.getTextStyle(TStyle.H5_700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 16, 5, 37),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Are you sure, you want to report this post? Our team shall review it",
                  style: SharedViews.getTextStyle(TStyle.B1_600),
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: buttonOutlinedLarge(
                    "Cancel",
                    textColor: AppColors.cGREEN_100,
                    onPressed: () {
                      //buttonActionOne ?? buttonActionOne();
                      Navigator.pop(context);
                    },
                  ),
                ),
                SizedBox(width: 20),
                Flexible(
                  child: buttonFilledLarge(
                    'Confirm',
                    onPressed: () async {
                      Navigator.pop(context);
                      communityBloc.loadingController.add(null);
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CaptionTextWidget extends StatefulWidget {
  final String? text;

  CaptionTextWidget({this.text});

  @override
  _CaptionTextWidgetState createState() => _CaptionTextWidgetState();
}

class _CaptionTextWidgetState extends State<CaptionTextWidget> {
  bool flag = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        widget.text!,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: SharedViews.getTextStyle(
          TStyle.B1_400,
        ),
      ),
    );
  }
}

class BuildProfileNames extends StatelessWidget {
  final List<String?> profiles;

  BuildProfileNames(this.profiles, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int profilesLength = profiles.length;
    return Wrap(
      children: List.generate(profiles.length, (int index) {
        String separatorText = '';
        switch (profilesLength - index) {
          // last element
          case 1:
            break;
          // second last element
          case 2:
            separatorText = ' and ';
            break;
          // other elements
          default:
            separatorText = ', ';
        }

        return RichText(
          text: TextSpan(
            text: profiles[index] ?? '',
            style: SharedViews.getTextStyle(TStyle.H5_600),
            children: <InlineSpan>[
              TextSpan(
                text: separatorText,
                style: TextStyle(
                  color: AppColors.cBODY_TEXT_50,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}



Future deletePostDialog(BuildContext context,
    {int? index, String? postId, bool isReadBlogView = false}) async {
  return await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => DeletePostDialog(
      index: index,
      postId: postId,
      isReadBlogView: isReadBlogView,
    ),
  );
}

class DeletePostDialog extends StatefulWidget {
  final int? index;
  final String? postId;
  final bool? isReadBlogView;
  DeletePostDialog({this.index, this.postId, this.isReadBlogView});

  @override
  _DeletePostDialogState createState() => _DeletePostDialogState();
}

class _DeletePostDialogState extends State<DeletePostDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        // width: 400,
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
              child: Text(
                "Delete this post?",
                style: SharedViews.getTextStyle(TStyle.H5_700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 16, 5, 37),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Are you sure, you want to delete this post?",
                  style: SharedViews.getTextStyle(TStyle.B1_600),
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: buttonOutlinedLarge(
                    "Cancel",
                    textColor: AppColors.cGREEN_100,
                    onPressed: () {
                      //buttonActionOne ?? buttonActionOne();
                      Navigator.pop(context);
                    },
                  ),
                ),
                SizedBox(width: 20),
                Flexible(
                  child: buttonFilledLarge(
                    'Confirm',
                    onPressed: () {
                      // communityBloc.deletePost(
                      //     postId: widget.postId,
                      //     index: widget.index,
                      //     isReadBlogView: widget.isReadBlogView);
                      communityBloc.allMyPosts.removeAt(widget.index!);
                      communityBloc.myPostLoadingController.add(false);
                      Navigator.pop(context);
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Future<dynamic> blockPostDialog(
    BuildContext context, {
      int? index,
      String? postId,
    }) async {
  return await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => BlockPostDialog(index: index, postId: postId),
  );
}

class BlockPostDialog extends StatefulWidget {
  final int? index;
  final String? postId;
  final bool navigatedViaDeeplink;

  BlockPostDialog(
      {Key? key,
        this.index,
        this.postId = '',
        this.navigatedViaDeeplink = false})
      : super(key: key);

  @override
  _BlockPostDialogState createState() => _BlockPostDialogState();
}

class _BlockPostDialogState extends State<BlockPostDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        // width: 400,
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
              child: Text(
                "Block this post?",
                style: SharedViews.getTextStyle(TStyle.H5_700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 16, 5, 37),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Are you sure, you want to block this post? Our team shall review it",
                  style: SharedViews.getTextStyle(TStyle.B1_600),
                ),
              ),
            ),
            Flexible(
              child: buttonOutlinedLarge(
                "Cancel",
                textColor: AppColors.cGREEN_100,
                onPressed: () {
                  //buttonActionOne ?? buttonActionOne();
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
