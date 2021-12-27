import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'package:intl/intl.dart';
import 'package:yc_app/blocs/homepage_bloc.dart';

import 'package:yc_app/utils/colors.dart';
import 'package:yc_app/utils/spacing.dart';
import 'package:yc_app/utils/common_helpers.dart';
import 'package:yc_app/shared/views/shared_views.dart';
import 'package:yc_app/modules/home/pre_login/pre_login_dashboard_widgets.dart';

Widget momentsOfFun() {
  return Column(
    children: <Widget>[
      sectionHeading(text: 'More than a million \n moments of fun'),
      Container(
        padding: const EdgeInsets.all(AppSpacing.m),
        child: Stack(
          children: [
            Positioned(
              child: Lottie.network(
                CommonHelpers.getSanitizedImageUrl(
                    imgUrl: '/assets/home/free_access.json'),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: AppSpacing.m,
              width: SharedViews.screenWidth,
              height: 1,
              child: Container(
                color: AppColors.cBODY_TEXT,
              ),
            ),
            WatchTimeCounter(),
            LearnerCounter(),
          ],
        ),
      ),
    ],
  );
}

class WatchTimeCounter extends StatefulWidget {
  const WatchTimeCounter({
    Key? key,
  }) : super(key: key);

  @override
  _WatchTimeCounterState createState() => _WatchTimeCounterState();
}

class _WatchTimeCounterState extends State<WatchTimeCounter> {
  double watchTime = 0;
  var _streamWatchTime;
  NumberFormat numberFormat = NumberFormat.decimalPattern();
  @override
  initState() {
    watchTime = homePageBloc
            .preLoginHomepageData.getContentAnalytics?.baseMinutes
            ?.toDouble() ??
        0;
    _streamWatchTime = Stream<double>.periodic(
        Duration(seconds: 1),
        (int sec) => watchTime += homePageBloc
                .preLoginHomepageData.getContentAnalytics?.minutesPerSec ??
            0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: SharedViews.isTablet!
          ? SharedViews.screenHeight / 5
          : SharedViews.screenHeight / 5 - 30,
      right: SharedViews.isTablet!
          ? SharedViews.screenHeight / 6
          : SharedViews.screenWidth! / 2 - 25,
      child: Column(
        children: [
          Container(
            height: 40,
            width: 150,
            constraints: BoxConstraints(
              minWidth: 50,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: AppColors.cBLUE_100),
            child: StreamBuilder<double>(
              initialData: watchTime,
              stream: _streamWatchTime,
              builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
                return Center(
                  child: Text(
                    "${numberFormat.format(snapshot.data!.round())}+",
                    style: SharedViews.getTextStyle(
                      TStyle.H3_700,
                      customStyle: TextStyle(
                        color: AppColors.cWHITE_100,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            'minutes of fun classes',
            style: SharedViews.getTextStyle(
              TStyle.B2_700,
              customStyle: TextStyle(
                color: AppColors.cBLUE_100,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class LearnerCounter extends StatefulWidget {
  const LearnerCounter({
    Key? key,
  }) : super(key: key);

  @override
  _LearnerCounterState createState() => _LearnerCounterState();
}

class _LearnerCounterState extends State<LearnerCounter> {
  NumberFormat numberFormat = NumberFormat.decimalPattern();
  double userCount = 0;
  var _streamUserCount;
  @override
  void initState() {
    userCount = homePageBloc
            .preLoginHomepageData.getContentAnalytics?.baseLearners
            ?.toDouble() ??
        0;
    _streamUserCount = Stream<double>.periodic(
        Duration(seconds: 1),
        (int sec) => userCount += homePageBloc
                .preLoginHomepageData.getContentAnalytics?.learnersPerSec ??
            0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: SharedViews.isTablet!
          ? SharedViews.screenHeight / 6
          : SharedViews.screenHeight / 8,
      left: SharedViews.isTablet!
          ? SharedViews.screenHeight / 7
          : SharedViews.screenWidth! / 2 + 25,
      child: Column(
        children: [
          Container(
            height: SharedViews.isTablet! ? 40 : 30,
            constraints: BoxConstraints(minWidth: 100),
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: AppColors.cPURPLE_100,
            ),
            child: StreamBuilder<double>(
              initialData: userCount,
              stream: _streamUserCount,
              builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
                return Center(
                    child: Text(
                  "${numberFormat.format(snapshot.data!.round())} +",
                  style: SharedViews.getTextStyle(
                    TStyle.B1_700,
                    customStyle: TextStyle(
                      color: AppColors.cWHITE_100,
                    ),
                  ),
                ));
              },
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            'learners',
            style: SharedViews.getTextStyle(
              TStyle.B2_700,
              customStyle: TextStyle(
                color: AppColors.cPURPLE_100,
              ),
            ),
          )
        ],
      ),
    );
  }
}
