import 'package:flutter/material.dart';

import 'package:yc_app/utils/colors.dart';

import 'package:yc_app/shared/views/shared_views.dart';

class LiveTag extends StatefulWidget {
  const LiveTag(this.animationController, {Key? key, this.height, this.width})
      : super(key: key);

  final AnimationController? animationController;
  final double? height;
  final double? width;

  @override
  _LiveTagState createState() => _LiveTagState();
}

class _LiveTagState extends State<LiveTag> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: AppColors.cERROR,
      ),
      child: Center(
        child: FittedBox(
          child: Row(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  FadeTransition(
                    opacity: widget.animationController!,
                    child: Icon(
                      Icons.circle,
                      size: 16,
                      color: AppColors.cWHITE_100,
                    ),
                  ),
                  Icon(
                    Icons.circle,
                    size: 8,
                    color: AppColors.cWHITE_100,
                  ),
                ],
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                'LIVE',
                style: SharedViews.getTextStyle(
                  TStyle.B2_600,
                  customStyle: TextStyle(
                    letterSpacing: 1,
                    color: AppColors.cWHITE_100,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
