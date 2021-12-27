import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yc_app/shared/views/shared_views.dart';
import 'package:yc_app/shared/widgets/other_components/profile_image_shimmer.dart';
import 'package:yc_app/shared/widgets/other_components/scaled_image.dart';
import 'package:yc_app/utils/assets.dart';
import 'package:yc_app/utils/colors.dart';
import 'package:yc_app/utils/common_helpers.dart';
import 'package:yc_app/utils/spacing.dart';

class ProfilePictureWidget extends StatefulWidget {
  const ProfilePictureWidget({
    required this.url,
    this.radius,
    this.isEditable = false,
    this.source,
    this.hideAddOnIcon = false,
    this.profileId,
    Key? key,
  }) : super(key: key);

  final String url;
  final double? radius;
  final bool isEditable;
  final String? source;
  final bool? hideAddOnIcon;
  final String? profileId;

  @override
  State<ProfilePictureWidget> createState() => _ProfilePictureWidgetState();
}

class _ProfilePictureWidgetState extends State<ProfilePictureWidget> {
  late String avatarUrl;
  bool _uploadLoader = false;

  void setLoaderState(bool state) {
    setState(() {
      this._uploadLoader = state;
    });
  }

  @override
  void initState() {
    avatarUrl = widget.url;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _uploadLoader
        ? ProfileImageShimmer(radius: widget.radius)
        : InkWell(
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                          top: _getAddOnSide(widget.radius) / 4,
                          // right: _getAddOnSide(widget.radius) / 2,
                        ),
                  child: Stack(
                    children: [
                      Container(
                        height:
                            widget.radius == null ? null : widget.radius! * 2,
                        width:
                            widget.radius == null ? null : widget.radius! * 2,
                        child: avatarUrl.split(".").last == 'svg'
                            ? _buildSvgAvatar()
                            : _buildImageAvatar(),
                      ),
                      if (widget.isEditable)
                        Positioned(
                          bottom: 4,
                          right: 8,
                          child: InkWell(
                            child: CircleAvatar(
                              radius: 14,
                              child: Icon(
                                Icons.camera_alt_outlined,
                                color: AppColors.cWHITE_100,
                                size: 14,
                              ),
                              backgroundColor: AppColors.cGREEN_100,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }

  double _getAddOnSide(double? profilePicRadius) {
    return profilePicRadius == null
        ? SharedViews.getIsTablet()
            ? SharedViews.getScreenWidth() / 10
            : SharedViews.getScreenWidth() / 6
        : profilePicRadius * 1;
  }

  FittedBox _buildImageAvatar({bool showPickedImage = false}) {
    double _w = widget.radius == null
        ? SharedViews.getIsTablet()
            ? SharedViews.getScreenWidth() / 5
            : SharedViews.getScreenWidth() / 3
        : widget.radius! * 2;
    return FittedBox(
      child: Material(
        elevation: 1,
        shadowColor: AppColors.cBLACK_10,
        shape: CircleBorder(),
        child: Container(
          padding: EdgeInsets.all(4),
          height: _w,
          width: _w,
          child: ClipOval(
            child: scaledImage(
              width: _w,
              imageUrl: CommonHelpers.getSanitizedImageUrl(
                imgUrl: this.avatarUrl,
              ),
              fit: BoxFit.cover,
              imageParams: {'w': '200'},
            ),
          ),
        ),
      ),
    );
  }

  FittedBox _buildSvgAvatar() {
    return FittedBox(
      child: Material(
        elevation: 1,
        shadowColor: AppColors.cBLACK_10,
        shape: CircleBorder(),
        child: SvgPicture.network(
          CommonHelpers.getSanitizedImageUrl(
            imgUrl: this.avatarUrl,
          ),
          fit: BoxFit.fill,
          height: SharedViews.getIsTablet()
              ? SharedViews.getScreenWidth() / 5.5
              : SharedViews.getScreenWidth() / 3.5,
          width: SharedViews.getIsTablet()
              ? SharedViews.getScreenWidth() / 5.5
              : SharedViews.getScreenWidth() / 3.5,
        ),
      ),
    );
  }

}
