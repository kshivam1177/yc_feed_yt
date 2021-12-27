import 'package:meta/meta.dart';

import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:yc_app/utils/common_helpers.dart';
import 'package:yc_app/utils/query/user_settings.query.dart';

import 'package:yc_app/shared/models/api_state.model.dart';
import 'package:yc_app/shared/models/community/standard_response.model.dart';
import 'package:yc_app/shared/models/user/user_whatsapp_optin.model.dart';
import 'package:yc_app/shared/services/api_handler_service.dart';

class UserSettingsApiProvider {
  Future<ApiState> getWhatsAppOptIn(
      {required GetUserWaOptinStatusRequest
          getUserWaOptinStatusRequest}) async {
    QueryResult result = await ApiHandler.query(
      QueryOptions(
        operationName: "getUserWAOptinStatusQuery",
        fetchPolicy: FetchPolicy.noCache,
        document: gql(userSettings.getWAOptinStatus),
        variables: getUserWaOptinStatusRequest.toMap(),
      ),
    );
    if (!result.hasException) {
      return ApiState.success(
        WaOptinResponse.fromJson(result.data!),
      );
    } else {
      return ApiState.error(result.exception);
    }
  }

  Future<ApiState> settingsWhatsAppOptIn({
    required UserWaOptinInput userWaOptinInput,
    List<String>? excludeParams,
  }) async {
    QueryResult result = await ApiHandler.mutate(
      MutationOptions(
        operationName: "updateWAOptinMutation",
        document: gql(userSettings.whatsAppOptIn),
        variables: {
          "input": CommonHelpers.removeNullParams(
            userWaOptinInput.toJson(),
            excludeParams: excludeParams,
          ),
        },
      ),
    );
    if (!result.hasException) {
      return ApiState.success(
        StandardResponse.fromJson(result.data!["updateWAOptin"]),
      );
    } else {
      return ApiState.error(result.exception);
    }
  }
}
