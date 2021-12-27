import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yc_app/utils/common_helpers.dart';

class GenericNetworkImage extends StatelessWidget {
  const GenericNetworkImage(
    this.url, {
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.color,
    Key? key,
  }) : super(key: key);

  final String url;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Alignment alignment;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final bool isSvg = Uri.parse(url).path.split(".").last == 'svg';

    return isSvg
        ? SvgPicture.network(
            CommonHelpers.getSanitizedImageUrl(imgUrl: url),
            width: width,
            height: height,
            fit: fit,
            alignment: alignment,
            color: color,
          )
        : Image.network(
            CommonHelpers.getSanitizedImageUrl(imgUrl: url),
            width: width,
            height: height,
            fit: fit,
            alignment: alignment,
            color: color,
          );
  }
}
