import 'package:flutter/material.dart';

import 'package:yc_app/utils/spacing.dart';

import 'package:yc_app/shared/views/shared_views.dart';
import 'package:yc_app/shared/widgets/other_components/cyclic_objects.dart';

Widget buildProgramGallery({
  required double screenWidth,
  required List<dynamic> kidsContentList,
  BuildContext? context,
}) {
  return Container(
    width: screenWidth,
    padding: EdgeInsets.only(left: 16.0, right: 16.0),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(children: [
        Text("Gallery", style: SharedViews.getTextStyle(TStyle.H5_700)),
        Spacer(),
        // FlatButton(
        //     onPressed: () {},
        //     child: Text(
        //       "View All",
        //       style: SharedViews.getTextStyle(TStyle.B1_700),
        //     ))
      ]),
      SizedBox(
        height: 16.0,
      ),
      Wrap(
        children: List.generate(
          kidsContentList.length,
          (index) => getCyclicKidsImage(
            index: index % 5,
            screenWidth: screenWidth,
            url: kidsContentList[index].url,
          ),
        ),
        spacing: 8.0,
        runSpacing: 8.0,
      ),
      SizedBox(
        height: AppSpacing.l,
      ),
    ]),
  );
}
