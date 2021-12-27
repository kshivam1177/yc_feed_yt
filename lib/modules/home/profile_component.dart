import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:yc_app/shared/widgets/other_components/profile_picture_widget.dart';

import 'package:yc_app/utils/assets.dart';
import 'package:yc_app/utils/colors.dart';
import 'package:yc_app/utils/common_helpers.dart';
import 'package:yc_app/utils/spacing.dart';

import 'package:yc_app/shared/views/shared_views.dart';

Widget profileComponent({
  String? profileName,
  String? greeting,
  String imageUrl = "",
}) {
  final double _size = 48;

  return GestureDetector(
    onTap: () {
      // Navigator.pushReplacement(
      //   navigation.currentContext!,
      //   MaterialPageRoute(
      //     settings: const RouteSettings(name: Routes.myProfile),
      //     builder: (BuildContext context) => RootPage(
      //       selectedNavItem: NavbarItems.MORE,
      //     ),
      //   ),
      // );
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [_buildBoltPlanet(_size, imageUrl), _buildSearchAlert()],
    ),
  );
}

Row _buildSearchAlert() {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      searchWidget(),
      AppSpacing.mWidth,
    ],
  );
}

Row _buildBoltPlanet(double _size, String imageUrl) {
  double _conditionalSize = imageUrl.isEmpty ? 40 : _size;
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      // AppSpacing.mWidth,
      Container(
        height: _conditionalSize,
        width: _conditionalSize,
        child: ProfilePictureWidget(
          url: CommonHelpers.getSanitizedImageUrl(imgUrl: imageUrl),
          radius: _conditionalSize / 2,
        ),
      ),
    ],
  );
}

Widget searchWidget({double height = 22, double width = 22}) {
  return GestureDetector(
    onTap: () {},
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SvgPicture.asset(
        Assets.searchIcon,
        color: AppColors.cBODY_TEXT_75,
        height: height,
        width: width,
      ),
    ),
  );
}

Container buildProfilePlaceholderImage() {
  return Container(
    decoration: BoxDecoration(
      color: AppColors.colors["A"],
      border: Border.all(color: AppColors.cBLACK_05, width: 1),
      borderRadius: BorderRadius.circular(
        SharedViews.screenHeight / 12,
      ),
    ),
    child: Center(
      child: Text(
        "X",
        style: SharedViews.getTextStyle(
          TStyle.H5_700,
          customStyle: TextStyle(color: AppColors.cWHITE_100),
        ),
      ),
    ),
  );
}
