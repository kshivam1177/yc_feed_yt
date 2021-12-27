import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';

import 'package:yc_app/utils/colors.dart';

import 'package:yc_app/shared/views/shared_views.dart';
import 'package:yc_app/utils/spacing.dart';

Widget buildClassShimmerEffect(BuildContext context) {
  return Shimmer.fromColors(
    baseColor: AppColors.cBLACK_10,
    highlightColor: AppColors.cWHITE_100,
    child: Column(
      children: [
        Container(
          width: SharedViews.getScreenWidth(),
          height: 180,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black54, Colors.transparent],
              begin: const FractionalOffset(0.5, 1.0),
              end: const FractionalOffset(0.5, 0.33),
              tileMode: TileMode.clamp,
            ),
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 121,
                      height: 11,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 7),
                    Container(
                      width: MediaQuery.of(context).size.width - 240,
                      height: 11,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 7),
                    Container(
                      width: 80,
                      height: 11,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                    ),
                  ],
                )
              ]),
        ),
      ],
    ),
  );
}

Widget buildProgramDetailsShimmerEffect(BuildContext context) {
  return Shimmer.fromColors(
    baseColor: AppColors.cBLACK_10,
    highlightColor: AppColors.cWHITE_100,
    child: SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: SharedViews.screenWidth,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                  color: AppColors.cBLACK_40,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: SharedViews.screenWidth! - 50,
                  height: 360,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    color: AppColors.cBLACK_40,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 121,
                        height: 11,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 7),
                      Container(
                        width: MediaQuery.of(context).size.width - 240,
                        height: 11,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                    ],
                  )
                ]),
          ),
        ],
      ),
    ),
  );
}

Widget buildMentorDetailsShimmerEffect(BuildContext context) {
  return Shimmer.fromColors(
    baseColor: AppColors.cBLACK_10,
    highlightColor: AppColors.cWHITE_100,
    child: Column(
      children: [
        Center(
          child: Container(
            width: SharedViews.getScreenWidth() - 30,
            height: SharedViews.getScreenWidth() + 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20.0),
                bottomLeft: Radius.circular(20.0),
              ),
              gradient: LinearGradient(
                colors: [Colors.black54, Colors.transparent],
                begin: const FractionalOffset(0.5, 1.0),
                end: const FractionalOffset(0.5, 0.33),
                tileMode: TileMode.clamp,
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 121,
                      height: 11,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 7),
                    Container(
                      width: MediaQuery.of(context).size.width - 240,
                      height: 11,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 7),
                    Container(
                      width: 80,
                      height: 11,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                    ),
                  ],
                )
              ]),
        ),
      ],
    ),
  );
}

Widget buildProgramShimmerEffect(BuildContext context) {
  return Shimmer.fromColors(
    baseColor: AppColors.cBLACK_10,
    highlightColor: AppColors.cWHITE_100,
    child: Column(
      children: [
        Container(
          width: SharedViews.getScreenWidth(),
          height: SharedViews.getScreenWidth(),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20.0),
              bottomLeft: Radius.circular(20.0),
            ),
            gradient: LinearGradient(
              colors: [Colors.black54, Colors.transparent],
              begin: const FractionalOffset(0.5, 1.0),
              end: const FractionalOffset(0.5, 0.33),
              tileMode: TileMode.clamp,
            ),
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 121,
                      height: 11,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 7),
                    Container(
                      width: MediaQuery.of(context).size.width - 240,
                      height: 11,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 7),
                    Container(
                      width: 80,
                      height: 11,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                    ),
                  ],
                )
              ]),
        ),
      ],
    ),
  );
}

Widget buildSkillsShimmerEffect(BuildContext context) {
  return Shimmer.fromColors(
    baseColor: AppColors.cBLACK_10,
    highlightColor: AppColors.cWHITE_100,
    child: Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.cBLACK_10,
      ),
    ),
  );
}

