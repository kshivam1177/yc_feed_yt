import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:yc_app/shared/models/content_dashboard.model.dart';

import 'package:yc_app/utils/common_helpers.dart';

import 'package:yc_app/utils/spacing.dart';

import 'package:yc_app/shared/views/shared_views.dart';


Widget hook(
    ContentDashSection sectionData, {
      int? rowIdx,
      String? source,
      String? tabType,
    }) {
  HookDetails _hookDetails = sectionData.hookDetails!;
  return GestureDetector(
    key: UniqueKey(),
    onTap: () {
      // DashboardExploreEvents.contentDashboardEvent(
      //   action: "${_hookDetails.hookType}_click",
      //   section: "hook_section",
      // );
      // CommonHelpers.getAction(
      //   _hookDetails.clickActionType,
      //   _hookDetails.clickActionUrl,
      // );
    },
    child: Container(
      decoration: BoxDecoration(
        color: CommonHelpers.colorFromHex(_hookDetails.backgroundColor),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.fromLTRB(
          AppSpacing.m, AppSpacing.xxs, AppSpacing.m, AppSpacing.xxs),
      margin: EdgeInsets.fromLTRB(AppSpacing.m, AppSpacing.xl, AppSpacing.m, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: AppSpacing.m),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _hookDetails.backgroundImgUrl!.split('.').last == 'svg'
                    ? SvgPicture.network(
                  CommonHelpers.getSanitizedImageUrl(
                    imgUrl: _hookDetails.backgroundImgUrl,
                  ),
                  //fit: BoxFit.fill,
                  height: 35,
                  width: 35,
                  placeholderBuilder: (_) => SizedBox(
                    //height: SharedViews.screenHeight / 15,
                  ),
                )
                    : CachedNetworkImage(
                  //fit: BoxFit.fill,
                  height: 35,
                  width: 35,
                  imageUrl: CommonHelpers.getSanitizedImageUrl(
                    imgUrl: _hookDetails.backgroundImgUrl,
                  ),
                  placeholder: (_, __) => SizedBox(
                    //height: SharedViews.screenHeight / 15,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(AppSpacing.m,
                            AppSpacing.s, AppSpacing.xs, AppSpacing.xxs),
                        child: Text(
                          sectionData.hookDetails?.buttonText ?? '',
                          style: SharedViews.getTextStyle(
                            TStyle.B1_700,
                            customStyle: TextStyle(
                              color: CommonHelpers.colorFromHex(
                                sectionData.hookDetails?.buttonTextColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                          AppSpacing.m,
                          0,
                          AppSpacing.s,
                          AppSpacing.s,
                        ),
                        child: Text(
                          sectionData.hookDetails?.description ?? '',
                          style: SharedViews.getTextStyle(
                            TStyle.B2_400,
                            customStyle: TextStyle(
                              color: CommonHelpers.colorFromHex(
                                  _hookDetails.descriptionTextColor),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: CommonHelpers.colorFromHex(
                        sectionData.hookDetails?.buttonTextColor,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
