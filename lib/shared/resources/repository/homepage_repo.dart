import 'package:yc_app/shared/models/api_state.model.dart';
import 'package:yc_app/shared/models/content_dashboard.model.dart';
import 'package:yc_app/shared/models/homepage/viewer_count_polling.model.dart';
import 'package:yc_app/shared/resources/api_provider/homepage_provider.dart';

class HomePageRepository {
  final homepageProvider = HomePageApiProvider();

  Future<ApiState> getViewerCount(
          ViewerCountPollingRequest viewerCountPollingRequest) =>
      homepageProvider.getViewerCount(viewerCountPollingRequest);

  Future<ApiState> getPreLoginHomePageData() =>
      homepageProvider.getPreLoginHomePageData();

  Future<ApiState> getDashboardData() => homepageProvider.getDashboardData();

  Future<void> contentDashboardClick({
    required RecommendedClassesClickInputModel input,
  }) =>
      homepageProvider.contentDashboardClick(input: input);

  Future<ApiState> getContentDashboardData({
    int? page,
    String? recommendedClassesListingId,
    String? anonymousUserId,
    String? anonymousProfileId,
    int? min,
    int? max,
  }) =>
      homepageProvider.getContentDashboardData(
        min: min,
        max: max,
        page: page,
        recommendedClassesListingId: recommendedClassesListingId,
        anonymousUserId: anonymousUserId,
        anonymousProfileId: anonymousProfileId,
      );

  Future<ApiState> getClassList(
          String? classType, String? titleKey, String? programType) =>
      homepageProvider.getClassList(classType, titleKey, programType);

  Future<ApiState> getAgeRange() => homepageProvider.getAgeRange();
}

final homePageRepository = HomePageRepository();
