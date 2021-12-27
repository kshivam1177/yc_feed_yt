import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:shimmer/shimmer.dart';
import 'package:yc_app/shared/widgets/errors/image_error_widget.dart';

import 'package:yc_app/utils/assets.dart';
import 'package:yc_app/utils/colors.dart';
import 'package:yc_app/utils/common_helpers.dart';

Widget scaledImage({
  // GIVE EITHER HEIGHT OR ASPECT RATIO ALONG WITH WIDTH
  required double width,
  double? height,
  double paddingLR: 0.0,
  double? aspectRatio,
  String? imageUrl,
  double borderWidth: 0.0,
  Color borderColor: AppColors.cBLACK_10,
  double borderRadius: 0.0,
  bool cropToRight: false,
  BoxFit fit: BoxFit.contain,
  Map<String, String>? imageParams,
}) {
  imageUrl = imageUrl == null
      ? null
      : CommonHelpers.getSanitizedImageUrl(
          imgUrl: imageUrl,
          params: imageParams,
        );
  return Container(
    width: width - paddingLR,
    height: aspectRatio != null ? (width - paddingLR) / aspectRatio : height,
    decoration: BoxDecoration(
      border: Border.all(
        color: borderColor,
        width: borderWidth,
      ),
      borderRadius: BorderRadius.circular(borderRadius),
      image: imageUrl == null
          ? DecorationImage(
              image: AssetImage(
                Assets.errorImageSmall,
              ),
              fit: cropToRight ? BoxFit.fitHeight : BoxFit.cover,
              alignment:
                  cropToRight ? FractionalOffset.topRight : Alignment.center,
            )
          : DecorationImage(
              image: CachedNetworkImageProvider(imageUrl),
              fit: cropToRight ? BoxFit.fitHeight : BoxFit.cover,
              alignment:
                  cropToRight ? FractionalOffset.topRight : Alignment.center,
            ),
      color: imageUrl == null ? AppColors.cBLACK_10 : null,
    ),
  );
}

Widget scaledImageWithShimmer({
  // GIVE EITHER HEIGHT OR ASPECT RATIO ALONG WITH WIDTH
  required double width,
  double? height,
  double paddingLR: 0.0,
  double? aspectRatio,
  String? imageUrl,
  Map<String, String>? imageParams,
  double borderWidth: 0.0,
  Color borderColor: AppColors.cBLACK_10,
  double borderRadius: 0.0,
  bool cropToRight: false,
  BoxFit fit: BoxFit.contain,
  bool overrideFit: false,
}) {
  imageUrl = imageUrl == null
      ? null
      : CommonHelpers.getSanitizedImageUrl(
          imgUrl: imageUrl,
          params: imageParams,
        );
  return Container(
    width: width - paddingLR,
    height: aspectRatio != null ? (width - paddingLR) / aspectRatio : height,
    decoration: BoxDecoration(
      border: Border.all(
        color: borderColor,
        width: borderWidth,
      ),
      borderRadius: BorderRadius.circular(borderRadius),
    ),
    child: imageUrl == null
        ? ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: defaultErrorImageWidget(),
          )
        : ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: cropToRight
                  ? BoxFit.fitHeight
                  : overrideFit
                      ? fit
                      : BoxFit.cover,
              alignment:
                  cropToRight ? FractionalOffset.topRight : Alignment.center,
              placeholder: (BuildContext context, url) {
                return Shimmer.fromColors(
                  baseColor: AppColors.cBLACK_10,
                  highlightColor: AppColors.cWHITE_100,
                  child: Container(
                    color: AppColors.cBLACK_10,
                  ),
                );
              },
              errorWidget: (_, __, ___) {
                return defaultErrorImageWidget();
              },
            ),
          ),
  );
}
