import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:yc_app/utils/colors.dart';
import 'package:yc_app/utils/common_helpers.dart';

import 'package:yc_app/shared/views/shared_views.dart';
import 'package:yc_app/shared/widgets/other_components/scaled_image.dart';
import 'package:yc_app/shared/models/homepage/dashboard_response.model.dart';
import 'package:yc_app/utils/spacing.dart';

class DashboardBannerList extends StatefulWidget {
  DashboardBannerList(
      {required this.data,
        this.isExperiment = false,
        this.showTopPadding = true,
        Key? key})
      : super(key: key);
  final List<ClassCard>? data;
  final bool isExperiment;
  bool showTopPadding;
  @override
  _DashboardBannerListState createState() => _DashboardBannerListState();
}

class _DashboardBannerListState extends State<DashboardBannerList> {
  late int _currentIndex;
  double viewPortFraction = 0.9;
  int maxVisibleIndicators = 9;
  int? min;
  int? max;

  Widget backgroundImage({required ClassCard obj, int? itemIdx}) {
    return GestureDetector(
      key: UniqueKey(),
      onTap: () {
        // widget.isExperiment
        //     ? DashboardExploreEvents.contentDashboardCardEvent(
        //     action: "content-dashboard-banner-click",
        //     section: "banner-section",
        //     other: {
        //       "bannerIdx": itemIdx,
        //       "bannerTitle": obj.entityTitle,
        //       "id": obj.entityId,
        //     })
        //     : DashboardExploreEvents.bannerClick(
        //   bannerIdx: itemIdx,
        //   bannerTitle: obj.entityTitle,
        // );
        // CommonHelpers.getAction(obj.cardClickAction?.clickActionType, obj.cardClickAction?.clickActionUrl);
      },
      child: scaledImageWithShimmer(
        imageUrl: obj.cardBackground?.backgroundImageUrl,
        width: SharedViews.getIsTablet()
            ? viewPortFraction * MediaQuery.of(context).size.width - 8
            : viewPortFraction * SharedViews.getScreenWidth() - 8,
        aspectRatio: 5 / 3,
        borderRadius: 8,
        fit: BoxFit.cover,
      ),
    );
  }

  List<Widget> createItemsList() {
    return List<Widget>.generate(
        widget.data?.length ?? 0,
            (int index) =>
            backgroundImage(obj: widget.data![index], itemIdx: index));
  }

  @override
  void initState() {
    _currentIndex = 0;
    min = 0;
    max = maxVisibleIndicators;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        widget.showTopPadding ? AppSpacing.xlHeight : AppSpacing.xxsHeight,
        CarouselSlider(
          items: createItemsList(),
          options: CarouselOptions(
            height: SharedViews.getIsTablet()
                ? null
                : (viewPortFraction * SharedViews.getScreenWidth() - 8) * 3 / 5,
            aspectRatio: 3,
            viewportFraction: viewPortFraction,
            enableInfiniteScroll: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            onPageChanged: (
                int index,
                CarouselPageChangedReason reason,
                ) {
              setState(
                    () {
                  _currentIndex = index;
                },
              );
            },
          ),
        ),
        widget.data!.length > 1 ? SizedBox(height: 12) : SizedBox(),
        widget.data!.length > 1
            ? AnimatedSmoothIndicator(
          activeIndex: _currentIndex,
          count: widget.data!.length,
          effect: ScrollingDotsEffect(
            dotHeight: 3,
            dotWidth: 12,
            radius: 1.5,
            activeDotColor: AppColors.cGREEN_100,
            dotColor: AppColors.cBLACK_20,
            spacing: 4,
            activeDotScale: 1.1,
          ),
        )
            : SizedBox(),
      ],
    );
  }
}
