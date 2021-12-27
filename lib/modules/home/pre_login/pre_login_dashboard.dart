import 'package:flutter/material.dart';
import 'package:yc_app/blocs/homepage_bloc.dart';
import 'package:yc_app/modules/community/social_feed.dart';

import 'package:yc_app/utils/colors.dart';
import 'package:yc_app/utils/spacing.dart';

import 'package:yc_app/shared/views/shared_views.dart';
import 'package:yc_app/shared/widgets/errors/overall_error_screen.dart';
import 'package:yc_app/shared/widgets/errors/something_went_wrong_error.dart';
import 'package:yc_app/shared/widgets/shimmer/shimmer_effect.dart';

import 'package:yc_app/modules/home/pre_login/pre_login_dashboard_widgets.dart';
import 'package:yc_app/modules/home/pre_login/featured_mentors.dart';
import 'package:yc_app/modules/home/pre_login/moments_of_fun.dart';
import 'package:yc_app/modules/home/pre_login/start_a_hobby.dart';
import 'package:yc_app/modules/home/pre_login/what_sets_us_apart.dart';

import 'first_class.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  void initState() {
    homePageBloc.getPreLoginHomepage();
    super.initState();
  }

  @override
  void dispose() {
    homePageBloc.viewerCountUpdateTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SharedViews.init(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SocialFeed()));
          },
          label: Text("Feed")),
      body: RefreshIndicator(
        displacement: 30.0,
        onRefresh: () async => homePageBloc.getPreLoginHomepage(),
        child: StreamBuilder<bool>(
          stream: homePageBloc.loadingController.stream,
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.hasError) {
              return OverallErrorScreen(
                onRetry: () {
                  homePageBloc.getPreLoginHomepage();
                },
              );
            } else if (!snapshot.hasData || snapshot.data!) {
              return buildDashboardShimmerEffect(context);
            } else if (snapshot.hasData && !snapshot.data!) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    banner(context),
                    AppSpacing.xlHeight,
                    exploreSkills(),
                    AppSpacing.xlHeight,
                    whatSetsUsApart(),
                    AppSpacing.xlHeight,
                    experienceLiveClass(),
                    AppSpacing.xlHeight,
                    firstClass(),
                    AppSpacing.xlHeight,
                    momentsOfFun(),
                    AppSpacing.xlHeight,
                    featuredMentors(),
                    startAHobby(),
                    AppSpacing.xlHeight,
                  ],
                ),
              );
            }
            return SomethingWentWrongError(
              onRetry: () {
                homePageBloc.getPreLoginHomepage();
              },
            );
          },
        ),
      ),
    );
  }

  void setSelectedIndex(int number) {
    setState(() {
      _selectedIndex = number;
    });
  }

  Widget exploreSkills() {
    Widget category(
      int index, {
      String title = "",
      String? categoryId,
      Color? color,
      bool isSelected = false,
    }) {
      return InkWell(
        onTap: () {
          // PreLoginDashboardEvents.changeTab(categoryId: categoryId);
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
            homePageBloc.preLoginHomepageData.getCategories!.length,
            (int index) => category(
              index,
              isSelected: _selectedIndex == index,
              categoryId:
                  homePageBloc.preLoginHomepageData.getCategories![index].id,
              title: homePageBloc
                  .preLoginHomepageData.getCategories![index].title!,
              color: colorsMap[homePageBloc
                      .preLoginHomepageData.getCategories![index].color ??
                  "GREEN"]![100],
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
            classList: homePageBloc
                .preLoginHomepageData.getCategories![_selectedIndex].programs!,
            cardType: 'program',
          ),
        ),
        // AppSpacing.mHeight,
        // buttonOutlinedSmall(
        //   'View More',
        //   width: 110,
        //   onPressed: () {
        //     PreLoginDashboardEvents.newSkillsViewMoreClick();
        //     navigation.pushAndRemoveUntil(
        //       MaterialPageRoute<RootPage>(
        //         settings: RouteSettings(
        //           name: Routes.exploreEntry,
        //         ),
        //         builder: (BuildContext context) => RootPage(
        //           selectedIndex: EXPLORE,
        //         ),
        //       ),
        //       (Route<dynamic> route) => false,
        //     );
        //   },
        // ),
        AppSpacing.mHeight,
      ],
    );
  }
}
