class Endpoints {
  Endpoints._();

  static Map<String, dynamic> _getBaseUrl() {
    return {
      'baseApiUri': "https://dev-gql.yellowclass.com",
      'baseImageUri': "wss://dev-gql.yellowclass.com",
      'baseCfImageUri': "https://ycimg-dev.imgix.net",
      'baseStaticVideoUri': "https://dev-img.yellowclass.com",
      'baseVideoUri': "https://dev-img.yellowclass.com",
      'baseSubscriptionUri': "https://dev-video.yellowclass.com",
      'baseLoggerUri': "https://develop-overwatch.yellowclass.com",
      'baseWebsiteUrl': "https://develop.yellowclass.com",
      'isProdOrStageEnv': false,
    };
  }

  static final String? _baseUri = _getBaseUrl()['baseApiUri'];
  static final String? baseSubscriptionUri =
      _getBaseUrl()['baseSubscriptionUri'];
  static final String? baseImageUrl = _getBaseUrl()['baseImageUri'];
  static final String? baseCfImageUrl = _getBaseUrl()['baseCfImageUri'];
  static final String? baseVideoUrl = _getBaseUrl()['baseVideoUri'];
  static final String? baseStaticVideoUrl = _getBaseUrl()['baseStaticVideoUri'];
  static final String? baseWebsiteUrl = _getBaseUrl()['baseWebsiteUrl'];
  static final bool isProdOrStageEnv =
      _getBaseUrl()['isProdOrStageEnv'] ?? false;

  // gql endpoints
  static final String? baseApi = _baseUri;
  static final String? gqlApi = _baseUri! + '/graphql';
  static final String? subscriptionApi =
      baseSubscriptionUri! + '/subscriptions';

  // logger
  static final String? overwatchURL = _getBaseUrl()['baseLoggerUri'];
}
