import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:yc_app/blocs/splash_bloc.dart';
import 'package:yc_app/shared/models/content_dashboard.model.dart';
import 'package:yc_app/shared/resources/repository/homepage_repo.dart';

import 'package:yc_app/utils/common_helpers.dart';

import 'package:yc_app/shared/models/api_state.model.dart';
import 'package:yc_app/shared/models/homepage/dashboard_response.model.dart';
import 'package:yc_app/shared/services/shared_preferences_service.dart';
import 'package:yc_app/shared/models/homepage/get_homepage_response.model.dart';
import 'package:yc_app/shared/models/homepage/pre_login_homepage.model.dart';
import 'package:yc_app/shared/models/homepage/viewer_count_polling.model.dart';
import 'package:yc_app/blocs/base_bloc.dart';

class HomePageBloc implements BaseBloc {
  int page = 1;

  String? recommendedClassesListingId;
  bool shouldShowAgeRangePopup = true;
  List<ContentDashSection> contentDashboardSections = [];
  RecommendedClassesListingPageDataModel? contentResponse;
  BehaviorSubject<bool> loadingController = BehaviorSubject<bool>.seeded(true);
  StreamController<bool> viewerCountController =
      StreamController<bool>.broadcast();
  BehaviorSubject<bool> contentLoadingController = BehaviorSubject<bool>();
  BehaviorSubject<bool> ageRangeLoadingController = BehaviorSubject<bool>();
  GetHomePageResponse? getHomePageResponse;
  late PreLoginHomepageResponse preLoginHomepageData;

  bool openedWithFragmentLink = false;
  String? fragment;

  bool? bellStatus;
  Timer? viewerCountUpdateTimer;

  Future<void> getUpdatedViewerCount(
      List<HomePageSection2>? data, String headerKey) async {
    if (data == null) {
      return;
    }
    List<String?> ids = <String?>[];
    List<GetViewerCount>? response;
    HomePageSection2 homePageSection2 = data.firstWhere(
      (HomePageSection2 element) => element.headerKey == headerKey,
      orElse: () => HomePageSection2(),
    );
    if (homePageSection2.cards == null || homePageSection2.cards!.isEmpty) {
      return;
    }
    for (int j = 0; j < homePageSection2.cards!.length; j++) {
      ids.add(homePageSection2.cards![j].id);
    }
    if (homePageSection2 == null) {
      return;
    }
    ApiState<dynamic> state = await homePageRepository
        .getViewerCount(ViewerCountPollingRequest(ids: ids));
    if (state is SuccessState) {
      response = state.value.getViewerCount;
      Map<String?, String?> map = Map<String?, String?>();
      response!.forEach((GetViewerCount element) {
        map[element.id] = element.viewerCount;
      });
      for (int j = 0; j < homePageSection2.cards!.length; j++) {
        String? id = homePageSection2.cards![j].id;
        if (map[id] != null) {
          homePageSection2.cards![j].viewerCount = map[id]!;
        }
      }
    } else if (state is ErrorState) {}
    viewerCountController.sink.add(true);
  }

  Future<void> getContentDashboardData() async {
    if (contentLoadingController.hasValue &&
        contentLoadingController.valueWrapper?.value == true) {
      return;
    }
    contentLoadingController.add(true);
    if (!sharedPreferenceService.containsAnonymousUserData) {
      await SplashBloc().getAnonymousUser();
    }
    ApiState<dynamic> state = await homePageRepository.getContentDashboardData(
        anonymousUserId: sharedPreferenceService.anonymousUserData.userId,
        anonymousProfileId: sharedPreferenceService.anonymousUserData.profileId,
        page: page,
        min: 1,
        max: 16,
        recommendedClassesListingId: recommendedClassesListingId);
    if (state is SuccessState) {
      contentResponse = state.value;
      if (contentDashboardSections.isNotEmpty) {
        contentDashboardSections
            .addAll(contentResponse?.v1GetMyPageData?.sections ?? []);
      } else {
        contentDashboardSections =
            contentResponse?.v1GetMyPageData?.sections ?? [];
      }

      page += 1;
      recommendedClassesListingId =
          contentResponse?.v1GetMyPageData?.recommendedClassesListingId;
      contentLoadingController.add(false);
    } else if (state is ErrorState) {
      contentLoadingController.addError(state.error);
    }
  }