Widget notificationsShimmer(BuildContext context) {
  return Shimmer.fromColors(
    baseColor: AppColors.cBLACK_10,
    highlightColor: AppColors.cWHITE_100,
    child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Container(
              width: 120,
              height: 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
                color: AppColors.cBLACK_05,
              ),
            ),
            SizedBox(height: 10),
            Column(
              children: List.generate(
                6,
                (index) {
                  return Column(
                    children: [
                      Container(
                        width: SharedViews.getScreenWidth() - 40,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                          color: AppColors.cBLACK_05,
                        ),
                      ),
                      SizedBox(height: 10)
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget buildProfileShimmerEffect(BuildContext context) {
  return Shimmer.fromColors(
    baseColor: AppColors.cBLACK_10,
    highlightColor: AppColors.cWHITE_100,
    child: SingleChildScrollView(
      child: Column(
        children: [
          AppSpacing.xxl3Height,
          Container(
            height: SharedViews.getIsTablet()
                ? SharedViews.getScreenWidth() / 5.5
                : SharedViews.getScreenWidth() / 3.5,
            width: SharedViews.getIsTablet()
                ? SharedViews.getScreenWidth() / 5.5
                : SharedViews.getScreenWidth() / 3.5,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.cBLACK_10,
            ),
          ),
          SizedBox(height: 35),
          Container(
            width: MediaQuery.of(context).size.width - 240,
            height: 11,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(
                Radius.circular(5.0),
              ),
            ),
          ),
          SizedBox(height: 7),
          Container(
            width: 80,
            height: 11,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(
                Radius.circular(5.0),
              ),
            ),
          ),
          SizedBox(height: 5),
          Container(
            width: 80,
            height: 11,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(
                Radius.circular(5.0),
              ),
            ),
          ),
          SizedBox(height: 35),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 121,
                      height: 11,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 7),
                    Container(
                      width: MediaQuery.of(context).size.width - 240,
                      height: 11,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.symmetric(horizontal: AppSpacing.m),
            child: GridView.builder(
              itemCount: 10,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: AppSpacing.xs,
                mainAxisSpacing: AppSpacing.xs,
                childAspectRatio: 160 / 57,
              ),
              itemBuilder: (
                context,
                index,
              ) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: AppColors.cBLACK_05,
                    border: Border.all(
                      color: AppColors.cBLACK_05,
                    ),
                  ),
                );
              },
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
            ),
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
                gradient: LinearGradient(
                  colors: [Colors.black54, Colors.transparent],
                  begin: const FractionalOffset(0.5, 1.0),
                  end: const FractionalOffset(0.5, 0.33),
                  tileMode: TileMode.clamp,
                ),
              ),
              width: 100,
              height: 30,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buildFaqShimmerEffect(BuildContext context) {
  return Shimmer.fromColors(
    baseColor: AppColors.cBLACK_10,
    highlightColor: AppColors.cWHITE_100,
    child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 35),
          Container(
            width: MediaQuery.of(context).size.width - 240,
            height: 11,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(
                Radius.circular(5.0),
              ),
            ),
          ),
          SizedBox(height: 7),
          Container(
            width: 80,
            height: 11,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(
                Radius.circular(5.0),
              ),
            ),
          ),
          SizedBox(height: 5),
          Container(
            width: 80,
            height: 11,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(
                Radius.circular(5.0),
              ),
            ),
          ),
          SizedBox(height: 35),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 121,
                        height: 11,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 7),
                      Container(
                        width: MediaQuery.of(context).size.width - 240,
                        height: 11,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Column(
                        children: List.generate(
                          5,
                          (index) {
                            return Column(
                              children: [
                                Container(
                                  width: SharedViews.getScreenWidth() - 40,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5.0),
                                    ),
                                    color: AppColors.cBLACK_05,
                                  ),
                                ),
                                SizedBox(height: 10)
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  )
                ]),
          ),
          SizedBox(height: 10),
          Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
                gradient: LinearGradient(
                  colors: [Colors.black54, Colors.transparent],
                  begin: const FractionalOffset(0.5, 1.0),
                  end: const FractionalOffset(0.5, 0.33),
                  tileMode: TileMode.clamp,
                ),
              ),
              width: 100,
              height: 30,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buildSelectProfileShimmerEffect(BuildContext context) {
  return Shimmer.fromColors(
    baseColor: AppColors.cBLACK_10,
    highlightColor: AppColors.cWHITE_100,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 8, 0),
          child: Container(
            width: MediaQuery.of(context).size.width - 240,
            height: 20,
            decoration: BoxDecoration(
              color: AppColors.cBLACK_05,
              borderRadius: BorderRadius.all(
                Radius.circular(15.0),
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
        Container(
          width: double.infinity,
          child: Center(
            child: Column(
              children: List.generate(
                2,
                (index) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                          2,
                          (index) {
                            return Column(
                              children: [
                                Container(
                                  width: SharedViews.getScreenWidth() / 3,
                                  height: SharedViews.getScreenWidth() / 3,
                                  decoration: BoxDecoration(
                                    color: AppColors.cBLACK_05,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  width: SharedViews.getScreenWidth() / 4,
                                  height: 32,
                                  decoration: BoxDecoration(
                                    color: AppColors.cBLACK_05,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                )
                              ],
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 20)
                    ],
                  );
                },
              ),
            ),
          ),
        )
      ],
    ),
  );
}

