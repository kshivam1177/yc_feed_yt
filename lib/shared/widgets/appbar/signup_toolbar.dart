import 'package:flutter/material.dart';

import 'package:yc_app/shared/views/shared_views.dart';

import 'package:yc_app/utils/colors.dart';
import 'package:yc_app/utils/spacing.dart';

class SignUpToolbar extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isSubTitle;

  SignUpToolbar({
    this.title = '',
    this.subtitle = '',
    this.isSubTitle = true,
  });

  @override
  Widget build(BuildContext context) {
    return toolbar(context);
  }

  Widget toolbar(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(AppSpacing.m, AppSpacing.m, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: SharedViews.getTextStyle(
                      TStyle.H3_600,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Visibility(
                    visible: isSubTitle,
                    child: Text(
                      subtitle,
                      style: SharedViews.getTextStyle(
                        TStyle.B1_600,
                      )!
                          .copyWith(color: AppColors.cBLACK_40),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
