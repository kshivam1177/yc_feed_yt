import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yc_app/blocs/homepage_bloc.dart';
import 'package:yc_app/modules/community/social_feed.dart';
import 'package:yc_app/modules/home/class_card.dart';
import 'package:yc_app/modules/home/pre_login/pre_login_dashboard_widgets.dart';
import 'package:yc_app/modules/home/profile_component.dart';
import 'package:yc_app/modules/home/register_hook.dart';
import 'package:yc_app/modules/home/review_and_stars.dart';
import 'package:yc_app/modules/home/vertical_listview.dart';
import 'package:yc_app/shared/models/content_dashboard.model.dart';
import 'package:yc_app/shared/services/shared_preferences_service.dart';
import 'package:yc_app/shared/views/shared_views.dart';
import 'package:yc_app/shared/widgets/errors/overall_error_screen.dart';
import 'package:yc_app/shared/widgets/shimmer/shimmer_effect.dart';
import 'package:yc_app/shared/widgets/icon/yc_icon.dart';
import 'package:flutter/src/widgets/image.dart' as fi;

import 'package:yc_app/utils/assets.dart';
import 'package:yc_app/utils/colors.dart';
import 'package:yc_app/utils/common_helpers.dart';
import 'package:yc_app/utils/spacing.dart';

import 'complition_card.dart';
import 'dash_horizontal_calcnder_card.dart';
import 'dashboard_banner_list.dart';
import 'dashboard_calander.dart';
import 'hero_widget.dart';
import 'hooks.dart';

class ContentDashboard extends StatefulWidget {
  const ContentDashboard({Key? key}) : super(key: key);

  @override
  _ContentDashboardState createState() => _ContentDashboardState();
}

class _ContentDashboardState extends State<ContentDashboard> {
  @override
  Widget build(BuildContext context) {
    return ContentDashboardBuilder();
  }
}

class ContentDashboardBuilder extends StatefulWidget {
  const ContentDashboardBuilder({Key? key}) : super(key: key);

  @override
  _ContentDashboardBuilderState createState() =>
      _ContentDashboardBuilderState();
}

class _ContentDashboardBuilderState extends State<ContentDashboardBuilder> {
  int _selectedIndex = 0;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    // if (CommonHelpers.isUserLoggedIn()) {
    //   profilesBloc.getProfileDetails(withPlanet: true);
    // }
    homePageBloc.page = 1;
    homePageBloc.recommendedClassesListingId = null;
    homePageBloc.contentDashboardSections = [];
    // homePageBloc.getAgeRange();
    scrollController.addListener(listener);

