import 'package:flutter/material.dart';
import 'package:yc_app/utils/assets.dart';
import 'package:yc_app/utils/colors.dart';
import 'package:yc_app/shared/views/shared_views.dart';

class ExploreWidget extends StatelessWidget {
  const ExploreWidget({Key? key}) : super(key: key);

  final String text = "A new learning and a new experience with every class";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      padding: EdgeInsets.only(top: 70),
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            //TODO(chris) : Change when values are available
            Color(0xffdbf5ff),
            Color.fromRGBO(241, 251, 255, 0.24),
          ],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 16,
            right: 16,
            child: Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    Assets.exploreClassBannerBackgroundSvg,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    Assets.exploreClassBannerSvg,
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(16, 16, 16, 10),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: SharedViews.getScreenWidth() * 0.7,
                        child: Text(
                          text,
                          style: SharedViews.getTextStyle(
                            TStyle.H3_700,
                            customStyle: TextStyle(color: Color(0xff939c9f)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          //goTOFeed
                        },
                        child: Row(
                          children: [
                            Text(
                              'Go To Feed',
                              style: SharedViews.getTextStyle(
                                TStyle.B1_700,
                                customStyle:
                                    TextStyle(color: AppColors.cGREEN_100),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: AppColors.cGREEN_100,
                              size: 12,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
