import 'package:flutter/material.dart';
import 'package:yc_app/utils/colors.dart';
import 'package:yc_app/utils/assets.dart';
import 'package:yc_app/utils/spacing.dart';
import 'package:yc_app/utils/common_helpers.dart';
import 'package:yc_app/shared/views/shared_views.dart';

Widget firstClass() {
  Widget heading() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          child: Text(
            "Begin your \nfirst Class today",
            style: SharedViews.getTextStyle(
              TStyle.H5_700,
              customStyle: TextStyle(
                color: CommonHelpers.colorFromHex('#574600'),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 6,
        ),
        Container(
          width: 21,
          height: 3,
          color: AppColors.cWHITE_100,
        )
      ],
    );
  }

  Widget button() {
    return InkWell(
      onTap: () {
        // PreLoginDashboardEvents.enrollForFreeClick(source: 'MID');
        // navigation.pushNamed(
        //   Routes.getOtp,
        // );
      },
      child: Container(
        height: 30,
        width: 108,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: AppColors.cWHITE_100,
        ),
        child: Center(
          child: Text(
            'Enroll for free',
            style: SharedViews.getTextStyle(
              TStyle.B2_600,
              customStyle: TextStyle(
                color: CommonHelpers.colorFromHex('#925f0b'),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget dotDecoration() {
    return Image.asset(
      Assets.pre_login_yellow_dots,
      height: 84,
    );
  }

  Widget kite() {
    return Image.asset(
      Assets.pre_login_kite,
      height: 84,
    );
  }

  Widget imageCraft() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Image.asset(
        Assets.pre_login_crafts,
        //alignment: Alignment.bottomCenter,
        height: 135,
      ),
    );
  }

  Widget imageBackground() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Image.asset(
        Assets.pre_login_background_1,
        //alignment: Alignment.bottomCenter,
        height: 135,
      ),
    );
  }

  return Container(
    height: 200,
    child: Stack(
      children: [
        Positioned(
          top: 0,
          right: 0,
          child: dotDecoration(),
        ),
        Positioned(
          child: Container(
            height: 156,
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(AppSpacing.m, 32, AppSpacing.m, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.cYELLOW_50,
                  CommonHelpers.colorFromHex('#fe9f41'),
                ],
              ),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      heading(),
                      SizedBox(
                        height: 30,
                      ),
                      button(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: AppSpacing.s,
          bottom: 3,
          child: imageBackground(),
        ),
        Positioned(
          left: 90,
          top: 12,
          child: kite(),
        ),
        Positioned(
          right: AppSpacing.m * 2,
          bottom: 3,
          child: imageCraft(),
        ),
      ],
    ),
  );
}
