import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:yc_app/utils/query/video_quality_query.dart';

import 'package:yc_app/shared/models/api_state.model.dart';
import 'package:yc_app/shared/services/api_handler_service.dart';

class VideoQualityApiProvider {
  Future<ApiState> getAvailableVideoQualities({
    List<String>? excludeParams,
  }) async {
    QueryResult result = await ApiHandler.query(
      QueryOptions(
        document: gql(videoQualityQuery.getAvailableVideoQualities),
      ),
    );
    if (!result.hasException) {
      return ApiState.success(result.data!['getAvailableVideoQualities']);
    } else {
      return ApiState.error(result.exception);
    }
  }
}
