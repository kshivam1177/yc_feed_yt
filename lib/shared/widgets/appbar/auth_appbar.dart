import 'package:flutter/material.dart';

import 'package:yc_app/utils/colors.dart';

import 'package:yc_app/shared/widgets/buttons/buttons.dart';
import 'package:yc_app/shared/widgets/icon/yc_icon.dart';

PreferredSizeWidget authAppBar(
  BuildContext context, {
  double? elevation,
  bool showBackButton: false,
  bool showLogo: true,
  Function? onTap,
  List<Widget> actions: const [],
}) {
  return AppBar(
    leading: showBackButton
        ? BackButtonWidget(
            onTap: onTap,
          )
        : SizedBox(),
    leadingWidth: showBackButton ? 46 : 16,
    centerTitle: false,
    elevation: elevation,
    titleSpacing: 0,
    backgroundColor: AppColors.cWHITE_100,
    title: showLogo ? ycIcon() : SizedBox.shrink(),
    actions: actions,
  );
}
