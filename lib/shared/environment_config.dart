import 'package:yc_app/utils/constants.dart';

class EnvironmentConfig {
  EnvironmentConfig._();

  static const String CUSTOM_ENV = String.fromEnvironment(
    'CUSTOM_ENV',
    defaultValue: ENV_STAGE,
  );
  static const String ENCRYPTION_HASH = String.fromEnvironment(
    'ENCRYPTION_HASH',
  );
  static const String ENCRYPTION_SECRET = String.fromEnvironment(
    'ENCRYPTION_SECRET',
  );
}
