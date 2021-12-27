import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:yc_app/utils/common_helpers.dart';
import 'package:yc_app/utils/query/auth.query.dart';

import 'package:yc_app/shared/models/api_state.model.dart';
import 'package:yc_app/shared/services/api_handler_service.dart';
import 'package:yc_app/shared/models/create_anonymous_user_response.model.dart';

class AuthApiProvider {
  Future<ApiState> createAnonymousUser() async {
    QueryResult result = await ApiHandler.mutate(
      MutationOptions(
        operationName: "createAnonymousUser",
        document: gql(authQuery.createAnonymousUser),
      ),
    );
    if (!result.hasException) {
      return ApiState.success(CreateAnonymousResponse.fromMap(result.data!));
    } else {
      return ApiState.error(result.exception);
    }
  }
}
AuthApiProvider apiProvider = AuthApiProvider();