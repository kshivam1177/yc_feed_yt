import 'package:flutter/material.dart';
import 'package:yc_app/shared/models/content_dashboard.model.dart';
import 'package:yc_app/utils/colors.dart';
import 'package:yc_app/utils/spacing.dart';

import 'package:yc_app/shared/views/shared_views.dart';

class VerticalListWithViewMore extends StatefulWidget {
  final ContentDashSection section;
  final Function getChild;
  final int limit;

  const VerticalListWithViewMore({
    required this.section,
    required this.getChild,
    this.limit = -1,
    Key? key,
  }) : super(key: key);

  @override
  _VerticalListWithViewMoreState createState() =>
      _VerticalListWithViewMoreState();
}

class _VerticalListWithViewMoreState extends State<VerticalListWithViewMore> {
  bool showMore = false;
  @override
  void initState() {
    super.initState();
  }

  void toggleShowMore() {
    showMore = !showMore;
    // DashboardExploreEvents.dashboardViewMoreClick(widget.section.sectionType);
    setState(() {});
  }

  Widget viewMoreButton() {
    return InkWell(
      onTap: () => toggleShowMore(),
      child: Container(
        margin: EdgeInsets.only(top: AppSpacing.m),
        width: 108,
        height: 32,
        decoration: BoxDecoration(
          color: AppColors.cGREEN_06,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              showMore ? "view less" : "view more",
              style: SharedViews.getTextStyle(TStyle.B2_400,
                  customStyle: TextStyle(color: AppColors.cGREEN_100)),
            ),
            Icon(
              showMore ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              color: AppColors.cGREEN_100,
              size: 12,
            )
          ],
        ),
      ),
    );
  }

  Widget buildList() {
    if (widget.limit == -1) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          widget.section.upcomingClasses?.length ?? 0,
              (index) => widget.getChild(index, widget.section),
        ),
      );
    } else {
      if ((widget.section.upcomingClasses?.length ?? 0) <= widget.limit) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            widget.section.upcomingClasses?.length ?? 0,
                (index) => widget.getChild(index, widget.section),
          ),
        );
      } else {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            showMore
                ? widget.section.upcomingClasses?.length ?? 0
                : widget.limit,
                (index) {
              return widget.getChild(index, widget.section);
            },
          )..add(viewMoreButton()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return buildList();
  }
}