  Future<void> contentDashboardClick({
    required ClassCard card,
    int? rank,
  }) async {
    await homePageRepository.contentDashboardClick(
      input: RecommendedClassesClickInputModel(
        clickInput: ClickInput(
          recommendedClassesListingId: recommendedClassesListingId,
          rank: rank,
          classDetails: ClassDetailsInput(
            entityId: card.entityId,
            entityType: card.entityType,
            score: card.score,
            programContinuity: card.programContinuityType,
            programType: card.programType,
            batchToClasses: [],
            classNum: card.classNum,
          ),
        ),
      ),
    );
  }

  Future<void> getPreLoginHomepage() async {
    viewerCountUpdateTimer?.cancel();
    // exploreBloc.viewerCountUpdateTimer?.cancel();
    loadingController.sink.add(true);
    ApiState<dynamic> state =
        await homePageRepository.getPreLoginHomePageData();
    if (state is SuccessState) {
      preLoginHomepageData = state.value;
      loadingController.sink.add(false);
      if (preLoginHomepageData.getLandingPageLiveClasses == null ||
          preLoginHomepageData.getLandingPageLiveClasses!.isEmpty) {
        return;
      } else {
        // getPreLoginLiveClassesUpdatedViewerCount();
        // viewerCountUpdateTimer = Timer.periodic(
        //   Duration(seconds: 10),
        //   (Timer timer) {
        //     getPreLoginLiveClassesUpdatedViewerCount();
        //   },
        // );
      }
    } else if (state is ErrorState) {
      loadingController.sink.addError(state.error);
    }
  }

  Future<void> getPreLoginLiveClassesUpdatedViewerCount() async {
    // if (!Routes.moduleScreensMap['home']!
    //     .contains(CustomRouteObserver.currentRoute!.settings.name)) {
    //   viewerCountUpdateTimer?.cancel();
    //   return;
    // }
    List<String?> ids = preLoginHomepageData.getLandingPageLiveClasses!
        .map((ClassCardModel e) => e.id)
        .toList();
    ApiState<dynamic> state = await homePageRepository
        .getViewerCount(ViewerCountPollingRequest(ids: ids));
    if (state is SuccessState) {
      List<GetViewerCount>? response = state.value.getViewerCount;
      response!.forEach(
        (GetViewerCount element) {
          preLoginHomepageData.getLandingPageLiveClasses!
              .firstWhere(
                  (ClassCardModel element1) => element1.id == element.id)
              .viewerCount = element.viewerCount;
        },
      );
      viewerCountController.sink.add(true);
    }
  }

  // Future<void> getAgeRange() async {
  //   // if (sharedPreferenceService.mYAgePopUpTime == 0 ||
  //   //     CommonHelpers.isUserLoggedIn() ||
  //   //     sharedPreferenceService.ageRange != null) {
  //   //   shouldShowAgeRangePopup = false;
  //   // }
  //   if (ageRangeLoadingController.valueWrapper?.value == true) {
  //     return;
  //   }
  //   if (!shouldShowAgeRangePopup) {
  //     getContentDashboardData();
  //     return;
  //   }
  //   ageRangeLoadingController.add(true);
  //   ApiState<dynamic> state = await homePageRepository.getAgeRange();
  //   if (state is SuccessState) {
  //     ageRangeLoadingController.add(false);
  //     // showAgeRangePopup(state.value?.v1GetAvailableAgeRanges ?? []);
  //   } else {
  //     ageRangeLoadingController.add(false);
  //   }
  // }

  // void getCardAction(ClassCardModel card) {
  //   Function openCardAction = () {
  //     deepLinkBloc.redirectAfterProfileSelection(
  //       url: card.href,
  //       inAppNavigation: true,
  //     );
  //   };
  //   if (card.shouldShowEnrollmentPopup != true) {
  //     openCardAction();
  //   } else {
  //     if (card.programId != null) {
  //       canEnrollPopUp(
  //         navigation.currentContext!,
  //         () {
  //           navigation.push(
  //             MaterialPageRoute(
  //               settings: RouteSettings(
  //                 name: Routes.programDetails,
  //               ),
  //               builder: (_) => ProgramDetailsEntry(
  //                 ProgramDetailsRequest(
  //                   programId: card.programId,
  //                 ),
  //               ),
  //             ),
  //           );
  //         },
  //       );
  //     } else {
  //       canEnrollPopUp(navigation.currentContext!, openCardAction);
  //     }
  //   }
  // }

  @override
  void dispose() {
    loadingController.close();
    viewerCountUpdateTimer?.cancel();
  }
}

final HomePageBloc homePageBloc = HomePageBloc();
