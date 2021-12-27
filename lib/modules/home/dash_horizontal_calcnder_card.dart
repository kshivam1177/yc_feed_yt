import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:intl/intl.dart';

import 'package:yc_app/utils/assets.dart';
import 'package:yc_app/utils/colors.dart';
import 'package:yc_app/utils/common_helpers.dart';
import 'package:yc_app/utils/spacing.dart';

import 'package:yc_app/shared/views/shared_views.dart';
import 'package:yc_app/shared/widgets/other_components/scaled_image.dart';
class DashboardHorizontalCalendarCard extends StatefulWidget {
  const DashboardHorizontalCalendarCard({
    this.shouldShowIcon = false,
    this.date,
    this.imageUrl,
    Key? key,
    this.deeplink,
    this.isLive = false,
    this.cardType,
    this.sectionType,
    this.index,
    required this.isContentDashboard,
  }) : super(key: key);
  final int? index;
  final String? deeplink;
  final String? sectionType;
  final String? cardType;
  final String? imageUrl;
  final DateTime? date;
  final bool? shouldShowIcon;
  final bool isContentDashboard;
  final bool? isLive;

  @override
  _DashboardHorizontalCalendarCardState createState() =>
      _DashboardHorizontalCalendarCardState();
}

class _DashboardHorizontalCalendarCardState
    extends State<DashboardHorizontalCalendarCard>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
      upperBound: 0.7,
    );
    animationController.repeat(reverse: true);

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // DashboardExploreEvents.cardItemClick(
        //   rowType: widget.sectionType,
        //   cardIdx: widget.index,
        //   cardType: widget.cardType,
        //   source: widget.isContentDashboard
        //       ? CommonHelpers.isUserLoggedIn()
        //       ? "content-dashboard"
        //       : "pre-login-content-dashboard"
        //       : 'dashboard',
        //   classLiveStatus: widget.isLive! ? 'live' : 'playback',
        // );
        //
        // deepLinkBloc.redirectAfterProfileSelection(
        //   inAppNavigation: true,
        //   url: widget.deeplink,
        // );
      },
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: AppSpacing.xxs),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.cBLACK_05),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    width: 240,
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.all(AppSpacing.xxs),
                              height: 63,
                              width: 70,
                              decoration: BoxDecoration(
                                color: AppColors.cPURPLE_15,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.access_time,
                                    size: 16,
                                    color: AppColors.cBLACK_40,
                                  ),
                                  AppSpacing.xxsHeight,
                                  Text(
                                    widget.date == null
                                        ? '-'
                                        : DateFormat.j()
                                        .format(
                                      widget.date!.toLocal(),
                                    )
                                        .toString(),
                                    style:
                                    SharedViews.getTextStyle(TStyle.B1_700),
                                  ),
                                ],
                              ),
                            ),
                            AppSpacing.xsHeight,
                            Text(
                              widget.date == null
                                  ? '-'
                                  : CommonHelpers.getDateTimeToDayParseAfter(
                                widget.date!,
                              ),
                              style: SharedViews.getTextStyle(TStyle.B3_700),
                            )
                          ],
                        ),
                        Expanded(
                          child: scaledImageWithShimmer(
                            imageUrl: widget.imageUrl,
                            width: 162,
                            aspectRatio: 3 / 2,
                            fit: BoxFit.cover,
                            cropToRight: true,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 70 + AppSpacing.m,
                top: AppSpacing.s,
                child: widget.isLive!
                    ? Container(
                  padding: EdgeInsets.fromLTRB(4.0, 1, 4.0, 1),
                  decoration: BoxDecoration(
                    color: AppColors.cERROR,
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                  child: Row(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          FadeTransition(
                            opacity: animationController,
                            child: Icon(
                              Icons.circle,
                              size: 9,
                              color: AppColors.cWHITE_100,
                            ),
                          ),
                          Icon(
                            Icons.circle,
                            size: 4,
                            color: AppColors.cWHITE_100,
                          ),
                        ],
                      ),
                      Text(
                        " LIVE",
                        style: SharedViews.getTextStyle(
                          TStyle.B3_400,
                          customStyle: TextStyle(
                            color: AppColors.cWHITE_100,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
                    : SizedBox(),
              ),
              Positioned(
                left: AppSpacing.xxs,
                child: widget.shouldShowIcon!
                    ? SvgPicture.asset(Assets.achievementIcon)
                    : SizedBox(),
              )
            ],
          ),
        ],
      ),
    );
  }
}

