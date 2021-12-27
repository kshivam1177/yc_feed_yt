import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yc_app/modules/home/pre_login/pre_login_dashboard_widgets.dart';
import 'package:yc_app/shared/models/content_dashboard.model.dart';
import 'package:yc_app/shared/views/shared_views.dart';
import 'package:yc_app/utils/assets.dart';
import 'package:yc_app/utils/colors.dart';
import 'package:yc_app/utils/common_helpers.dart';
import 'package:yc_app/utils/spacing.dart';
import 'package:flutter/src/widgets/image.dart' as fi;

class ReviewsAndStars extends StatefulWidget {
  const ReviewsAndStars({required this.section, Key? key}) : super(key: key);
  final ContentDashSection section;
  @override
  _ReviewsAndStarsState createState() => _ReviewsAndStarsState();
}

class _ReviewsAndStarsState extends State<ReviewsAndStars> {
  buildReviews() {
    return Container(
      height: 190,
      child: Stack(
        children: [
          Positioned.fill(
            bottom: 0,
            child: Column(
              children: [
                Container(
                  height: 95,
                ),
                Container(
                  height: 85,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [AppColors.cORANGE_100, AppColors.cYELLOW_50],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListView.builder(
            itemCount: widget.section.reviewSection?.reviews?.length ?? 0,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            padding: EdgeInsets.only(bottom: AppSpacing.xxl),
            itemBuilder: (_, index) {
              return Container(
                width: 236,
                height: 150,
                margin: EdgeInsets.only(left: AppSpacing.m),
                padding: EdgeInsets.all(AppSpacing.s),
                decoration: BoxDecoration(
                    color: AppColors.cWHITE_100,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.cBLACK_10)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: CachedNetworkImageProvider(
                            CommonHelpers.getSanitizedImageUrl(
                              imgUrl: widget.section.reviewSection
                                  ?.reviews![index].profilePic ??
                                  "",
                            ),
                          ),
                          radius: 24,
                        ),
                        AppSpacing.sWidth,
                        Text(
                          widget.section.reviewSection?.reviews![index]
                              .reviewerName ??
                              "",
                          overflow: TextOverflow.fade,
                          softWrap: true,
                        )
                      ],
                    ),
                    AppSpacing.sHeight,
                    Text(
                      widget.section.reviewSection?.reviews![index].review ??
                          "",
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: SharedViews.getTextStyle(TStyle.B2_400),
                    )
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  getStars(rating) {
    double rate = double.parse(rating);
    List<Widget> stars = [];
    Widget coloredStar = SvgPicture.asset(
      Assets.starFilledIconBlue,
    );
    Widget unColoredStar = SvgPicture.asset(
      Assets.starUnFilledIcon,
    );
    Widget halfFilledStar = SvgPicture.asset(
      Assets.starHalfFilledIcon,
    );
    for (int i = 0; i < 5; i++) {
      print(rate);
      if (rate >= 1) {
        stars.add(coloredStar);
        rate -= 1;
        continue;
      }
      if (rate < 1 && rate > 0) {
        stars.add(halfFilledStar);
        rate -= 1;
        continue;
      }
      rate -= 1;
      stars.add(unColoredStar);
    }
    return stars;
  }

  Widget reviewWidget() {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            // gradient: LinearGradient(
            //   colors: [Color(0xfff6d5f7), Color(0xfffbe9d7)],
            //   begin: Alignment.topLeft,
            //   end: Alignment.bottomRight,
            // ),
            color: AppColors.cORANGE_06,
            borderRadius: BorderRadius.circular(8),
          ),
          margin: EdgeInsets.symmetric(horizontal: AppSpacing.m),
          padding: EdgeInsets.all(AppSpacing.l),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            widget.section.reviewSection?.rating?.toString() ??
                                "0",
                            style: SharedViews.getTextStyle(
                              TStyle.H2_700,
                              customStyle: TextStyle(),
                            ),
                          ),
                          SizedBox(width: AppSpacing.xs),
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.cWHITE_100.withOpacity(0.60),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            padding: EdgeInsets.all(AppSpacing.xxs),
                            child: Row(
                              children: [
                                ...getStars(
                                    widget.section.reviewSection?.rating ?? 0),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: AppSpacing.xs),
                      Text(
                        "${widget.section.reviewSection?.reviewsCount ?? 0} reviews",
                        style: SharedViews.getTextStyle(
                          TStyle.B1_400,
                          customStyle: TextStyle(
                            color: AppColors.cORANGE_100,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        widget.section.reviewSection?.enrollmentCount
                            .toString() ??
                            "",
                        style: SharedViews.getTextStyle(
                          TStyle.H2_700,
                          customStyle: TextStyle(),
                        ),
                      ),
                      SizedBox(height: AppSpacing.xs),
                      Text(
                        "Kids enrolled",
                        style: SharedViews.getTextStyle(
                          TStyle.B1_400,
                          customStyle: TextStyle(
                            color: AppColors.cORANGE_100,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          bottom: 0,
          left: SharedViews.getScreenWidth() / 2,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: AppSpacing.l),
            child: Container(
              // height: AppSpacing.xxl2,
              width: 2,
              decoration: BoxDecoration(
                color: AppColors.cBODY_TEXT.withOpacity(0.12),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        sectionHeading(text: 'Parents & Kids love us!'),
        AppSpacing.lHeight,
        reviewWidget(),
        AppSpacing.lHeight,
        buildReviews()
      ],
    );
  }
}
