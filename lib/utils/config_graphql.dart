import 'dart:async';

import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:yc_app/shared/services/shared_preferences_service.dart';

import 'package:yc_app/utils/common_helpers.dart';
import 'package:yc_app/utils/constants.dart';
import 'package:yc_app/utils/endpoints.dart';

class Config {
  static final HttpLink httpLink = HttpLink(
    Endpoints.gqlApi!,
  );

  static final CustomHeaderLink customHeaderLink = CustomHeaderLink(
    getHeaders: () => Future.value(
      CommonHelpers.getAPIHeaders(),
    ),
  );

  static final AuthLink authLink =
      AuthLink(getToken: () => sharedPreferenceService.accessToken);

  static final WebSocketLink websocketLink = WebSocketLink(
    Endpoints.subscriptionApi!,
    config: SocketClientConfig(
        autoReconnect: true,
        inactivityTimeout: Duration(seconds: 60),
        delayBetweenReconnectionAttempts: Duration(seconds: 1)
        // initPayload: {
        //   'headers': {'Authorization': "Bearer $_token"},
        // },
        ),
  );

  static final Link link = Link.split((request) => request.isSubscription,
      websocketLink, customHeaderLink.concat(httpLink));

  static GraphQLClient clientToQuery() {
    return GraphQLClient(
      cache: GraphQLCache(
        // The default store is the InMemoryStore, which does NOT persist to disk
        store: InMemoryStore(),
      ),
      link: link,
    );
  }
}

GraphQLClient gqlClient = Config.clientToQuery();

// typedef GetHeaders = Future<Map<String, String?>> Function();
//
// class CustomHeaderContext extends ContextEntry {
//   final Map<String, String> headers;
//
//   const CustomHeaderContext({this.headers = const {}});
//
//   @override
//   List<Object> get fieldsForEquality => [headers];
// }
//
// class CustomHeaderLink extends Link {
//   CustomHeaderLink({
//     required this.getHeaders,
//   });
//   GetHeaders getHeaders;
//   @override
//   Stream<Response> request(Request request, [NextLink? forward]) {
//     late StreamController<Response> controller;
//
//     Future<void> onListen() async {
//       try {
//         final Map<String, String?> headers = await getHeaders();
//
//         String? routingKey =
//             queryNameToHeaderKeyMap[request.operation.operationName];
//         headers["operation-name"] = request.operation.operationName;
//         if (routingKey != null && routingKey != '') {
//           headers["routing-key"] = routingKey;
//         }
//         request = request.withContextEntry(CustomHeaderContext(
//             <String, Map<String, String?>>{'headers': headers}));
//         request.context.entry(CustomHeaderContext(
//             <String, Map<String, String?>>{'headers': headers}));
//         //request(<String, Map<String, String>>{'headers': headers});
//       } catch (error) {
//         controller.addError(error);
//       }
//
//       await controller.addStream(forward!(request));
//       await controller.close();
//     }
//
//     controller = StreamController<Response>(onListen: onListen);
//
//     return controller.stream;
//   }
// }

typedef _RequestTransformer = FutureOr<Request> Function(Request request);

typedef OnException = FutureOr<String> Function(
  HttpLinkServerException exception,
);

class _AsyncReqTransformLink extends Link {
  final _RequestTransformer requestTransformer;

  _AsyncReqTransformLink({
    required this.requestTransformer,
  });

  @override
  Stream<Response> request(
    Request request, [
    NextLink? forward,
  ]) async* {
    final req = await requestTransformer(request);

    yield* forward!(req);
  }
}

class CustomHeaderLink extends _AsyncReqTransformLink {
  CustomHeaderLink({
    required this.getHeaders,
  }) : super(requestTransformer: transform(getHeaders));

  final FutureOr<Map<String, String>> Function() getHeaders;

  static _RequestTransformer transform(getHeaders) => (Request request) async {
        final header = await getHeaders();
        if (request.operation.operationName != null) {
          header["operation-name"] = request.operation.operationName;
        }

        return request.updateContextEntry<HttpLinkHeaders>(
          (headers) => HttpLinkHeaders(
            headers: header,
          ),
        );
      };
}
