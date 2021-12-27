import 'package:flutter/material.dart';

import 'package:yc_app/utils/colors.dart';
import 'package:yc_app/utils/assets.dart';

import 'package:yc_app/utils/spacing.dart';

import 'package:yc_app/shared/views/shared_views.dart';

Widget startAHobby() {
  Widget heading() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Text(
        "Start a new hobby today with YC",
        style: SharedViews.getTextStyle(
          TStyle.H5_700,
          customStyle: TextStyle(
            color: AppColors.cWHITE_100,
          ),
        ),
      ),
    );
  }

  Widget button() {
    return InkWell(
      onTap: () {
        // PreLoginDashboardEvents.enrollForFreeClick(source: 'BOTTOM');
        // navigation.pushNamed(
        //   Routes.getOtp,
        // );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: AppColors.cWHITE_100,
        ),
        child: Center(
          child: Text(
            'Enroll for free',
            style: SharedViews.getTextStyle(TStyle.B2_600),
          ),
        ),
      ),
    );
  }

  Widget dotDecoration() {
    return Image.asset(
      Assets.pre_login_hobby1,
      height: 84,
    );
  }

  Widget image() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Image.asset(
        Assets.pre_login_hobby,
        alignment: Alignment.bottomCenter,
        height: 110,
      ),
    );
  }

  return Stack(
    children: [
      Positioned(
        top: 0,
        left: 0,
        child: dotDecoration(),
      ),
      Positioned(
        child: Container(
          height: 156,
          width: double.infinity,
          margin: EdgeInsets.all(AppSpacing.m),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              colors: [
                AppColors.cPURPLE_STARKID_2,
                AppColors.cPURPLE_STARKID_1,
              ],
            ),
          ),
          child: Column(
            children: [
              heading(),
              Spacer(),
              image(),
            ],
          ),
        ),
      ),
      Positioned(
        left: SharedViews.screenWidth! / 2 - 52,
        height: 30,
        width: 104,
        bottom: 90,
        child: button(),
      )
    ],
  );
}
