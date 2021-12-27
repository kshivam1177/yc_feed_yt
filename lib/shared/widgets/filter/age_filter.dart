import 'package:flutter/material.dart';
import 'package:yc_app/shared/views/shared_views.dart';
import 'package:yc_app/utils/colors.dart';

class AgeFilter extends StatefulWidget {
  @override
  _AgeFilterState createState() => _AgeFilterState();
}

class _AgeFilterState extends State<AgeFilter> {
  List<bool> isSelected = List<bool>.generate(4, (index) => false);

  @override
  initState() {
    super.initState();
  }

  Widget headingTile(String text) {
    return Container(
      height: 43,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(16, 10, 10, 10),
      child: Text(
        text,
        style: SharedViews.getTextStyle(
          TStyle.B1_600,
        ),
      ),
    );
  }

  Widget ageTile(int index, String text, {value}) {
    bool tileSelected = isSelected[index];
    return GestureDetector(
      key: UniqueKey(),
      onTap: () {
        setState(() {
          isSelected[index] = !isSelected[index];
        });
      },
      child: SizedBox(
        width: 158,
        height: 43,
        child: Container(
          padding: EdgeInsets.fromLTRB(16, 10, 10, 10),
          child: Text(
            text,
            style: tileSelected
                ? SharedViews.getTextStyle(
                    TStyle.H5_600,
                    customStyle: TextStyle(
                      fontFamily: 'Nunito-Bold',
                      color: AppColors.cGREEN_100,
                    ),
                  )
                : SharedViews.getTextStyle(
                    TStyle.H5_600,
                  ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        color: AppColors.cWHITE_100,
        height: 219,
        width: 158,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: headingTile('All ages')),
            ageTile(0, '2-5 yrs'),
            ageTile(1, '5-8 yrs'),
            ageTile(2, '8-10 yrs'),
            ageTile(3, '10-12 yrs')
          ],
        ),
      ),
    );
  }
}
