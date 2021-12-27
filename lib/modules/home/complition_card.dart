import 'package:flutter/material.dart';

import 'package:yc_app/shared/models/homepage/dashboard_response.model.dart';
import 'package:yc_app/shared/widgets/other_components/scaled_image.dart';

import 'package:yc_app/utils/common_helpers.dart';

Widget competitionCard({
  ClassCard? card,
  int? sectionIndex,
  int? cardIndex,
  String? sectionType,
  String? source,
  String? tabType,
  String? cardType,
  bool isContentDashboard = false,
}) {
  if (card == null) {
    return SizedBox();
  }
  return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: AspectRatio(
        aspectRatio: 4 / 3,
        child: InkWell(
          onTap: () {
            // DashboardExploreEvents.cardItemClick(
            //   label: card.entityTitle,
            //   rowType: sectionType,
            //   cardIdx: cardIndex,
            //   rowIdx: sectionIndex,
            //   source: isContentDashboard
            //       ? CommonHelpers.isUserLoggedIn()
            //       ? "content-dashboard"
            //       : "pre-login-content-dashboard"
            //       : 'dashboard',
            //   tabType: tabType,
            //   cardType: cardType,
            //   classCardTag: card.entityType?.toLowerCase() ?? "",
            // );
            // deepLinkBloc.redirectAfterProfileSelection(
            //   url: card.cardClickAction?.clickActionUrl,
            //   inAppNavigation: true,
            // );
          },
          child: Container(
            width: 200,
            height: 150,
            child: scaledImageWithShimmer(
                imageUrl: CommonHelpers.getSanitizedImageUrl(
                  imgUrl: card.cardBackground!.backgroundImageUrl,
                ),
                width: 200,
                cropToRight: true),
          ),
        ),
      ));
}
