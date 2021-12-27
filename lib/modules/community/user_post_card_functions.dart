import 'package:flutter/material.dart';
import 'package:yc_app/blocs/community_bloc.dart';

import 'package:yc_app/utils/colors.dart';
import 'package:yc_app/utils/spacing.dart';

import 'package:yc_app/shared/views/shared_views.dart';
import 'package:yc_app/shared/models/community/post.model.dart';

Text buildStatusText(int? index, Post post) {
  Color color;
  if (post.status == "REJECTED") {
    color = AppColors.cERROR;
  } else if (post.status == "ACTIVE" || post.status == "APPROVED") {
    color = AppColors.cGREEN_TEXT;
  } else if (post.status == "UNDER-REVIEW") {
    color = AppColors.cYELLOW_TEXT;
  } else {
    color = AppColors.cGREEN_TEXT;
  }
  return Text(
    post.status ?? '',
    style: SharedViews.getTextStyle(
      TStyle.B2_700,
      customStyle: TextStyle(color: color, fontSize: 10, letterSpacing: 0.4),
    ),
  );
}

Column buildCard(Widget card, {bool showTopSeparator = false}) {
  Widget separator = Container(
    height: AppSpacing.xxs,
    child: Text(''),
    color: AppColors.cMISC_SEPARATOR_BLUE,
    width: double.infinity,
  );
  return Column(
    children: [
      if (showTopSeparator) separator,
      card,
      AppSpacing.sHeight,
      separator,
    ],
  );
}

Column buildAdCards(Widget card) {
  return Column(
    children: [
      card,
      Container(
        height: 4,
        child: Text(''),
        color: AppColors.cMISC_SEPARATOR_BLUE,
        width: double.infinity,
      )
    ],
  );
}

String buildNameColor(bool itIsMyPost, Post? post) {
  String name = post?.user?.fullName.toString() ?? 'A';
  name = name.toUpperCase();
  if (name.isEmpty) {
    name = 'A';
  }
  return name[0];
}

String buildFeedbackNameColor() {
  String name = (communityBloc.post?.feedbackBy?.fullName != null ||
      communityBloc.post?.feedbackBy?.fullName != ''
      ? communityBloc.post?.feedbackBy?.fullName.toString()
      : 'A')!;
  return name[0];
}

Widget buildFeedbackNameText() {
  String name = communityBloc.post?.feedbackBy?.fullName ?? "Admin";
  if (name.isEmpty) {
    name = "A";
  }
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      name[0].toUpperCase(),
      style: TextStyle(color: AppColors.cWHITE_100),
    ),
  );
}

Widget buildCachedNetworkImage(bool itIsMyPost) {
  if (communityBloc.post!.postType == PostType.ADMIN) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.cYELLOW_100,
          borderRadius: BorderRadius.circular(20),
        ),
        height: 40,
        width: 40,
        child: FittedBox(
          fit: BoxFit.fill,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'YC',
              style: SharedViews.getTextStyle(
                TStyle.B1_700,
                customStyle: TextStyle(
                  color: AppColors.cWHITE_100,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  String name = communityBloc.post!.user?.fullName ?? "User";
  if (communityBloc.post?.user?.profilePic?.url == null) {
    return FittedBox(
      fit: BoxFit.fill,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          name.isEmpty ? "B" : name[0].toUpperCase(),
          style: TextStyle(color: AppColors.cWHITE_100),
        ),
      ),
    );
  }
  return SizedBox();
}

// Text buildPostTimeText(int index, bool itIsMyPost) {
//   Post post;
//   if (itIsMyPost) {
//     post = communityBloc.allMyPosts[index];
//   } else {
//     post = communityBloc.allFeedPosts[index];
//   }
//   DateTime dateTime = post.createdAt;
//   String timeAgo = CommonHelpers.dateTimeAgo(dateTime);
//   return Text(
//     timeAgo,
//     style: SharedViews.getTextStyle(
//       TStyle.B2_600,
//       customStyle: TextStyle(
//         color: AppColors.cBODY_TEXT_50,
//       ),
//     ),
//   );
// }