    homePageBloc.getContentDashboardData();
    super.initState();
  }

  @override
  void dispose() {
    scrollController.removeListener(listener);
    super.dispose();
  }

  void listener() {
    if (scrollController.position.pixels >
            scrollController.position.maxScrollExtent -
                SharedViews.screenHeight &&
        homePageBloc.contentLoadingController.valueWrapper?.value == false &&
        homePageBloc.ageRangeLoadingController.valueWrapper?.value != true) {
      // homePageBloc.getAgeRange();
    }
  }

  void setSelectedIndex(int number) {
    setState(() {
      _selectedIndex = number;
    });
  }

  double getHeight(ContentDashSection section) {
    switch (section.sectionType) {
      case "CLASSES":
        return 160;
      case "COMPETETION_SECTION":
        return 150;
      default:
        return 0;
    }
  }

  Widget getChild(index, section) {
    switch (section.sectionType) {
      case "CLASSES":
        return Container(
          width: SharedViews.isTablet!
              ? 360
              : SharedViews.screenWidth! - (2 * AppSpacing.m),
          margin: EdgeInsets.fromLTRB(AppSpacing.s, 0, AppSpacing.s, 0),
          child: ClassCardWidget(
            section.classes?[index],
            sectionType: "classes",
          ),
        );

      case "UPCOMING_CLASSES_SECTION":
        return DashboardCalenderCard(
          classList: section.upcomingClasses ?? [],
          cardIndex: index,
          sectionIndex: index,
          classData: section.upcomingClasses?[index],
        );

      case "COMPETETION_SECTION":
        return competitionCard(
          cardIndex: index,
          sectionType: section.sectionType,
          card: section.competitionClasses![index],
        );
      default:
        return SizedBox();
    }
  }

  Widget verticalListBuilder(ContentDashSection section) {
    return VerticalListWithViewMore(
      section: section,
      getChild: getChild,
      limit: section.sectionType == "UPCOMING_CLASSES_SECTION" ? 2 : -1,
    );
  }

  Widget bannerList(ContentDashSection section) {
    if (section.banners == null || section.banners!.isEmpty) {
      return SizedBox();
    }
    return DashboardBannerList(
      data: section.banners,
      isExperiment: true,
    );
  }

  Widget upcomingHeadingRow() {
    return Container(
      margin:
          EdgeInsets.only(left: AppSpacing.m, right: AppSpacing.m, bottom: 0),
      child: Row(
        children: [
          Text(
            "Upcoming Classes",
            style: SharedViews.getTextStyle(
              TStyle.H5_700,
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              // DashboardExploreEvents.contentDashboardEvent(
              //   action: "edit_schedule_click",
              //   section: "upcoming-classes",
              // );
              // navigation.pushNamed(
              //   Routes.skillSelection,
              //   arguments: {
              //     "isEditing": true,
              //     "profileId": sharedPreferenceService.profileId,
              //   },
              // );
            },
            child: Row(
              children: [
                fi.Image.asset(
                  Assets.edit,
                  height: 16,
                  width: 16,
                  color: AppColors.cGREEN_100,
                ),
                SizedBox(
                  width: AppSpacing.xxs,
                ),
                Text(
                  "Edit Schedule",
                  style: SharedViews.getTextStyle(
                    TStyle.B2_700,
                    customStyle: TextStyle(
                      color: AppColors.cGREEN_100,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  String initExperiment(String experimentKey) {
    String variation = "default";

    // if (experimentsBloc.experimentsBox == null) {
    //   MiscEvents.experimentNullValue(experimentKey: experimentKey);
    //   return variation;
    // }

    // if (experimentsBloc.experimentsBox!.containsKey(experimentKey)) {
    //   CurrentExperiment currentExperiment =
    //   experimentsBloc.experimentsBox!.get(experimentKey)!;
    //   if (currentExperiment.showAPIDefault!) {
    //
    //     variation = currentExperiment.defaultVariation ?? variation;
    //     return variation;
    //   }
    //
    //   if (currentExperiment.isActive!) {
    //     variation = currentExperiment.userVariation ?? variation;
    //     return variation;
    //   }
    //   if (currentExperiment.isComplete!) {
    //     variation = currentExperiment.winnerVariation ?? variation;
    //     return variation;
    //   }
    // }
    return variation;
  }

  Widget getExperimentUpcomingWidget(ContentDashSection section) {
    final String experimentKey = "upcoming-card-a-b";

    String variation = initExperiment(experimentKey);

    switch (variation) {
      case "vertical-card-list":
        // analyticsBloc.createExperimentEvent(
        //   experimentKey: experimentKey,
        //   variations: getExperimentVariations(experimentKey),
        //   selectedVariation: variation,
        // );
        return verticalListBuilder(section);
      case "horizontal-card-list":
        // analyticsBloc.createExperimentEvent(
        //   experimentKey: experimentKey,
        //   variations: getExperimentVariations(experimentKey),
        //   selectedVariation: variation,
        // );
        if (section.upcomingClasses == null ||
            section.upcomingClasses!.isEmpty) {
          return SizedBox();
        }
        return getHorizontalUpcomingSection(section);
      default:
        // analyticsBloc.createExperimentEvent(
        //   experimentKey: experimentKey,
        //   variations: getExperimentVariations(experimentKey),
        //   selectedVariation: variation,
        // );
        return verticalListBuilder(section);
    }
  }

  Widget getChildWidget(ContentDashSection section, double topPadding) {
    switch (section.sectionType) {
      case "HERO_SECTION":
        return section.heroSection?.headingText == null ||
                section.heroSection?.headingText == ''
            ? SizedBox.shrink()
            : heroWidget(
                title: section.heroSection?.headingText,
                subtitle: section.heroSection?.subHeadingText,
                titleColor: CommonHelpers.colorFromHex(
                  section.heroSection?.headingTextColor,
                ),
                subtitleColor: CommonHelpers.colorFromHex(
                  section.heroSection?.subHeadingTextColor,
                ),
              );
      case "UPCOMING_CLASSES_SECTION":
        return Container(
          margin: EdgeInsets.only(top: AppSpacing.xl),
          child: Column(
            children: [
              section.upcomingClasses == null ||
                      section.upcomingClasses!.isEmpty
                  ? SizedBox()
                  : upcomingHeadingRow(),
              section.upcomingClasses == null ||
                      section.upcomingClasses!.isEmpty
                  ? SizedBox()
                  : AppSpacing.mHeight,
              getExperimentUpcomingWidget(section)
            ],
          ),
        );
      case "TRUST_MARKERS_SECTION":
        return keyHighLights(section.trustMarkersSection ?? []);
      case "REVIEW_SECTION":
        return ReviewsAndStars(
          section: section,
        );
      case "SKILLS_SECTION":
        return exploreSkills(section);
      case "REGISTER_HOOK":
        return registerHook(section);
      case "HOOK":
        return hook(section);
      case "BANNERS_SECTION":
        return bannerList(section);
      case "CLASSES":
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            section.classes?.length ?? 0,
            (index) => Container(
                margin: EdgeInsets.only(top: topPadding),
                child: getChild(index, section)),
          ),
        );

      case "COMPETETION_SECTION":
        return Column(
          children: [
            section.competitionClasses == null ||
                    section.competitionClasses!.isEmpty
                ? SizedBox()
                : Container(
                    margin: EdgeInsets.only(
                        left: AppSpacing.m,
                        top: AppSpacing.xl,
                        right: AppSpacing.m,
                        bottom: AppSpacing.m),
                    child: Row(
                      children: [
                        Text(
                          "Competitions",
                          style: SharedViews.getTextStyle(
                            TStyle.H5_700,
                          ),
                        ),
                      ],
                    ),
                  ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: AppSpacing.m),
              height: getHeight(section),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: section.competitionClasses?.length ?? 0,
                itemBuilder: (context, index) => getChild(index, section),
                separatorBuilder: (context, index) => SizedBox(
                  width: AppSpacing.m,
                ),
              ),
            ),
          ],
        );

      default:
        return SizedBox();
    }
  }

  Widget keyHighLights(List arr) {
    List<Widget> ctaList = [];

    arr.forEach(
      (cta) {
        ctaList.add(
          getEnrollBottomCardItem(
            url: CommonHelpers.getSanitizedImageUrl(
              imgUrl: cta.iconUrl,
            ),
            color: cta.bgColor,
            title: cta.label,
          ),
        );
      },
    );

    return Container(
      padding: EdgeInsets.all(AppSpacing.m),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [...ctaList],
      ),
    );
  }

  Widget getEnrollBottomCardItem(
      {String url = "", String? title, String? color}) {
    return Container(
      // width: 100,
      child: Column(
        children: [
          Container(
            height: SharedViews.screenWidth! * 0.15,
            width: SharedViews.screenWidth! * 0.15,
            decoration: BoxDecoration(
              color: CommonHelpers.colorFromHex(color),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.all(AppSpacing.s),
            child: url.endsWith(".svg")
                ? SvgPicture.network(
                    url,
                  )
                : CachedNetworkImage(
                    imageUrl: url,
                  ),
          ),
          SizedBox(height: AppSpacing.xs),
          Container(
            width: SharedViews.screenWidth! * 0.16,
            child: Text(
              title!,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: SharedViews.getTextStyle(
                TStyle.B2_600,
                customStyle: TextStyle(color: AppColors.cBODY_TEXT_50),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget exploreSkills(section) {
    Widget category(
      int index, {
      String title = "",
      String? categoryId,
      Color? color,
      bool isSelected = false,
    }) {
      return InkWell(
        onTap: () {
          // DashboardExploreEvents.contentDashboardEvent(
          //     id: categoryId, action: "tab_change", section: "skills-section");
          setSelectedIndex(index);
        },
        child: Container(
          height: 40,
          width: title.length * 8.0,
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: SharedViews.getTextStyle(
                          TStyle.B2_700,
                          customStyle: TextStyle(
                            color: isSelected ? color : AppColors.cBODY_TEXT_50,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 3,
                color: isSelected ? color : Colors.transparent,
              )
            ],
          ),
        ),
      );
    }

    Widget categories() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Wrap(
          runSpacing: 10,
          spacing: 5,
          alignment: WrapAlignment.center,
          verticalDirection: VerticalDirection.down,
          children: List<Widget>.generate(
            section.skillsSection!.length,
            (index) => category(
              index,
              isSelected: _selectedIndex == index,
              categoryId: section.skillsSection![index].id,
              title: section.skillsSection![index].title!,
              color: colorsMap[section.skillsSection![index].color ?? "GREEN"]![
                  100],
            ),
          ),
        ),
      );
    }

    return Column(
      children: [
        sectionHeading(text: 'Explore New Skills Daily'),
        AppSpacing.mHeight,
        categories(),
        AppSpacing.mHeight,
        SizedBox(
          height: 200,
          child: cardList(
            classList: section.skillsSection![_selectedIndex].programs!,
            cardType: 'program',
          ),
        ),
        AppSpacing.mHeight,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SocialFeed()));
          },
          label: Text("Feed")),
      appBar: AppBar(
        elevation: 2,
        centerTitle: true,
        title: Visibility(
          visible: CommonHelpers.isUserLoggedIn(),
          replacement: ycIcon(),
          child: profileComponent(
            imageUrl: "A",
          ),
        ),
      ),
      body: RefreshIndicator(
        displacement: 30.0,
        onRefresh: () async {
          homePageBloc.page = 1;
          homePageBloc.recommendedClassesListingId = null;
          homePageBloc.contentDashboardSections = [];
          // homePageBloc.getAgeRange();
          homePageBloc.getContentDashboardData();
        },
        child: StreamBuilder<bool>(
          stream: homePageBloc.contentLoadingController.stream,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return OverallErrorScreen(
                onRetry: () {
                  homePageBloc.page = 1;
                  homePageBloc.recommendedClassesListingId = null;
                  homePageBloc.contentDashboardSections = [];
                  // homePageBloc.getAgeRange();
                  homePageBloc.getContentDashboardData();
                },
              );
            }
            if (snapshot.hasData == false ||
                homePageBloc.contentDashboardSections.length == 0) {
              return buildDashboardShimmerEffect(context);
            }
            return ListView.separated(
              controller: scrollController,
              separatorBuilder: (_, i) {
                return SizedBox.shrink();
              },
              shrinkWrap: true,
              itemBuilder: (_, i) {
                if (i == homePageBloc.contentDashboardSections.length) {
                  return AppSpacing.sHeight;
                }
                return getChildWidget(
                  homePageBloc.contentDashboardSections[i],
                  i == 0 ? AppSpacing.s : AppSpacing.xl,
                );
              },
              itemCount: homePageBloc.contentDashboardSections.length + 1,
            );
          },
        ),
      ),
    );
  }
}

Widget getHorizontalUpcomingSection(section) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: AppSpacing.m),
    height: 110 + AppSpacing.m,
    //padding: EdgeInsets.only(bottom: AppSpacing.m),
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: section.upcomingClasses?.length ?? 0,
      itemBuilder: (context, index) => DashboardHorizontalCalendarCard(
        sectionType: section.sectionType,
        index: index,
        cardType: "CARD_CALENDAR_HORIZONTAL",
        deeplink:
            section.upcomingClasses![index].cardClickAction?.clickActionUrl,
        date: section.upcomingClasses![index].dateTime,
        imageUrl:
            section.upcomingClasses![index].cardBackground?.backgroundImageUrl,
        shouldShowIcon: section.upcomingClasses![index].classType == "Program",
        isContentDashboard: true,
      ),
      separatorBuilder: (context, index) => Container(
        width: 1,
        height: 90,
        margin: EdgeInsets.symmetric(
          horizontal: AppSpacing.s,
        ),
        color: AppColors.cBLACK_05,
      ),
    ),
  );
}
