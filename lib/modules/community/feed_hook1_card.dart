import 'package:flutter/material.dart';
import 'package:yc_app/utils/colors.dart';

import 'package:yc_app/utils/common_helpers.dart';

class FeedHook1Card extends StatelessWidget {
  final String? imgUrl;
  final String? clickActionType;
  final String? clickActionUrl;
  final BoxBorder? separator;

  const FeedHook1Card({
    Key? key,
    this.imgUrl,
    this.clickActionType,
    this.clickActionUrl,
    this.separator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

      },
      child: Container(
        decoration: BoxDecoration(
          border: this.separator,
        ),
        child: Image.network(
          CommonHelpers.getSanitizedImageUrl(
            imgUrl: imgUrl,
            params: {'auto': 'format', 'w': '800'},
          ),
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
          errorBuilder: (BuildContext context, url, error) => Icon(
            Icons.error,
          ),
        ),
      ),
    );
  }
}
