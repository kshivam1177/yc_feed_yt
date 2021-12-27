import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:yc_app/utils/colors.dart';

import 'package:yc_app/shared/views/shared_views.dart';

Widget upVoteTintedLarge(BuildContext context, text,
    {double width: 86, double height: 30, double fontSize: 16}) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
        color: AppColors.cGREEN_25,
        borderRadius: BorderRadius.circular(height / 2)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          text,
          style: SharedViews.getTextStyle(
            TStyle.H5_600,
            customStyle: TextStyle(color: AppColors.cGREEN_100),
          ),
        ),
        SvgPicture.asset(
          'assets/icons/like.svg',
          width: 19,
          height: 18,
        ),
      ],
    ),
  );
}

Widget upVoteTintedSmall(BuildContext context, text,
    {double width: 57, double height: 20, double fontSize: 16}) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
        color: AppColors.cGREEN_25,
        borderRadius: BorderRadius.circular(height / 2)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          text,
          style: SharedViews.getTextStyle(
            TStyle.B2_600,
            customStyle: TextStyle(color: AppColors.cGREEN_100),
          ),
        ),
        SvgPicture.asset(
          'assets/icons/like.svg',
          width: 14,
          height: 14,
        ),
      ],
    ),
  );
}

Widget upVotePlainLarge(BuildContext context, text,
    {double width: 86, double height: 30}) {
  return Container(
    width: width,
    height: height,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          text,
          style: SharedViews.getTextStyle(
            TStyle.H5_600,
            customStyle: TextStyle(color: AppColors.cGREEN_100),
          ),
        ),
        SvgPicture.asset(
          'assets/icons/like.svg',
          width: 19,
          height: 18,
        ),
      ],
    ),
  );
}

Widget upVotePlainSmall(BuildContext context, text,
    {double width: 57, double height: 20}) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
        color: AppColors.cWHITE_100,
        borderRadius: BorderRadius.circular(height / 2)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          text,
          style: SharedViews.getTextStyle(
            TStyle.B2_600,
            customStyle: TextStyle(color: AppColors.cGREEN_100),
          ),
        ),
        SvgPicture.asset(
          'assets/icons/like.svg',
          width: 14,
          height: 14,
        ),
      ],
    ),
  );
}

Widget tagLabel(
  BuildContext context,
  text, {
  double width: 100,
  double height: 32,
  double fontSize: 14,
  Color textColor: AppColors.cBODY_TEXT,
}) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      color: AppColors.cGREEN_25,
      borderRadius: BorderRadius.circular(height / 2),
    ),
    child: Center(
      child: Text(
        text,
        style: TextStyle(
            fontFamily: 'Nunito',
            fontSize: fontSize,
            fontWeight: FontWeight.w500,
            color: textColor),
      ),
    ),
  );
}

Widget titleLabel(BuildContext context, text,
    {double? width,
    double height: 32,
    double fontSize: 14,
    bool isOutlined: false}) {
  return Container(
    width: width ?? width,
    height: height,
    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
    decoration: isOutlined
        ? BoxDecoration(
            border: Border.all(color: AppColors.cYELLOW_100),
            borderRadius: BorderRadius.circular(height / 2),
          )
        : BoxDecoration(),
    child: Text(
      text,
      style: SharedViews.getTextStyle(
        TStyle.B1_600,
        customStyle: TextStyle(color: AppColors.cYELLOW_100),
      ),
    ),
  );
}
