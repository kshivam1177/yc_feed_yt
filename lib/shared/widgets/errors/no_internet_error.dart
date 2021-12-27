import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:yc_app/shared/views/shared_views.dart';
import 'package:yc_app/shared/widgets/buttons/buttons.dart';

import 'package:yc_app/utils/assets.dart';
import 'package:yc_app/utils/spacing.dart';

class NoInternetError extends StatelessWidget {
  final Function? onRetry;

  NoInternetError({Key? key, this.onRetry}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.xxl),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Lottie.asset(Assets.noConnection, height: 120, width: 183),
            AppSpacing.xlHeight,
            Text(
              "No Internet Connection",
              style: SharedViews.getTextStyle(
                TStyle.H3_700,
              ),
              textAlign: TextAlign.center,
            ),
            AppSpacing.sHeight,
            Text(
              "Please turn on WiFi or your mobile data\nand try again.",
              style: SharedViews.getTextStyle(
                TStyle.B1_400,
              ),
              textAlign: TextAlign.center,
            ),
            AppSpacing.xlHeight,
            buttonFilledLarge("Try again", onPressed: onRetry)
          ],
        ),
      ),
    );
  }
}
