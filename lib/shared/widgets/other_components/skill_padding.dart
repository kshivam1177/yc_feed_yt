import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:yc_app/utils/colors.dart';
import 'package:yc_app/utils/spacing.dart';

import 'package:yc_app/shared/views/shared_views.dart';
import 'package:yc_app/shared/widgets/other_components/cyclic_objects.dart';

Widget skillPadding({
  required String text,
  required int index,
  BuildContext? context,
  double? borderRadius,
  bool? isForPreProgram,
}) {
  isForPreProgram = isForPreProgram ?? false;
  return Container(
      padding: EdgeInsets.fromLTRB(
        isForPreProgram ? AppSpacing.s : 24.0,
        isForPreProgram ? AppSpacing.xs : 6.0,
        isForPreProgram ? AppSpacing.s : 24.0,
        isForPreProgram ? AppSpacing.xs : 6.0,
      ),
      decoration: BoxDecoration(
          color: isForPreProgram
              ? getCyclicColorPreEnrol(index % 4)
              : getCyclicColor(index % 4),
          borderRadius: BorderRadius.circular(borderRadius ?? 16.0)),
      child: Text(
        text,
        style: SharedViews.getTextStyle(
          isForPreProgram ? TStyle.B2_600 : TStyle.B1_400,
          customStyle: TextStyle(color: AppColors.cBODY_TEXT),
        ),
      ));
}

Widget cardSkillPadding({
  required String text,
  int? index,
  Color? color,
  BuildContext? context,
}) {
  // CODE : ADDS PADDING TO SKILLS ON LISTING CARDS
  return Container(
      padding: EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 6.0),
      decoration: BoxDecoration(
          color: color == null ? getCyclicColor(index! % 4) : color,
          borderRadius: BorderRadius.circular(16.0)),
      child: Text(
        text,
        style: SharedViews.getTextStyle(TStyle.B2_700,
            customStyle: TextStyle(color: AppColors.cBODY_TEXT)),
      ));
}
