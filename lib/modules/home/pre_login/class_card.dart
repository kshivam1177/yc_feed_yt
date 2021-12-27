import 'package:flutter/material.dart';
import 'package:yc_app/blocs/homepage_bloc.dart';
import 'package:yc_app/shared/models/homepage/pre_login_homepage.model.dart';
import 'package:yc_app/utils/assets.dart';
import 'package:yc_app/utils/colors.dart';
import 'package:yc_app/utils/spacing.dart';
import 'package:yc_app/utils/common_helpers.dart';
import 'package:yc_app/shared/views/shared_views.dart';
import 'package:yc_app/shared/widgets/other_components/scaled_image.dart';
import 'package:yc_app/shared/widgets/buttons/buttons.dart';
import 'package:yc_app/shared/widgets/labels/live_tag.dart';

class ClassCard1 extends StatefulWidget {
  ClassCardModel? card;
  int? cardIdx;
  int? rowIdx;
  String? source;
  String? rowType;
  String? tabType;
  String? cardType;
  bool? isProgram;
  bool? isPreLoginLive;
  String? headerKey;

  ClassCard1(
      this.card, {
        this.cardIdx,
        this.rowIdx,
        this.source,
        this.rowType,
        this.tabType,
        this.cardType,
        this.isProgram,
        this.isPreLoginLive = false,
        this.headerKey,
      });

  @override
  _ClassCard1State createState() => _ClassCard1State();
}

