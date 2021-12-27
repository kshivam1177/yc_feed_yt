import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yc_app/blocs/homepage_bloc.dart';
import 'package:yc_app/utils/assets.dart';

import 'package:yc_app/utils/colors.dart';
import 'package:yc_app/utils/common_helpers.dart';

import 'package:yc_app/shared/models/homepage/dashboard_response.model.dart';
import 'package:yc_app/shared/views/shared_views.dart';
import 'package:yc_app/shared/widgets/other_components/scaled_image.dart';
import 'package:yc_app/shared/widgets/labels/live_tag.dart';
import 'package:yc_app/utils/spacing.dart';

class ClassCardWidget extends StatefulWidget {
  ClassCard card;
  int? sectionIndex;
  int? cardIndex;
  String? sectionType;
  String? source;
  String? tabType;
  String? cardType;
  bool? isProgram;
  bool? isPreLoginLive;
  String? headerKey;

  ClassCardWidget(
      this.card, {
        this.sectionIndex,
        this.cardIndex,
        this.sectionType,
        this.source,
        this.tabType,
        this.cardType,
        this.isProgram,
        this.isPreLoginLive = false,
        this.headerKey,
      });

  @override
  _ClassCardWidgetState createState() => _ClassCardWidgetState();
}

class _ClassCardWidgetState extends State<ClassCardWidget>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(ClassCardWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
      upperBound: 0.7,
    );
    animationController?.repeat(reverse: true);
    super.initState();
  }

  Widget bottomRightWidget(
      {bool? isProgram, ClassCard? card, bool? isPreLoginLive}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          Assets.playIcon,
          color: AppColors.cWHITE_100,
          height: 14,
        ),
        AppSpacing.xxsWidth,
        Text(
          "Watch Class",
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          softWrap: true,
          style: SharedViews.getTextStyle(
            TStyle.B2_600,
            customStyle: TextStyle(
              color: AppColors.cWHITE_100,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.card == null) {
      return SizedBox();
    }
    return AspectRatio(
      aspectRatio: 1.5,
      child: GestureDetector(
        onTap: () {
          homePageBloc.contentDashboardClick(
            rank: widget.card.rank ?? -1,
            card: widget.card,
          );

          // DashboardExploreEvents.contentDashboardCardEvent(
          //   section: widget.sectionType,
          //   action: "content_dashboard_class_card_click",
          //   other: {
          //     "rank": widget.card.rank,
          //     "entityId": widget.card.entityId,
          //     "entityType": widget.card.entityType,
          //     "score": widget.card.score.toString(),
          //     "programContinuity": widget.card.programContinuityType,
          //     "programType": widget.card.programType,
          //     "classCardTag": widget.card.entityType?.toLowerCase() ?? "",
          //     "classLiveStatus": widget.card.isClassLive != null
          //         ? widget.card.isClassLive!
          //         ? 'live'
          //         : 'playback'
          //         : null,
          //   },
          // );
          // deepLinkBloc.redirectAfterProfileSelection(
          //     url: widget.card.cardClickAction?.clickActionUrl,
          //     inAppNavigation: true);
        },
        child: Container(
          //margin: EdgeInsets.fromLTRB(0, 0, AppSpacing.xs, 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: AppColors.cBLACK_20,
                blurRadius: 1.0,
                offset: Offset(0.0, 1.0),
              ),
            ],
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: scaledImageWithShimmer(
                    cropToRight: true,
                    aspectRatio: 3 / 2,
                    imageUrl: CommonHelpers.getSanitizedImageUrl(
                      imgUrl:
                      widget.card.cardBackground?.backgroundImageUrl ?? "",
                      params: {'auto': 'format', 'w': '800'},
                    ),
                    width: 300,
                  ),
                ),
              ),
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Colors.black45, Colors.transparent],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    widget.card.isClassLive == true
                        ? LiveTag(
                      animationController,
                      width: 55,
                      height: 25,
                    )
                        : SizedBox(),
                    (widget.card.viewerCount != null)
                        ? Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: widget.card.isClassLive! ? 0 : 12,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: AppColors.cBODY_TEXT.withOpacity(0.5),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.remove_red_eye,
                            size: 16,
                            color: AppColors.cWHITE_100,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            "${CommonHelpers.compactNumFormatter(widget.card.viewerCount?.toInt())} ",
                            style: SharedViews.getTextStyle(
                              TStyle.B2_600,
                              customStyle: TextStyle(
                                color: AppColors.cWHITE_100,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                        : SizedBox(),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      widget.card.classType != null
                          ? Container(
                        height: 25,
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        constraints: BoxConstraints(minWidth: 50),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: CommonHelpers.colorFromHex(
                            widget.card.classTypeColor,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            widget.card.classType ?? '',
                            style: SharedViews.getTextStyle(
                              TStyle.B2_700,
                              customStyle: TextStyle(
                                color: AppColors.cWHITE_100,
                              ),
                            ),
                          ),
                        ),
                      )
                          : SizedBox(),
                      widget.card.ageRange != null
                          ? Container(
                        height: 25,
                        width: 50,
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: AppColors.cBODY_TEXT.withOpacity(0.5),
                        ),
                        child: Center(
                          child: Text(
                            '${widget.card.ageRange?.min ?? ""} - ${widget.card.ageRange?.max ?? ""} yrs',
                            style: SharedViews.getTextStyle(
                              TStyle.B2_600,
                              customStyle: TextStyle(
                                color: AppColors.cWHITE_100,
                              ),
                            ),
                          ),
                        ),
                      )
                          : SizedBox(),
                      widget.card.duration != null
                          ? Container(
                        height: 25,
                        width: 50,
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: AppColors.cBODY_TEXT.withOpacity(0.5),
                        ),
                        child: Center(
                          child: Text(
                            widget.card.duration != null
                                ? " ${((widget.card.duration! / 60).ceilToDouble() + 4) ~/ 5 * 5} min"
                                : "",
                            style: SharedViews.getTextStyle(
                              TStyle.B2_600,
                              customStyle: TextStyle(
                                color: AppColors.cWHITE_100,
                              ),
                            ),
                          ),
                        ),
                      )
                          : SizedBox(),
                      (widget.card.numClasses != null &&
                          widget.card.numClasses != 0)
                          ? Container(
                        height: 25,
                        width: 64,
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: AppColors.cBODY_TEXT.withOpacity(0.8),
                        ),
                        child: Center(
                          child: FittedBox(
                            child: Text(
                              '${widget.card.numClasses!} classes',
                              style: SharedViews.getTextStyle(
                                TStyle.B3_600,
                                customStyle: TextStyle(
                                  color: AppColors.cWHITE_100,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                          : SizedBox(),
                      Spacer(),
                      bottomRightWidget(
                          isProgram: widget.isProgram,
                          card: widget.card,
                          isPreLoginLive: widget.isPreLoginLive),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
