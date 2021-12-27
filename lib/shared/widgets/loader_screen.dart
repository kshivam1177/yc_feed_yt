import 'package:flutter/material.dart';

import 'package:yc_app/utils/colors.dart';

import 'package:yc_app/shared/widgets/appbar/auth_appbar.dart';
import 'package:yc_app/shared/widgets/buttons/buttons.dart';
import 'package:yc_app/shared/widgets/shimmer/shimmer_effect.dart';

class LoaderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: authAppBar(context, showBackButton: true) as PreferredSizeWidget?,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
        child: buttonFilledLarge(
          "",
          onPressed: () {},
          bodyColor: AppColors.cBLACK_05,
        ),
      ),
      body: buildClassShimmerEffect(context),
    );
  }
}
