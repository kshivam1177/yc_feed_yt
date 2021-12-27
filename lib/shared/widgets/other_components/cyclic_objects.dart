import 'package:flutter/material.dart';

import 'package:yc_app/utils/colors.dart';

import 'package:yc_app/shared/widgets/other_components/scaled_image.dart';

TextStyle? getTextCyclicStyle(int index) {
  TextStyle? firstStyle;
  switch (index) {
    case 0:
      firstStyle = TextStyle(
          fontFamily: 'Nunito-Semi', fontSize: 24, color: AppColors.cGREEN_25);
      break;
    case 1:
      firstStyle = TextStyle(
          fontFamily: 'Nunito-Semi', fontSize: 24, color: AppColors.cPURPLE_25);
      break;
    case 2:
      firstStyle = TextStyle(
          fontFamily: 'Nunito-Semi', fontSize: 24, color: AppColors.cPINK_25);
      break;
    case 3:
      firstStyle = TextStyle(
          fontFamily: 'Nunito-Semi', fontSize: 24, color: AppColors.cBLUE_25);
      break;
  }
  return firstStyle;
}

TextStyle? getPreEnrollTextStyle() {
  TextStyle? firstStyle;

  return firstStyle = TextStyle(
      fontFamily: 'Nunito-Semi', fontSize: 24, color: AppColors.cORANGE_50);
}

Color? getCyclicColor(int index) {
  Color? firstStyle;
  switch (index % 4) {
    case 0:
      firstStyle = AppColors.cGREEN_25;
      break;
    case 1:
      firstStyle = AppColors.cPURPLE_25;
      break;
    case 2:
      firstStyle = AppColors.cPINK_25;
      break;
    case 3:
      firstStyle = AppColors.cBLUE_25;
      break;
  }
  return firstStyle;
}

Color? getCyclicColorPreEnrol(int index) {
  Color? firstStyle;
  switch (index % 4) {
    case 0:
      firstStyle = AppColors.cPINK_25;

      break;
    case 1:
      firstStyle = AppColors.cGREEN_25;

      break;
    case 2:
      firstStyle = AppColors.cPURPLE_25;
      break;
    case 3:
      firstStyle = AppColors.cBLUE_25;
      break;
  }
  return firstStyle;
}

Color? getCyclicColorForFaqs(int index) {
  Color? color;
  switch (index) {
    case 0:
      color = AppColors.cPURPLE_06;
      break;
    case 1:
      color = AppColors.cGREEN_06;
      break;
    case 2:
      color = AppColors.cBLUE_06;
      break;
    case 3:
      color = AppColors.cPINK_06;
      break;
  }
  return color;
}

Widget getCyclicKidsImage({int? index, double? screenWidth, String? url}) {
  switch (index) {
    case 0:
      return scaledImage(
          width: 164 * (screenWidth! - 40) / 320,
          height: 96 * (screenWidth - 32) / 328,
          borderRadius: 8.0,
          imageUrl: url);
      break;
    case 1:
      return scaledImage(
          width: 156 * (screenWidth! - 40) / 320,
          height: 96 * (screenWidth - 32) / 328,
          borderRadius: 8.0,
          imageUrl: url);
      break;
    case 2:
      return scaledImage(
          width: 114 * (screenWidth! - 48) / 312,
          height: 96 * (screenWidth - 32) / 328,
          borderRadius: 8.0,
          imageUrl: url);
      break;
    case 3:
      return scaledImage(
          width: 129 * (screenWidth! - 48) / 312,
          height: 96 * (screenWidth - 32) / 328,
          borderRadius: 8.0,
          imageUrl: url);
      break;
    case 4:
      return scaledImage(
          width: 69 * (screenWidth! - 48) / 312,
          height: 96 * (screenWidth - 32) / 328,
          borderRadius: 8.0,
          imageUrl: url);
      break;
  }
  return scaledImage(width: 0);
}
