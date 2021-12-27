import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:yc_app/shared/views/shared_views.dart';
import 'package:yc_app/utils/colors.dart';

class ProfileImageShimmer extends StatelessWidget {
  const ProfileImageShimmer({Key? key, this.radius}) : super(key: key);

  final double? radius;

  @override
  Widget build(BuildContext context) {
    double _w = radius == null
        ? SharedViews.getIsTablet()
            ? SharedViews.getScreenWidth() / 5
            : SharedViews.getScreenWidth() / 3
        : radius! * 2;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Shimmer.fromColors(
        baseColor: AppColors.cBLACK_10,
        highlightColor: AppColors.cWHITE_100,
        child: Container(
          width: _w,
          height: _w,
          decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
        ),
      ),
    );
  }
}
