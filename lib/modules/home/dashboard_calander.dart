import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'package:yc_app/shared/models/homepage/dashboard_response.model.dart';
import 'package:yc_app/shared/views/shared_views.dart';

import 'package:yc_app/utils/colors.dart';
import 'package:yc_app/utils/common_helpers.dart';
import 'package:yc_app/utils/spacing.dart';


class DashboardCalenderCard extends StatefulWidget {
  bool? isToday;
  List<ClassCard> classList;
  int sectionIndex;
  int? cardIndex;
  String? cardType;
  String? sectionType;
  ClassCard? classData;
  bool? isLastClass;
  bool showBorder;
  bool popAndPush;
  bool isContentDashboard;

  DashboardCalenderCard({
    required this.sectionIndex,
    required this.classList,
    required this.cardIndex,
    this.classData,
    this.isToday,
    this.cardType,
    this.sectionType,
    this.isLastClass,
    this.showBorder = true,
    this.popAndPush = false,
    this.isContentDashboard = false,
  });

  @override
  _DashboardCalenderCardState createState() => _DashboardCalenderCardState();
}

class _DashboardCalenderCardState extends State<DashboardCalenderCard>
    with SingleTickerProviderStateMixin {
  String? trail;
  bool? isLive;
  bool? isToday;
  ClassCard? classData;
  final GlobalKey cardKey = GlobalKey();
  Function? openClassDetails;
  late AnimationController animationController;

  bool getShouldShowDate() {
    List<ClassCard> cards = widget.classList;
    if (widget.cardIndex == 0) {
      return true;
    }
    if (cards[widget.cardIndex!]
        .dateTime!
        .toString()
        .split(' ')
        .first
        .compareTo(cards[widget.cardIndex! - 1]
        .dateTime!
        .toString()
        .split(' ')
        .first) ==
        0) {
      return false;
    } else {
      return true;
    }
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    isToday = widget.isToday;
    classData = widget.classData;
    trail = classData?.mentorGender != null
        ? CommonHelpers.getMentorName(
        fullName: classData!.mentorName, gender: classData!.mentorGender)
        : classData!.mentorName;
    isLive = classData!.isClassLive != null ? classData!.isClassLive : false;
    openClassDetails = () {
      if (classData!.duration != null) {
        // DashboardExploreEvents.cardItemClick(
        //   label: classData?.entityTitle,
        //   rowIdx: widget.sectionIndex,
        //   rowType: widget.sectionType,
        //   cardIdx: widget.cardIndex,
        //   cardType: widget.cardType,
        //   source: widget.isContentDashboard
        //       ? CommonHelpers.isUserLoggedIn()
        //       ? "content-dashboard"
        //       : "pre-login-content-dashboard"
        //       : 'dashboard',
        //   classLiveStatus: isLive! ? 'live' : 'playback',
        // );
        //
        // deepLinkBloc.redirectAfterProfileSelection(
        //     inAppNavigation: true,
        //     url: classData!.cardClickAction?.clickActionUrl);
      }
    };
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
      upperBound: 0.7,
    );
    animationController.repeat(reverse: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: AppSpacing.l,
        right: AppSpacing.m,
        bottom: AppSpacing.xxs,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getShouldShowDate()
              ? Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: AppSpacing.xxs,
              ),
              Text(
                DateFormat("E", "en_US")
                    .format(classData!.dateTime!.toLocal())
                    .toUpperCase(),
                style: SharedViews.getTextStyle(
                  TStyle.B3_700,
                  customStyle: TextStyle(
                    color: AppColors.cBODY_TEXT_25,
                  ),
                ),
              ),
              Text(
                classData!.dateTime!.day < 10
                    ? classData!.dateTime!.day.toString().padLeft(2, '0')
                    : classData!.dateTime!.day.toString(),
                style: SharedViews.getTextStyle(
                  TStyle.H5_700,
                  customStyle: TextStyle(
                    color: AppColors.cBODY_TEXT,
                  ),
                ),
              ),
            ],
          )
              : SizedBox(
            width: 20,
          ),
          Expanded(
            child: Container(
              key: cardKey,
              padding: EdgeInsets.only(left: AppSpacing.l),
              child: Column(
                children: [
                  Container(
                    decoration: widget.showBorder
                        ? BoxDecoration(
                      color: CommonHelpers.colorFromHex(
                          classData!.cardBackground?.backgroundColor),
                      borderRadius: BorderRadius.all(
                        Radius.circular(6.0),
                      ),
                    )
                        : null,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        openClassDetails!();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppSpacing.s, vertical: AppSpacing.xs),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  classData!.classType ?? '',
                                  style: SharedViews.getTextStyle(
                                    TStyle.B3_700,
                                    customStyle: TextStyle(
                                      color: CommonHelpers.colorFromHex(
                                        classData!.classTypeColor,
                                      ),
                                    ),
                                  ),
                                ),
                                classData!.isClassLive == true
                                    ? Container(
                                  padding:
                                  EdgeInsets.fromLTRB(4.0, 1, 4.0, 1),
                                  decoration: BoxDecoration(
                                    color: AppColors.cERROR,
                                    borderRadius:
                                    BorderRadius.circular(2.0),
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
                                    : SizedBox()
                              ],
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(vertical: 2.0),
                              child: Text(
                                classData!.entityTitle ?? "",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: SharedViews.getTextStyle(
                                  TStyle.B2_600,
                                ),
                              ),
                            ),
                            Text(
                              "${classData!.programTitle ?? ""} by $trail",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: SharedViews.getTextStyle(
                                TStyle.B3_400,
                                customStyle: TextStyle(
                                  color: AppColors.cBODY_TEXT_50,
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(
                                  Icons.access_time_outlined,
                                  color: AppColors.cBODY_TEXT_50,
                                  size: 15,
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  DateFormat('d MMM').add_jm().format(
                                    classData!.dateTime!.toLocal(),
                                  ),
                                  //"starts in ${CommonHelpers.dateTimeAgo(classData!.dateTime!, trailingText: "")} ",
                                  style: SharedViews.getTextStyle(
                                    TStyle.B3_600,
                                    customStyle: TextStyle(
                                      color: AppColors.cBODY_TEXT_50,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