Widget buildExploreShimmerEffect(BuildContext context) {
  return SingleChildScrollView(
    child: SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 25, 8, 0),
        child: Shimmer.fromColors(
          baseColor: AppColors.cBLACK_10,
          highlightColor: AppColors.cWHITE_100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 5),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 121,
                    height: 11,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 7),
                  Container(
                    width: MediaQuery.of(context).size.width - 240,
                    height: 11,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  children: [
                    Container(
                      height: 240,
                      width: SharedViews.screenWidth! / 2.5,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                    ),
                    SizedBox(width: 30),
                    Container(
                      height: 240,
                      width: SharedViews.screenWidth! / 2.5,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 121,
                    height: 11,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 7),
                  Container(
                    width: MediaQuery.of(context).size.width - 240,
                    height: 11,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Container(
                      height: 200,
                      width: SharedViews.screenWidth! / 1.5,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget buildDashboardShimmerEffect(BuildContext context) {
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
      child: Shimmer.fromColors(
        baseColor: AppColors.cBLACK_10,
        highlightColor: AppColors.cWHITE_100,
        child: Column(
          children: [
            AppSpacing.lHeight,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.l),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.cBLACK_10,
                  borderRadius: BorderRadius.circular(AppSpacing.xxs),
                ),
                height: AppSpacing.l,
              ),
            ),
            AppSpacing.mHeight,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.xl),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.cBLACK_10,
                  borderRadius: BorderRadius.circular(AppSpacing.xxs),
                ),
                height: AppSpacing.m,
              ),
            ),
            AppSpacing.xxlHeight,
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Container(
                color: AppColors.cBLACK_10,
                width: SharedViews.getIsTablet()
                    ? 0.9 * MediaQuery.of(context).size.width - 8
                    : 0.9 * SharedViews.getScreenWidth() - 8,
                height: SharedViews.getIsTablet()
                    ? ((0.9 * MediaQuery.of(context).size.width - 8) * 1.8) / 5
                    : (0.9 * SharedViews.getScreenWidth() - 8) * 3 / 5,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: SharedViews.getIsTablet()
                        ? MediaQuery.of(context).size.width
                        : SharedViews.getScreenWidth(),
                    height: 80,
                    decoration: BoxDecoration(
                      color: AppColors.cBLACK_40,
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 121,
                      height: 11,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 7),
                    Container(
                      width: MediaQuery.of(context).size.width - 240,
                      height: 11,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    2,
                    (index) {
                      return Column(
                        children: [
                          Container(
                            height: 180,
                            padding: const EdgeInsets.only(left: 8),
                            child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    height: 180,
                                    width: SharedViews.screenWidth! / 1.5,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5.0),
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return SizedBox(width: AppSpacing.m);
                                },
                                itemCount: 2),
                          ),
                          SizedBox(height: 50)
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Padding buildFeedShimmerEffect(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Shimmer.fromColors(
      baseColor: AppColors.cBLACK_10,
      highlightColor: AppColors.cWHITE_100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 13),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.black,
                      child: Container(),
                    ),
                    SizedBox(width: 12),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 121,
                          height: 11,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 7),
                        Container(
                          width: MediaQuery.of(context).size.width - 240,
                          height: 11,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.0),
                            ),
                          ),
                        ),
                      ],
                    )
                  ]),
              Icon(
                Icons.more_vert,
              )
            ],
          ),
          SizedBox(height: 12),
          Container(
            height: 480,
            color: Colors.black,
          ),
          Row(children: [
            Icon(Icons.favorite_outline),
            SizedBox(width: 2),
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              width: 20,
              height: 11,
            )
          ])
        ],
      ),
    ),
  );
}

