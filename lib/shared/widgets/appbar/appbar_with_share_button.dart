import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:yc_app/shared/views/shared_views.dart';
import 'package:yc_app/shared/widgets/buttons/buttons.dart';
import 'package:yc_app/utils/assets.dart';

import 'package:yc_app/utils/colors.dart';
import 'package:yc_app/utils/spacing.dart';

PreferredSizeWidget shareAppBar(
  BuildContext context, {
  double? elevation,
  bool showBackButton: false,
  // bool showLogo: false,
  bool showTitle: true,
  required bool showShareButton,
  String? title,
  final Function()? onTap,
}) {
  Widget whatsappShareButton() {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(right: AppSpacing.m),
        child: Row(
          children: [
            Container(
              child: SvgPicture.asset(
                Assets.whatsApp,
                height: 20,
                width: 20,
                color: AppColors.cBODY_TEXT,
              ),
            ),
            SizedBox(width: AppSpacing.xxs),
            Text(
              "Share",
              style: SharedViews.getTextStyle(
                TStyle.B1_400,
                customStyle: TextStyle(color: AppColors.cBODY_TEXT),
              ),
            ),
          ],
        ),
      ),
    );
  }

  return AppBar(
    leading: showBackButton ? BackButtonWidget() : SizedBox(),
    leadingWidth: showBackButton ? 46 : 16,
    centerTitle: false,
    elevation: elevation,
    titleSpacing: 0,
    backgroundColor: AppColors.cWHITE_100,
    actions: [
      if (showShareButton) whatsappShareButton(),
    ],
    title: showTitle
        ? Padding(
            padding: const EdgeInsets.only(left: 0.0),
            child: Text(
              title.toString(), // NOTE: Why is this toString required? - DKA
              style: SharedViews.getTextStyle(TStyle.H5_700),
              overflow: TextOverflow.ellipsis,
            ),
          )
        : SizedBox.shrink(),
  );
}