class _ClassCard1State extends State<ClassCard1>
    with SingleTickerProviderStateMixin {
  ClassCardModel? card;
  int? cardIdx;
  int? rowIdx;
  String? source;
  String? rowType;
  String? tabType;
  String? cardType;
  bool? isProgram;
  AnimationController? animationController;

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(ClassCard1 oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    card = widget.card;
    cardIdx = widget.cardIdx;
    rowIdx = widget.rowIdx;
    source = widget.source;
    rowType = widget.rowType;
    tabType = widget.tabType;
    cardType = widget.cardType;
    isProgram = widget.isProgram ?? false;
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
      upperBound: 0.7,
    );
    animationController?.repeat(reverse: true);
    super.initState();
  }

  bool shouldShowTopRightTag() {
    if (card!.topRightLabelText == null) {
      return false;
    } else if (!isProgram! && widget.headerKey != 'liveNow') {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    if (card == null) {
      return SizedBox();
    }
    return AspectRatio(
      aspectRatio: 3 / 2,
      child: GestureDetector(
        onTap: () {
          // DashboardExploreEvents.cardItemClick(
          //   label: card!.title,
          //   rowType: rowType,
          //   cardIdx: cardIdx,
          //   rowIdx: rowIdx,
          //   source: source,
          //   tabType: tabType,
          //   classLiveStatus: card!.isClassLive != null
          //       ? card!.isClassLive!
          //       ? 'live'
          //       : 'playback'
          //       : null,
          //   cardType: cardType,
          //   classCardTag: card!.classTypeTagText?.toLowerCase() ?? "",
          // );
          // homePageBloc.getCardAction(card!);
        },
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 0, AppSpacing.xs, 0),
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
                      imgUrl: card?.coverPicture3By2?.url ??
                          card?.coverPicture2By1?.url ??
                          card?.coverPicture?.url ??
                          "",
                      params: {'auto': 'format', 'w': '600'},
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
              card?.attendanceInfo != null && widget.headerKey != 'liveNow'
                  ? Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        colors: [
                          Colors.black45,
                          Colors.transparent,
                          Colors.transparent
                        ],
                        // Add one stop for each color
                        // Values should increase from 0.0 to 1.0
                        stops: [
                          0.1,
                          0.5,
                          0.75
                        ]),
                  ),
                ),
              )
                  : Container(),
              Align(
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    card?.isClassLive != null && card!.isClassLive!
                        ? LiveTag(
                      animationController,
                      width: 62,
                      height: 22,
                    )
                        : card?.isClassNew != null && card!.isClassNew!
                        ? Container(
                      height: 20,
                      width: 50,
                      margin: EdgeInsets.all(8),
                      padding: EdgeInsets.symmetric(horizontal: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: AppColors.cYELLOW_TEXT,
                      ),
                      child: Center(
                        child: FittedBox(
                          child: Text(
                            'NEW',
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
                    StreamBuilder<bool>(
                        stream: homePageBloc.viewerCountController.stream,
                        builder: (BuildContext context,
                            AsyncSnapshot<bool> snapshot) {
                          return (card?.viewerCount != null)
                              ? Container(
                            margin: EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: card!.isClassLive! ? 0 : 12,
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color:
                              AppColors.cBODY_TEXT.withOpacity(0.8),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.remove_red_eye,
                                  size: 14,
                                  color: AppColors.cWHITE_100,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  card!.viewerCount!,
                                  style: SharedViews.getTextStyle(
                                    TStyle.B3_600,
                                    customStyle: TextStyle(
                                      color: AppColors.cWHITE_100,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                              : SizedBox();
                        })
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
                      card?.programTypeTagText != null
                          ? Container(
                        height: 25,
                        width: 60,
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        padding: EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: CommonHelpers.colorFromHex(
                            card!.programTypeTagBgColor,
                          ),
                        ),
                        child: Center(
                          child: FittedBox(
                            child: Text(
                              card!.programTypeTagText ?? '',
                              style: SharedViews.getTextStyle(
                                TStyle.B3_600,
                                customStyle: TextStyle(
                                  color: CommonHelpers.colorFromHex(
                                    card!.programTypeTagTextColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                          : SizedBox(),
                      SizedBox(),
                      (card?.numClasses != null && card!.numClasses != 0)
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
                              '${card!.numClasses!} classes',
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
                          isProgram: isProgram,
                          card: card,
                          isPreLoginLive: widget.isPreLoginLive),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        shouldShowTopRightTag()
                            ? Container(
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          padding: EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: card?.topRightLabelBgColor != null
                                ? CommonHelpers.colorFromHex(
                              card!.topRightLabelBgColor,
                            ).withAlpha(170)
                                : AppColors.cBODY_TEXT.withOpacity(0.8),
                          ),
                          child: Text(
                            card?.topRightLabelText ?? "",
                            style: SharedViews.getTextStyle(
                              TStyle.B3_600,
                              customStyle: TextStyle(
                                color:
                                card!.topRightLabelTextColor != null
                                    ? CommonHelpers.colorFromHex(
                                  card!.topRightLabelTextColor,
                                )
                                    : AppColors.cWHITE_100,
                              ),
                            ),
                          ),
                        )
                            : SizedBox(),
                        card?.isReminderSet == true
                            ? Image.asset(
                          Assets.bell_home_card,
                          height: 24,
                          width: 24,
                        )
                            : SizedBox(),
                      ],
                    )),
              ),
              card?.attendanceInfo != null && widget.headerKey != 'liveNow'
                  ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text(
                      card?.attendanceText ?? card!.attendanceInfo!,
                      style: SharedViews.getTextStyle(
                        TStyle.B3_600,
                        customStyle: TextStyle(
                          color: card?.attendanceTextColor != null
                              ? Color(card!.attendanceTextColor as int)
                              : AppColors.cWHITE_100,
                          backgroundColor: card?.attendanceBGColor != null
                              ? Color(card!.attendanceBGColor as int)
                              : null,
                        ),
                      ),
                    ),
                  ),
                ),
              )
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget bottomRightWidget(
    {bool? isProgram, ClassCardModel? card, bool? isPreLoginLive}) {
  return isPreLoginLive!
      ? Container(
    child: Row(
      children: [
        Icon(
          Icons.play_arrow_rounded,
          color: AppColors.cWHITE_100,
        ),
        Text(
          'Join Live',
          style: SharedViews.getTextStyle(
            TStyle.B3_600,
            customStyle: TextStyle(
              color: AppColors.cWHITE_100,
            ),
          ),
        )
      ],
    ),
  )
      : !isProgram!
      ? Text(
    card?.timestamp ?? '',
    overflow: TextOverflow.ellipsis,
    maxLines: 1,
    softWrap: true,
    style: SharedViews.getTextStyle(
      TStyle.B3_600,
      customStyle: TextStyle(
        color: AppColors.cWHITE_100,
      ),
    ),
  )
      : card!.canEnrollInBatch == true
      ? Container(
    margin: EdgeInsets.only(left: 4),
    child: buttonFilledLarge(
      'Enroll',
      width: 72,
      height: 28,
      onPressed: () {
        // navigation.push(
        //   MaterialPageRoute(
        //     settings: RouteSettings(
        //       name: Routes.programDetails,
        //     ),
        //     builder: (_) => ProgramDetailsEntry(
        //       ProgramDetailsRequest(
        //         programId: card.id,
        //       ),
        //     ),
        //   ),
        // );
      },
    ),
  )
      : SizedBox();
}
