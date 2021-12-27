import 'package:flutter/material.dart';
import 'package:yc_app/shared/models/content_dashboard.model.dart';
import 'package:yc_app/utils/colors.dart';
import 'package:yc_app/utils/assets.dart';
import 'package:yc_app/utils/spacing.dart';
import 'package:yc_app/utils/common_helpers.dart';
import 'package:flutter/src/widgets/image.dart' as fi;

import 'package:yc_app/shared/views/shared_views.dart';

Widget registerHook(ContentDashSection section) {
  Widget heading() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Text(
        section.hookDetails?.description ?? "",
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
        // CommonHelpers.getAction(section.hookDetails?.clickActionType,
        //     section.hookDetails?.clickActionUrl);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: AppColors.cWHITE_100,
        ),
        child: Center(
          child: Text(
            section.hookDetails?.buttonText ?? "",
            style: SharedViews.getTextStyle(TStyle.B2_600),
          ),
        ),
      ),
    );
  }

  Widget dotDecoration() {
    return fi.Image.asset(
      Assets.pre_login_hobby1,
      height: 84,
    );
  }

  Widget image() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: fi.Image.asset(
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
