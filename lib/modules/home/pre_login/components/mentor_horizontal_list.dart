import 'package:flutter/material.dart';
import 'package:yc_app/shared/views/shared_views.dart';
import 'package:yc_app/shared/widgets/other_components/likes_count_icon.dart';
import 'package:yc_app/shared/widgets/other_components/scaled_image.dart';
import 'package:yc_app/utils/colors.dart';
import 'package:yc_app/utils/spacing.dart';

class MentorHorizontalList extends StatefulWidget {
  final String? widgetName;
  final List<dynamic>? mentors;
  final String? eventCategory;
  final String? eventLabel;

  MentorHorizontalList({
    Key? key,
    this.widgetName,
    this.mentors,
    this.eventCategory,
    this.eventLabel,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MentorHorizontalListState();
  }
}

class _MentorHorizontalListState extends State<MentorHorizontalList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = SharedViews.getScreenWidth();
    List<Widget> scrolls = List<Widget>.generate(
      widget.mentors!.length,
      (int index) => buildMentorCard(
        context: context,
        screenWidth: screenWidth,
        mentorData: widget.mentors![index],
        eventCategory: widget.eventCategory,
        eventLabel: widget.eventLabel,
      ),
    );

    return Container(
      padding: EdgeInsets.only(left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          widget.widgetName == null
              ? SizedBox()
              : Text(
                  widget.widgetName!,
                  style: SharedViews.getTextStyle(TStyle.H5_700),
                ),
          SizedBox(
            height: 16.0,
          ),
          Container(
            height: 260,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: scrolls.length,
              itemBuilder: (BuildContext context, i) {
                return Row(
                  children: [
                    scrolls[i],
                    SizedBox(
                      width: 10.0,
                    )
                  ],
                );
              },
            ),
          ),
          SizedBox(height: AppSpacing.l)
        ],
      ),
    );
  }
}

Widget buildMentorCard({
  BuildContext? context,
  double? screenWidth,
  required dynamic mentorData,
  String? eventCategory,
  String? eventLabel,
}) {
  double cardWidth = 180;
  double cardHeight = 258;
  // String skills = "";
  // for (var i = 0; i < mentorData.skillDetails.length; i++) {
  //   skills = skills + mentorData.skillDetails[i].title + ", ";
  // }
  // skills = skills.length >= 2 ? skills.substring(0, skills.length - 2) : skills;
  return InkWell(
    onTap: () {
      // MentorEvents.mentorCardClick(
      //   category: eventCategory,
      //   mentorId: mentorData.id,
      //   label: eventLabel,
      // );
      // Navigator.push(
      //   context!,
      //   MaterialPageRoute(
      //     settings: const RouteSettings(name: Routes.mentorDetails),
      //     builder: (_) => MentorDetailsEntry(
      //       MentorDetailsRequest(mentorId: mentorData.id),
      //     ),
      //   ),
      // );
    },
    child: Container(
      width: cardWidth,
      height: cardHeight,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        elevation: 2.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  child: scaledImageWithShimmer(
                      width: cardWidth,
                      aspectRatio: 178 / 146,
                      imageUrl: mentorData.profilePic.url),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0)),
                ),
                // (mentorData?.isMyMentor != null && mentorData.isMyMentor)
                //     ? buildTextTagFilled("My mentor")
                //     : (mentorData.isFeatured != null && mentorData.isFeatured)
                //     ? buildTextTagFilled("Featured")
                //     : Container(),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    height: 20.0,
                    //width: 64,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.fromLTRB(8, 2, 8, 2),
                    decoration: BoxDecoration(
                      color: AppColors.cWHITE_100,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: likesCountAndIcon(
                      mentorData.upvotesCount ?? 0,
                      AppColors.cGREEN_100,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.fromLTRB(16, 12, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mentorData.fullName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: SharedViews.getTextStyle(TStyle.B1_700),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      "skills",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: SharedViews.getTextStyle(
                        TStyle.B2_600,
                        customStyle: TextStyle(color: AppColors.cBODY_TEXT_50),
                      ),
                    ),
                  ),
                  Text(
                    mentorData.tagline != null ? mentorData.tagline : "",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: SharedViews.getTextStyle(
                      TStyle.B2_600,
                      customStyle: TextStyle(color: AppColors.cBODY_TEXT),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
