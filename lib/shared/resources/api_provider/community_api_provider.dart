import 'dart:async';
import 'dart:convert';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;

import 'package:yc_app/utils/common_helpers.dart';
import 'package:yc_app/utils/query/post_query.dart';

import 'package:yc_app/shared/models/likes_list.model.dart';
import 'package:yc_app/shared/models/community/delete_post_input.model.dart';
import 'package:yc_app/shared/models/community/get_post_input.model.dart';
import 'package:yc_app/shared/models/community/get_post_response.dart';
import 'package:yc_app/shared/models/api_state.model.dart';
import 'package:yc_app/shared/models/community/feeds_input.model.dart';
import 'package:yc_app/shared/models/community/get_feeds_response.model.dart';
import 'package:yc_app/shared/models/community/get_my_posts_response.model.dart';
import 'package:yc_app/shared/models/community/my_posts_input.model.dart';
import 'package:yc_app/shared/models/community/recent_class_input.model.dart';
import 'package:yc_app/shared/models/community/like_post_input.model.dart';
import 'package:yc_app/shared/models/community/post.model.dart';
import 'package:yc_app/shared/models/community/post_input.model.dart';
import 'package:yc_app/shared/models/community/report_post_input.model.dart';
import 'package:yc_app/shared/models/community/standard_response.model.dart';
import 'package:yc_app/shared/models/community/post_timespent.model.dart';
import 'package:yc_app/shared/services/api_handler_service.dart';

class CommunityApiProvider {
  Future<ApiState> getPost({required GetPostInput getPostInput}) async {
    QueryResult result = await ApiHandler.query(
      QueryOptions(
          fetchPolicy: FetchPolicy.noCache,
          operationName: "getPostQuery",
          document: gql(postQuery.getPost),
          variables: getPostInput.toJson()),
    );
    if (!result.hasException) {
      return ApiState.success(GetPostResponse.fromJson(result.data!));
    } else {
      return ApiState.error(result.exception);
    }
  }

  Future<ApiState> getFeeds({required FeedsInput feedsInput}) async {
    final _feedReq = feedsInput.toJson();
    QueryResult result = await ApiHandler.query(
      QueryOptions(
          fetchPolicy: FetchPolicy.noCache,
          operationName: "getFeedsQuery",
          document: gql(postQuery.getFeeds),
          variables: _feedReq),
    );
    if (!result.hasException) {
      return ApiState.success(GetFeedsResponse.fromJson(result.data!));
    } else {
      return ApiState.error(result.exception);
    }
  }

  Future<ApiState> getMyPosts({required MyPostsInput myPostsInput}) async {
    QueryResult result = await ApiHandler.query(
      QueryOptions(
          fetchPolicy: FetchPolicy.cacheAndNetwork,
          operationName: "getMyPostsQuery",
          document: gql(postQuery.getMyPosts),
          variables: myPostsInput.toJson()),
    );
    if (!result.hasException) {
      return ApiState.success(GetMyPostsResponse.fromJson(result.data!));
    } else {
      return ApiState.error(result.exception);
    }
  }

  Future<ApiState> likePost({
    required LikePostInput likePostInput,
  }) async {
    QueryResult result = await ApiHandler.mutate(
      MutationOptions(
        operationName: "likePostMutation",
        document: gql(postQuery.likePost),
        variables: likePostInput.toJson(),
      ),
    );
    if (!result.hasException) {
      return ApiState.success(StandardResponse.fromJson(result.data!));
    } else {
      return ApiState.error(result.exception);
    }
  }

  Future<ApiState> likesList({
    required LikesListRequest likesListRequest,
  }) async {
    QueryResult result = await ApiHandler.mutate(
      MutationOptions(
        document: gql(postQuery.listOfLikes),
        variables: CommonHelpers.removeNullParams(likesListRequest.toMap())!,
      ),
    );
    if (!result.hasException) {
      return ApiState.success(LikesListResponse.fromMap(result.data!));
    } else {
      return ApiState.error(result.exception);
    }
  }

}
