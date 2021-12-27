import 'package:flutter/material.dart';
import 'package:yc_app/blocs/homepage_bloc.dart';
import 'package:yc_app/shared/widgets/buttons/buttons.dart';
import 'package:yc_app/utils/spacing.dart';
import 'package:yc_app/modules/home/pre_login/components/pre_login_dashboard_widgets.dart';
import 'mentor_horizontal_list.dart';

Widget featuredMentors() {
  return Column(
    children: [
      sectionHeading(text: 'Learn from Top Mentors'),
      MentorHorizontalList(
        mentors: homePageBloc.preLoginHomepageData.getFeaturedMentors,
        eventCategory: 'home',
        eventLabel: 'learn_from_top_mentors',
      ),
      buttonOutlinedSmall(
        'View More',
        width: 110,
        // onPressed: () {
        //   PreLoginDashboardEvents.topMentorsViewMoreClick();
        //   navigation.push(
        //     MaterialPageRoute(
        //       settings: RouteSettings(
        //         name: Routes.mentorListing,
        //       ),
        //       builder: (_) => MentorListingEntry(),
        //     ),
        //   );
        // },
      ),
      SizedBox(
        height: AppSpacing.m,
      )
    ],
  );
}
