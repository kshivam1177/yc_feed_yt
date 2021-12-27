import 'package:flutter/material.dart';
import 'package:yc_app/blocs/homepage_bloc.dart';
import 'package:yc_app/modules/home/pre_login/components/class_card.dart';
import 'package:yc_app/shared/models/homepage/pre_login_homepage.model.dart';
import 'package:yc_app/utils/colors.dart';
import 'package:yc_app/utils/common_helpers.dart';
import 'package:yc_app/utils/spacing.dart';
import 'package:yc_app/shared/views/shared_views.dart';
import 'package:yc_app/shared/widgets/buttons/buttons.dart';

Widget joinUs() {
  String ctaText = homePageBloc.preLoginHomepageData.getBanner!.ctaText!;
  return Column(
    children: [
      SharedViews.isTablet!
          ? buttonRectangluarFilledLarge(
              ctaText,
              width: 250,
              onPressed: () {
              //   HomeEvents.homePageBannerCtaClick(
              //     ctaText: ctaText,
              //     ctaUrl:
              //         homePageBloc.preLoginHomepageData.getBanner?.ctaUrl ?? "",
              //   );
              //   deepLinkBloc.redirectAfterProfileSelection(
              //     url:
              //         homePageBloc.preLoginHomepageData.getBanner?.ctaUrl ?? "",
              //     inAppNavigation: true,
              //   );
              },
            )
          : buttonRectangluarFilledSmall(
              ctaText,
              width: ctaText.length > 12 ? (ctaText.length * 12.0) : 150,
              onPressed: () {
                // HomeEvents.homePageBannerCtaClick(
                //   ctaText: ctaText,
                //   ctaUrl:
                //       homePageBloc.preLoginHomepageData.getBanner?.ctaUrl ?? "",
                // );
                // deepLinkBloc.redirectAfterProfileSelection(
                //   url:
                //       homePageBloc.preLoginHomepageData.getBanner?.ctaUrl ?? "",
                //   inAppNavigation: true,
                // );
              },
            ),
      SharedViews.isTablet!
          ? SizedBox()
          : SizedBox(height: SharedViews.screenHeight / 8.5),
    ],
  );
}

Widget cardList({
  required List<ClassCardModel> classList,
  bool isPreLoginLive = false,
  String? cardType,
}) {
  return ListView.builder(
    shrinkWrap: true,
    itemCount: classList.length,
    scrollDirection: Axis.horizontal,
    padding: EdgeInsets.only(left: 16),
    itemBuilder: (_, int itemIdx) {
      return Container(
        key: UniqueKey(),
        child: ClassCard1(
          classList[itemIdx],
          cardIdx: itemIdx,
          isPreLoginLive: isPreLoginLive,
          isProgram: false,
          source: 'home',
          // rowIdx: ,
          // rowType: ,
          // tabType: ,
          cardType: cardType,
        ),
      );
    },
  );
}

Widget experienceLiveClass() {
  if (homePageBloc.preLoginHomepageData.getLandingPageLiveClasses == null ||
      homePageBloc.preLoginHomepageData.getLandingPageLiveClasses!.isEmpty) {
    return SizedBox();
  }

  return Column(
    children: [
      sectionHeading(text: 'Experience a Live Class'),
      SizedBox(height: AppSpacing.m),
      SizedBox(
        height: 200,
        child: cardList(
          classList:
              homePageBloc.preLoginHomepageData.getLandingPageLiveClasses!,
          isPreLoginLive: true,
          cardType: 'class',
        ),
      ),
      SizedBox(height: AppSpacing.m),
      // buttonOutlinedSmall(
      //   'View More',
      //   width: 110,
      //   onPressed: () {
      //     PreLoginDashboardEvents.liveClassViewMoreClick();
      //     navigation.pushAndRemoveUntil(
      //         MaterialPageRoute(
      //           settings: RouteSettings(
      //             name: Routes.exploreEntry,
      //           ),
      //           builder: (BuildContext context) => RootPage(
      //             selectedIndex: EXPLORE,
      //           ),
      //         ),
      //         (Route<dynamic> route) => false);
      //   },
      // ),
      // SizedBox(
      //   height: AppSpacing.m,
      // )
    ],
  );
}

Widget banner(BuildContext context) {
  if (SharedViews.isTablet!) {
    return tabletBanner(context);
  } else {
    return mobileBanner();
  }
}

Widget tabletBanner(BuildContext context) {
  Orientation orientation = MediaQuery.of(context).orientation;
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Stack(
      alignment: Alignment.centerLeft,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          child: Image.network(
            CommonHelpers.getSanitizedImageUrl(
                imgUrl: homePageBloc.preLoginHomepageData.getBanner
                        ?.backgroundImageMobileUrl ??
                    ""),
            width: double.maxFinite,
            height: orientation == Orientation.portrait
                ? MediaQuery.of(context).size.height / 3
                : MediaQuery.of(context).size.width / 3,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
          child: Container(
            height: 275,
            width: 410,
            decoration: BoxDecoration(
                color: CommonHelpers.colorFromHex(homePageBloc
                    .preLoginHomepageData.getBanner!.backgroundColor),
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                )),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    homePageBloc.preLoginHomepageData.getBanner?.title ?? "",
                    style: SharedViews.getTextStyle(
                      TStyle.H2_700,
                      customStyle: TextStyle(
                        color: AppColors.cPURPLE_50,
                        fontWeight: FontWeight.w900,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  Text(
                    homePageBloc.preLoginHomepageData.getBanner?.subtitle ?? "",
                    style: SharedViews.getTextStyle(
                      TStyle.H3_700,
                      customStyle:
                          TextStyle(color: AppColors.cWHITE_100, fontSize: 40),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  joinUs(),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget mobileBanner() {
  return Stack(
    alignment: Alignment.bottomCenter,
    children: [
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(8),
              ),
              child: Image.network(
                CommonHelpers.getSanitizedImageUrl(
                  imgUrl: homePageBloc
                      .preLoginHomepageData.getBanner!.backgroundImageMobileUrl,
                ),
                width: double.maxFinite,
                height: SharedViews.screenHeight / 4,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: SharedViews.screenHeight / 8,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: CommonHelpers.colorFromHex(
                  homePageBloc.preLoginHomepageData.getBanner!.backgroundColor,
                ),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(8),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    homePageBloc.preLoginHomepageData.getBanner?.title ?? "",
                    style: SharedViews.getTextStyle(
                      TStyle.B1_400,
                      customStyle: TextStyle(
                        color: AppColors.cPURPLE_50,
                        fontWeight: FontWeight.w900,
                        fontSize: 11,
                      ),
                    ),
                  ),
                  Text(
                    homePageBloc.preLoginHomepageData.getBanner?.subtitle ?? "",
                    style: SharedViews.getTextStyle(
                      TStyle.H3_700,
                      customStyle: TextStyle(color: AppColors.cWHITE_100),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      joinUs(),
    ],
  );
}

Widget sectionHeading({String text = '', Color? textColor}) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.m),
      child: Column(
        children: [
          AppSpacing.xlHeight,
          Text(
            text,
            textAlign: TextAlign.center,
            style: SharedViews.getTextStyle(
              TStyle.H3_700,
              customStyle: TextStyle(color: textColor),
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Container(
            width: 40,
            height: 4,
            color: AppColors.cYELLOW_50,
          )
        ],
      ),
    ),
  );
}
