import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:yc_app/utils/colors.dart';

import 'package:yc_app/utils/spacing.dart';

import 'package:yc_app/shared/views/shared_views.dart';
import 'package:yc_app/shared/widgets/other_components/cyclic_objects.dart';

class PreEnrollGallery extends StatefulWidget {
  const PreEnrollGallery({Key? key}) : super(key: key);

  @override
  _PreEnrolGalleryState createState() => _PreEnrolGalleryState();
}

class _PreEnrolGalleryState extends State<PreEnrollGallery> {
  double viewPortFraction = 0.8;

  double screenWidth = SharedViews.getScreenWidth();
  int _currentIndex = 0;
  int _currentIndex2 = 0;
  double? _height = (0.8 * SharedViews.getScreenWidth()) / 2.1;
  double? _cardViewPortFraction = 0.3;

  Widget imageCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xxs),
      child: Stack(
        children: [
          Container(
            // height: 100,
            // width: 80,

            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.6),
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  "https://i.picsum.photos/id/1055/200/300.jpg?hmac=RkWuwIAp7D4g_2_g01yQSz2pdKBzYeFDEjq86_12OHg",
                ),
              ),
            ),
          ),
          Positioned(
            bottom: AppSpacing.xs,
            left: AppSpacing.xs,
            child: Text(
              "Saanya",
              style: SharedViews.getTextStyle(
                TStyle.H4_600,
                customStyle: TextStyle(
                  color: AppColors.cWHITE_100,
                ),
              ),
            ),
          ),
        ],
      ),
    );
    // return Container(
    //   padding: EdgeInsets.symmetric(horizontal: AppSpacing.xxs),
    //   child: Stack(
    //     children: [
    //       Container(
    //           height: 100,
    //           width: 80,
    // decoration: BoxDecoration(
    //   color: Colors.grey.withOpacity(0.6),
    //   borderRadius: BorderRadius.circular(8),
    // )),
    // Positioned(
    //   bottom: AppSpacing.xs,
    //   left: AppSpacing.xs,
    //   child: Text("Saanya",
    //       style: SharedViews.getTextStyle(TStyle.H4_600,
    //           customStyle: TextStyle(
    //             color: AppColors.cWHITE_100,
    //           ))),
    //       )
    //     ],
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth,
      padding: EdgeInsets.only(left: 0, right: 0, top: AppSpacing.l),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.m),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("What Kids are Posting",
                    style: SharedViews.getTextStyle(TStyle.H1_700)),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      Text(
                        "View All",
                        style: SharedViews.getTextStyle(TStyle.H4_700,
                            customStyle: TextStyle(
                              color: AppColors.cGREEN_100,
                            )),
                      ),
                      SizedBox(width: AppSpacing.xxs),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.cGREEN_100,
                        size: AppSpacing.s,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: AppSpacing.m),
          CarouselSlider(
            items: List.generate(5, (index) => imageCard()),
            options: CarouselOptions(
              // height: null,

              height: _height,
              pageSnapping: true,
              // height: 100,
              // aspectRatio: 16 / 9,

              viewportFraction: _cardViewPortFraction!,
              disableCenter: true,
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 4),
              onPageChanged: (
                int index,
                CarouselPageChangedReason reason,
              ) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),

          SizedBox(height: AppSpacing.xs),
          CarouselSlider(
            items: List.generate(5, (index) => imageCard()),
            options: CarouselOptions(
              // height: null,

              height: _height,
              // height: 100,
              // aspectRatio: 16 / 9,
              reverse: true,

              viewportFraction: _cardViewPortFraction!,
              disableCenter: true,
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 4),

              onPageChanged: (
                int index,
                CarouselPageChangedReason reason,
              ) {
                setState(() {
                  _currentIndex2 = index;
                });
              },
            ),
          ),

          // Wrap(
          //   children: List.generate(
          //     kidsContentList.length,
          //     (index) => getCyclicKidsImage(
          //       index: index % 5,
          //       screenWidth: screenWidth,
          //       url: kidsContentList[index].url,
          //     ),
          //   ),
          //   spacing: 8.0,
          //   runSpacing: 8.0,
          // ),
          SizedBox(
            height: AppSpacing.l,
          ),
        ],
      ),
    );
  }
}

// Widget buildImages() {
//   return Container();
// }

// Widget buildProgramGalleryPreEnroll({
//   required double screenWidth,
//   // required List<dynamic> kidsContentList,
//   BuildContext? context,
// }) {

//   return
// }
