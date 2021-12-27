import 'package:flutter/material.dart';

import 'package:yc_app/shared/views/shared_views.dart';

import 'package:yc_app/utils/colors.dart';

import 'package:yc_app/shared/widgets/buttons/buttons.dart';

PreferredSizeWidget defaultAppBar(
  BuildContext context, {
  double? elevation,
  bool showBackButton: false,
  // bool showLogo: false,
  bool showTitle: true,
  String? title,
  Function? onTap,
  List<Widget>? actionMenus,
}) {
  return AppBar(
    leading: showBackButton ? BackButtonWidget(onTap: onTap) : SizedBox(),
    leadingWidth: showBackButton ? 46 : 16,
    centerTitle: false,
    elevation: elevation,
    titleSpacing: 0,
    backgroundColor: AppColors.cWHITE_100,
    title: showTitle
        ? Padding(
            padding: const EdgeInsets.only(left: 0.0),
            child: Text(
              title.toString(),
              style: SharedViews.getTextStyle(
                TStyle.H5_700,
              ),
            ),
          )
        : SizedBox.shrink(),
    actions: actionMenus,
  );
}
