import 'package:flutter/material.dart';
import 'package:yc_app/shared/views/shared_views.dart';
import 'package:yc_app/utils/colors.dart';
import 'package:yc_app/utils/spacing.dart';

Widget heroWidget({
  String? title,
  String? subtitle,
  Color? titleColor,
  Color? subtitleColor,
}) {
  return Container(
    margin: EdgeInsets.only(top: AppSpacing.xl),
    padding: EdgeInsets.symmetric(horizontal: AppSpacing.m),
    child: Column(
      children: [
        Text(
          title ?? "",
          textAlign: TextAlign.center,
          style: SharedViews.getTextStyle(
            TStyle.H3_700,
            customStyle: TextStyle(
              color: titleColor,
            ),
          ),
        ),
        SizedBox(height: AppSpacing.xs),
        Text(
          subtitle ?? "",
          textAlign: TextAlign.center,
          style: SharedViews.getTextStyle(
            TStyle.B1_400,
            customStyle: TextStyle(
              color: subtitleColor ?? AppColors.cBODY_TEXT_50,
            ),
          ),
        ),
        SizedBox(height: AppSpacing.s),
        Container(
          width: 40,
          height: 4,
          color: AppColors.cYELLOW_50,
        ),
      ],
    ),
  );
}