Padding buildCollectibleTxnShimmerEffect(BuildContext context) {
  final mQuery = MediaQuery.of(context).size;
  Widget txnTile = Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      ListTile(
        leading: Container(
          width: 42,
          height: 42,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: AppColors.cBODY_TEXT),
        ),
        trailing: Container(
          width: 60,
          height: 20,
          color: AppColors.cBLACK_40,
        ),
        title: Container(
          width: 120,
          height: 20,
          color: AppColors.cBODY_TEXT,
        ),
      ),
      Divider(
        indent: 74,
        color: AppColors.cBLACK_10,
        endIndent: 16,
        thickness: 1.5,
      ),
    ],
  );
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Shimmer.fromColors(
      baseColor: AppColors.cBLACK_10,
      highlightColor: AppColors.cWHITE_100,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  margin:
                      EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                  color: Colors.black,
                  height: 275,
                  width: mQuery.width),
              txnTile,
              txnTile,
              txnTile,
              txnTile,
              txnTile
            ],
          ),
        ),
      ),
    ),
  );
}

Widget buildCertificateShimmerEffect(BuildContext context) {
  return Column(
    children: [
      Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.cBLACK_05,
              borderRadius: BorderRadius.all(
                Radius.circular(4.0),
              ),
            ),
            width: 88,
            height: 64,
          ),
        ),
        SizedBox(width: 12),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: SharedViews.getScreenWidth(divideBy: 2.5),
              height: 11,
              decoration: BoxDecoration(
                color: AppColors.cBLACK_05,
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
            ),
            SizedBox(height: 7),
            Container(
              width: SharedViews.getScreenWidth(divideBy: 2),
              height: 11,
              decoration: BoxDecoration(
                color: AppColors.cBLACK_05,
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
            ),
          ],
        )
      ]),
      SizedBox(height: 12),
    ],
  );
}

Widget buildMoreShimmerEffect(BuildContext context) {
  return Shimmer.fromColors(
    baseColor: AppColors.cBLACK_10,
    highlightColor: AppColors.cWHITE_100,
    child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 35),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 121,
                        height: 11,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 7),
                      Container(
                        width: MediaQuery.of(context).size.width - 240,
                        height: 11,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Column(
                        children: List.generate(
                          5,
                          (index) {
                            return Column(
                              children: [
                                Container(
                                  width: SharedViews.getScreenWidth() - 40,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5.0),
                                    ),
                                    color: AppColors.cBLACK_05,
                                  ),
                                ),
                                SizedBox(height: 10)
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  )
                ]),
          ),
          SizedBox(height: 10),
          Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
                gradient: LinearGradient(
                  colors: [Colors.black54, Colors.transparent],
                  begin: const FractionalOffset(0.5, 1.0),
                  end: const FractionalOffset(0.5, 0.33),
                  tileMode: TileMode.clamp,
                ),
              ),
              width: 100,
              height: 30,
            ),
          ),
        ],
      ),
    ),
  );
}
