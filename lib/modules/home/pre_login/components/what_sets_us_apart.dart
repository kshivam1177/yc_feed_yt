import 'package:flutter/material.dart';
import 'package:yc_app/blocs/homepage_bloc.dart';

import 'package:yc_app/utils/spacing.dart';
import 'package:yc_app/utils/common_helpers.dart';

import 'package:yc_app/shared/views/shared_views.dart';

import 'package:yc_app/modules/home/pre_login/components/pre_login_dashboard_widgets.dart';

Widget whatSetsUsApart() {
  Widget sectionTile({
    String? assetIcon,
    String title = "",
    String subtitle = "",
    Color? titleColor,
    Color? subTitleColor,
    Color? backgroundColor,
  }) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(
        horizontal: AppSpacing.m,
        vertical: AppSpacing.s,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            height: 42,
            width: 42,
            child: Image.network(
              assetIcon ?? "",
              height: 42,
              width: 42,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: SharedViews.getTextStyle(
                  TStyle.B1_700,
                  customStyle: TextStyle(color: titleColor),
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                subtitle,
                style: SharedViews.getTextStyle(
                  TStyle.B2_600,
                  customStyle: TextStyle(color: subTitleColor),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  return Container(
    margin: EdgeInsets.symmetric(
      horizontal: AppSpacing.m,
      vertical: AppSpacing.s,
    ),
    padding: EdgeInsets.fromLTRB(0, AppSpacing.l, 0, AppSpacing.m),
    decoration: BoxDecoration(
      color: CommonHelpers.colorFromHex(
        homePageBloc.preLoginHomepageData.getLandingPageHooks!.bgColor,
      ),
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Color.fromARGB(46, 33, 42, 57),
          offset: const Offset(
            0,
            0,
          ),
          blurRadius: 10.0,
          spreadRadius: 2.0,
        ), //BoxShadow
        BoxShadow(
          color: Colors.white,
          offset: const Offset(0.0, 0.0),
          blurRadius: 0.0,
          spreadRadius: 0.0,
        ),
      ],
    ),
    child: Column(
      children: [
        sectionHeading(
          text: homePageBloc.preLoginHomepageData.getLandingPageHooks!.title!,
          textColor: CommonHelpers.colorFromHex(
            homePageBloc
                .preLoginHomepageData.getLandingPageHooks!.titleTextColor,
          ),
        ),
        SizedBox(
          height: AppSpacing.s,
        ),
        ...List<Widget>.generate(
          homePageBloc
              .preLoginHomepageData.getLandingPageHooks!.sections!.length,
          (index) => sectionTile(
            assetIcon: CommonHelpers.getSanitizedImageUrl(
                imgUrl: homePageBloc.preLoginHomepageData.getLandingPageHooks!
                    .sections![index].iconUrl!),
            title: homePageBloc.preLoginHomepageData.getLandingPageHooks!
                .sections![index].title!,
            titleColor: CommonHelpers.colorFromHex(homePageBloc
                .preLoginHomepageData
                .getLandingPageHooks!
                .sections![index]
                .titleTextColor),
            subtitle: homePageBloc.preLoginHomepageData.getLandingPageHooks!
                .sections![index].description!,
            subTitleColor: CommonHelpers.colorFromHex(homePageBloc
                .preLoginHomepageData
                .getLandingPageHooks!
                .sections![index]
                .descriptionTextColor),
            backgroundColor: CommonHelpers.colorFromHex(homePageBloc
                .preLoginHomepageData
                .getLandingPageHooks!
                .sections![index]
                .bgColor),
          ),
        ),
      ],
    ),
  );
}
