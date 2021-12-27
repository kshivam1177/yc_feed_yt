import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import 'package:yc_app/utils/colors.dart';

import 'package:yc_app/shared/views/shared_views.dart';
import 'package:yc_app/shared/widgets/buttons/buttons.dart';
import 'package:yc_app/shared/widgets/icon/yc_icon.dart';

Widget buildAppbarWithTabs(
    {required int bottomTabLength,
    Function? scrollToIndex,
    double? buttonWidth,
    List? tabLabels,
    TabController? tabController,
    required BehaviorSubject<int> tabsReloadController}) {
  return SliverAppBar(
    leading: BackButtonWidget(),
    leadingWidth: 46,
    centerTitle: false,
    titleSpacing: 0,
    elevation: 0.0,
    backgroundColor: AppColors.cWHITE_100,
    title: ycIcon(),
    toolbarHeight: 60.0,
    brightness: Brightness.light,
    pinned: true,
    snap: true,
    floating: true,
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(50),
      child: DefaultTabController(
        length: bottomTabLength,
        child: StreamBuilder(
          stream: tabsReloadController.stream,
          builder: (BuildContext context, snapshot) {
            return TabBar(
              controller: tabController,
              isScrollable: true,
              indicatorColor: AppColors.cGREEN_100,
              indicatorWeight: 4.0,
              onTap: (index) async {
                scrollToIndex!(index);
              },
              tabs: List.generate(
                bottomTabLength,
                (i) {
                  return Tab(
                    icon: Text(
                      tabLabels![i],
                      style: i == tabController!.index
                          ? SharedViews.getTextStyle(
                              TStyle.H5_700,
                              customStyle: TextStyle(
                                color: AppColors.cGREEN_100,
                              ),
                            )
                          : SharedViews.getTextStyle(
                              TStyle.H5_600,
                            ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    ), //: PreferredSize(child: Container(), preferredSize: Size.fromHeight(0.0)),
  );
}
