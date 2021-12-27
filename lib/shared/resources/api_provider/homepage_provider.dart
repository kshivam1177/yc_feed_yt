import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:yc_app/shared/models/content_dashboard.model.dart';
import 'package:yc_app/shared/models/get_class_list.model.dar.dart';
import 'package:yc_app/shared/models/home_banner.dart';
import 'package:yc_app/shared/models/homepage/dashboard_response.model.dart';
import 'package:yc_app/shared/models/homepage/viewer_count_polling.model.dart';
import 'package:yc_app/utils/common_helpers.dart';
import 'package:yc_app/utils/query/homepage_query.dart';
import 'package:yc_app/shared/models/api_state.model.dart';
import 'package:yc_app/shared/models/homepage/pre_login_homepage.model.dart';
import 'package:yc_app/shared/services/api_handler_service.dart';

class HomePageApiProvider {
  Future<ApiState> getHomePageDataV2() async {
    QueryResult result = await ApiHandler.query(
      QueryOptions(
          //operationName: "getNotificationsBellStatus",
          fetchPolicy: FetchPolicy.noCache,
          document: gql(homePageQuery.v2getHomePageDataWithBellStatus)
          // CommonHelpers.isUserLoggedIn()
          //   ? gql(homePageQuery.v2getHomePageDataWithBellStatus)
          //   : gql(homePageQuery.v2getHomePageData),
          ),
    );
    if (!result.hasException) {
      return ApiState.success(HomePageDataV2.fromMap(result.data!));
    } else {
      return ApiState.error(result.exception);
    }
  }

  Future<ApiState> getViewerCount(
      ViewerCountPollingRequest viewerCountPollingRequest) async {
    QueryResult result = await ApiHandler.query(
      QueryOptions(
        fetchPolicy: FetchPolicy.noCache,
        document: gql(homePageQuery.getViewerCount),
        variables: viewerCountPollingRequest.toMap(),
      ),
    );
    if (!result.hasException) {
      return ApiState.success(ViewerCountPollingResponse.fromMap(result.data!));
    } else {
      return ApiState.error(result.exception);
    }
  }

  Future<ApiState> getPreLoginHomePageData() async {
    QueryResult result = await ApiHandler.query(
      QueryOptions(
        fetchPolicy: FetchPolicy.noCache,
        document: gql(homePageQuery.preLoginHomePageQuery),
      ),
    );
    if (!result.hasException) {
      return ApiState.success(PreLoginHomepageResponse.fromJson(result.data!));
    } else {
      return ApiState.error(result.exception);
    }
  }

  Future<ApiState> getDashboardData() async {
    QueryResult result = await ApiHandler.query(
      QueryOptions(
        fetchPolicy: FetchPolicy.noCache,
        document: gql(homePageQuery.dashboardQuery),
      ),
    );
    if (!result.hasException) {
      return ApiState.success(DashboardResponse.fromJson(result.data!));
    } else {
      return ApiState.error(result.exception);
    }
  }

  Future<ApiState> getContentDashboardData({
    int? min,
    int? max,
    int? page,
    String? recommendedClassesListingId,
    String? anonymousUserId,
    String? anonymousProfileId,
  }) async {
    QueryResult result = await ApiHandler.query(
      QueryOptions(
        fetchPolicy: FetchPolicy.noCache,
        document: gql(homePageQuery.contentDashboard),
        variables: CommonHelpers.removeNullParams({
              "page": page,
              "recommendedClassesListingId": recommendedClassesListingId,
              "anonymousUserId": anonymousUserId,
              "anonymousProfileId": anonymousProfileId,
              "userAgePreference": {"min": min, "max": max}
            }) ??
            {},
      ),
    );
    if (!result.hasException) {
      return ApiState.success(
          RecommendedClassesListingPageDataModel.fromJson(result.data!));
    } else {
      return ApiState.error(result.exception);
    }
  }

  Future<void> contentDashboardClick({
    required RecommendedClassesClickInputModel input,
  }) async {
    QueryResult result = await ApiHandler.query(
      QueryOptions(
        fetchPolicy: FetchPolicy.noCache,
        document: gql(homePageQuery.contentDashboardClickQuery),
        variables: CommonHelpers.removeNullParams(input.toJson()) ?? {},
      ),
    );
    if (!result.hasException) {
      return;
    } else {
      return;
    }
  }

  Future<ApiState> getClassList(
      String? classType, String? titleKey, String? programType) async {
    QueryResult result = await ApiHandler.query(
      QueryOptions(
          fetchPolicy: FetchPolicy.noCache,
          operationName: "getClassListQuery",
          document: gql(homePageQuery.getClassList),
          variables: {
            'classType': classType,
            'titleKey': titleKey,
            'programType': programType
          }),
    );
    if (!result.hasException) {
      return ApiState.success(GetClassList.fromJson(result.data!));
    } else {
      return ApiState.error(result.exception);
    }
  }

  Future<ApiState> getAgeRange() async {
    QueryResult result = await ApiHandler.query(
      QueryOptions(
        fetchPolicy: FetchPolicy.noCache,
        document: gql(homePageQuery.ageRange),
      ),
    );
    if (!result.hasException) {
      return ApiState.success(AvailableAgeRangesModel.fromJson(result.data!));
    } else {
      return ApiState.error(result.exception);
    }
  }

  Future<ApiState> getHomePageBanner() async {
    QueryResult result = await ApiHandler.query(
      QueryOptions(
        fetchPolicy: FetchPolicy.noCache,
        document: gql(homePageQuery.v1getHomePageBanner),
      ),
    );
    if (!result.hasException) {
      return ApiState.success(Banner.fromJson(result.data!));
    } else {
      return ApiState.error(result.exception);
    }
  }
}
