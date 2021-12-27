import 'dart:io';

import 'package:yc_app/shared/environment_config.dart';

import 'package:yc_app/utils/constants.dart';

class Endpoints {
  Endpoints._();

  static String _getGoogleCalendarEndpoint() {
    const String _env = EnvironmentConfig.CUSTOM_ENV;

    late String _baseUri;
    switch (_env) {
      case ENV_LOCAL:
        _baseUri =
        '468186140445-dfap1ieu95j6ogg35e8ui2gvqffdf5g1.apps.googleusercontent.com'; // Pranjal's key
        break;
      case ENV_DEV:
      case ENV_STAGE:
        _baseUri = Platform.isAndroid
            ? '468186140445-m4auuf47elgb17200rge5g81qeclot8t.apps.googleusercontent.com'
            : '468186140445-s5jre82ue0uok6v45b5pdmv6p6vv1f5i.apps.googleusercontent.com';
        break;
      case ENV_PROD:
        _baseUri = Platform.isAndroid
            ? '468186140445-l9e29h0lrvlv99ob59j9a53j6tt753sk.apps.googleusercontent.com'
            : '468186140445-s5jre82ue0uok6v45b5pdmv6p6vv1f5i.apps.googleusercontent.com';
        break;
      default:
        break;
    }
    return _baseUri;
  }

  static final String googleCalendarEndpoint = _getGoogleCalendarEndpoint();

  static Map<String, dynamic> _getBaseUrl() {
    const String _env = EnvironmentConfig.CUSTOM_ENV;

    late String _baseApiUri,
        _baseStaticImageUri,
        _baseStaticCfImageUri,
        _baseStaticVideoUri,
        _baseVideoUri,
        _baseSubscriptionUri,
        _baseLoggerUri,
        _baseWebsiteUrl,
        _baseSentryDsn;
    late bool _isProdOrStageEnv;
    switch (_env) {
      case ENV_LOCAL:
        _baseApiUri = Platform.isAndroid
            ? 'http://10.0.2.2:8080'
            : 'http://localhost:8080';
        _baseSubscriptionUri =
        Platform.isAndroid ? 'ws://10.0.2.2:8080' : 'ws://localhost:8080';
        _baseStaticImageUri = 'https://ycimg-dev.imgix.net';
        _baseStaticCfImageUri = 'https://dev-img.yellowclass.com';
        _baseStaticVideoUri = 'https://dev-img.yellowclass.com';
        _baseVideoUri = 'https://dev-video.yellowclass.com';
        _baseLoggerUri = 'https://develop-overwatch.yellowclass.com';
        _baseWebsiteUrl = 'https://develop.yellowclass.com';
        _baseSentryDsn =
        'https://46acc093fc89490a9dc57ef36d81575e@o951133.ingest.sentry.io/5899871';
        _isProdOrStageEnv = false;
        break;

      case ENV_DEV:
        _baseApiUri = 'https://dev-gql.yellowclass.com';
        _baseSubscriptionUri = 'wss://dev-gql.yellowclass.com';
        _baseStaticImageUri = 'https://ycimg-dev.imgix.net';
        _baseStaticCfImageUri = 'https://dev-img.yellowclass.com';
        _baseStaticVideoUri = 'https://dev-img.yellowclass.com';
        _baseVideoUri = 'https://dev-video.yellowclass.com';
        _baseLoggerUri = 'https://develop-overwatch.yellowclass.com';
        _baseWebsiteUrl = 'https://develop.yellowclass.com';
        _baseSentryDsn =
        'https://46acc093fc89490a9dc57ef36d81575e@o951133.ingest.sentry.io/5899871';
        _isProdOrStageEnv = false;
        break;

      case ENV_STAGE:
        _baseApiUri = 'https://staging-gql.yellowclass.com';
        _baseSubscriptionUri = 'wss://staging-gql.yellowclass.com';
        _baseStaticImageUri = 'https://ycimg-stage.imgix.net';
        _baseStaticCfImageUri = 'https://stage-img.yellowclass.com';
        _baseStaticVideoUri = 'https://stage-img.yellowclass.com';
        _baseVideoUri = 'https://stage-video.yellowclass.com';
        _baseLoggerUri = 'https://staging-overwatch.yellowclass.com';
        _baseWebsiteUrl = 'https://staging.yellowclass.com';
        _baseSentryDsn =
        'https://46acc093fc89490a9dc57ef36d81575e@o951133.ingest.sentry.io/5899871';
        _isProdOrStageEnv = true;
        break;

      case ENV_PROD:
        _baseApiUri = 'https://gql.yellowclass.com';
        _baseSubscriptionUri = 'wss://gql.yellowclass.com';
        _baseStaticImageUri = 'https://ycimg.imgix.net';
        _baseStaticCfImageUri = 'https://image-cdn.yellowclass.com';
        _baseStaticVideoUri = 'https://image-cdn.yellowclass.com';
        _baseVideoUri = 'https://video.yellowclass.com';
        _baseLoggerUri = 'https://overwatch.yellowclass.com';
        _baseWebsiteUrl = 'https://www.yellowclass.com';
        _baseSentryDsn =
        'https://db349dad483945f8a4d46df132549cf0@o326464.ingest.sentry.io/5870888';
        _isProdOrStageEnv = true;
        break;

      default:
        _baseApiUri = 'https://dev-gql.yellowclass.com';
        _baseSubscriptionUri = 'wss://dev-gql.yellowclass.com';
        _baseStaticImageUri = 'https://ycimg-dev.imgix.net';
        _baseStaticCfImageUri = 'https://dev-img.yellowclass.com';
        _baseStaticVideoUri = 'https://dev-img.yellowclass.com';
        _baseVideoUri = 'https://dev-video.yellowclass.com';
        _baseLoggerUri = 'https://develop-overwatch.yellowclass.com';
        _baseWebsiteUrl = 'https://develop.yellowclass.com';
        _baseSentryDsn =
        'https://46acc093fc89490a9dc57ef36d81575e@o951133.ingest.sentry.io/5899871';
        _isProdOrStageEnv = false;
        break;
    }
    return {
      'baseApiUri': _baseApiUri,
      'baseImageUri': _baseStaticImageUri,
      'baseCfImageUri': _baseStaticCfImageUri,
      'baseStaticVideoUri': _baseStaticVideoUri,
      'baseVideoUri': _baseVideoUri,
      'baseSubscriptionUri': _baseSubscriptionUri,
      'baseLoggerUri': _baseLoggerUri,
      'baseWebsiteUrl': _baseWebsiteUrl,
      'baseSentryDsn': _baseSentryDsn,
      'isProdOrStageEnv': _isProdOrStageEnv,
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
  static final String? baseSentryDsn = _getBaseUrl()['baseSentryDsn'];
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