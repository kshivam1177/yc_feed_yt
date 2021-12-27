import 'dart:async';
import 'dart:io';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rxdart/rxdart.dart';
import 'package:yc_app/utils/config_graphql.dart';

class ApiHandler {
  static PublishSubject<OperationException?> apiErrorController =
      PublishSubject<OperationException?>();

  static Future<QueryResult> query(QueryOptions options,
      {Function(OperationException?)? onError,
      Function(QueryResult)? onResult,
      Function()? beforeApiCall,
      Function()? afterApiCall}) async {
    beforeApiCall?.call();
    QueryResult queryResult = await gqlClient.query(options);
    afterApiCall?.call();
    if (!queryResult.hasException) {
      onResult?.call(queryResult);
    } else {
      apiErrorController.add(queryResult.exception);
      onError?.call(queryResult.exception) ??
          handleError(queryResult.exception);
    }
    return queryResult;
  }

  static Future<QueryResult> mutate(MutationOptions options,
      {Function(OperationException?)? onError,
      Function(QueryResult)? onResult,
      Function()? beforeApiCall,
      Function()? afterApiCall}) async {
    beforeApiCall?.call();
    QueryResult queryResult = await gqlClient.mutate(options);
    afterApiCall?.call();
    if (!queryResult.hasException) {
      onResult?.call(queryResult);
    } else {
      apiErrorController.add(queryResult.exception);
      onError?.call(queryResult.exception) ??
          handleError(queryResult.exception);
    }
    return queryResult;
  }

  static Stream<QueryResult> subscribe(SubscriptionOptions operation) {
    Stream<QueryResult> result = gqlClient.subscribe(operation);
    return result;
  }

  static Future<void> handleError(
      OperationException? operationException) async {
    if (operationException?.linkException != null) {
      if (operationException!.linkException is SocketException) {
        // CODE: NO INTERNET CLIENT EXCEPTION GOTO NO INTERNET SCREEN
        print(operationException.linkException!.originalException.toString());
      }
    }
    if ((operationException?.graphqlErrors.isNotEmpty ?? false) &&

        operationException?.graphqlErrors[0].extensions!["code"] != null) {
    }
  }
}
