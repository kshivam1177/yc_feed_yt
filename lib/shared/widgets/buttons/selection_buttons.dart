import 'package:flutter/material.dart';

import 'package:yc_app/shared/views/shared_views.dart';

import 'package:yc_app/utils/colors.dart';
import 'package:yc_app/utils/spacing.dart';

Widget timeSlotButton({
  required bool value,
  required String title,
  Function()? onCall,
}) {
  return Padding(
    padding: const EdgeInsets.only(
      right: AppSpacing.xs,
    ),
    child: Container(
      width: 100,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: value ? AppColors.cGREEN_06 : AppColors.cWHITE_100,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          width: 1.0,
          color: AppColors.cGREEN_100,
        ),
      ),
      child: MaterialButton(
        onPressed: onCall,
        child: Text(
          title,
          style: SharedViews.getTextStyle(
            TStyle.B1_700,
            customStyle: TextStyle(
              color: AppColors.cGREEN_TEXT,
            ),
          ),
        ),
      ),
    ),
  );
}

Widget daySelectionButton({
  required bool isSelected,
  required String title,
  required Function()? onCall,
  required Function(bool?)? onCallCheckBox,
}) {
  return GestureDetector(
    onTap: onCall,
    child: Container(
      width: double.infinity,
      height: AppSpacing.xxl,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isSelected ? AppColors.cGREEN_06 : AppColors.cWHITE_100,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: isSelected ? AppColors.cGREEN_50 : AppColors.cBLACK_05,
          width: 1.0,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(
            activeColor: AppColors.cGREEN_100,
            value: isSelected,
            onChanged: onCallCheckBox,
            side: BorderSide(
              color: AppColors.cGREEN_100,
            ),
          ),
          Expanded(
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: SharedViews.getTextStyle(
                TStyle.B1_600,
                customStyle: TextStyle(
                  color:
                      isSelected ? AppColors.cGREEN_TEXT : AppColors.cBODY_TEXT,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget dayTimeSelectionButton({
  required bool isSelected,
  required String title,
  required String time,
  Function(bool?)? onCall,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: AppSpacing.xs),
    child: CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      value: isSelected,
      activeColor: AppColors.cGREEN_100,
      checkColor: AppColors.cWHITE_100,
      tileColor: isSelected ? AppColors.cGREEN_06 : AppColors.cWHITE_100,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: isSelected ? AppColors.cGREEN_50 : AppColors.cBLACK_05,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(AppSpacing.xs),
      ),
      onChanged: onCall,
      title: Text(
        title,
        style: SharedViews.getTextStyle(
          TStyle.B1_600,
          customStyle: TextStyle(
            color: isSelected ? AppColors.cGREEN_TEXT : AppColors.cBODY_TEXT,
          ),
        ),
      ),
      secondary: Text(
        time,
        style: SharedViews.getTextStyle(
          TStyle.B1_600,
          customStyle: TextStyle(
            color: isSelected ? AppColors.cGREEN_TEXT : AppColors.cBODY_TEXT,
          ),
        ),
      ),
    ),
  );
}
