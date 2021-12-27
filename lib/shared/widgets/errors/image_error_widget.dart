import 'package:flutter/material.dart';

import 'package:yc_app/utils/assets.dart';
import 'package:yc_app/utils/common_helpers.dart';

Widget defaultErrorImageWidget() {
  return Container(
    color: CommonHelpers.colorFromHex("#FCF2CA"),
    child: Center(
      child: Image.asset(
        Assets.errorImageSmall,
        //fit: BoxFit.scaleDown,
        height: 30,
        width: 30,
      ),
    ),
  );
}
