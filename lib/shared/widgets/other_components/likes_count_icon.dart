import 'package:flutter/material.dart';

import 'package:yc_app/shared/views/shared_views.dart';
import 'package:yc_app/utils/common_helpers.dart';

Widget likesCountAndIcon(int likes, Color color) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        CommonHelpers.compactNumFormatter(likes) + "  ",
        style: SharedViews.getTextStyle(
          TStyle.B2_600,
          customStyle: TextStyle(color: color),
        ),
      ),
      Icon(
        Icons.thumb_up_outlined,
        size: 14,
        color: color,
      ),
    ],
  );
}
