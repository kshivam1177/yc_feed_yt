String buildMode = "Dev";

bool isReleaseMode = bool.fromEnvironment('dart.vm.product');

const developmentEnviornment = {
  'mode': "Dev",
  'baseUrl': '',
  'awsBaseUrl': '',
  'isDebugBanner': true,
};

const staging = {
  'mode': "Staging",
  'baseUrl': '',
  'awsBaseUrl': '',
  'isDebugBanner': true,
};

const productionEnvironment = {
  'mode': "Release",
  'baseUrl': '',
  'awsBaseUrl': '',
  'isDebugBanner': false,
};

String? baseUrl = [developmentEnviornment, staging, productionEnvironment]
    .where((env) => env["mode"] == buildMode)
    .toList()[0]["baseUrl"] as String?;

String? awsBaseUrl = [developmentEnviornment, staging, productionEnvironment]
    .where((env) => env["mode"] == buildMode)
    .toList()[0]["awsBaseUrl"] as String?;

bool? isDebugBanner = isReleaseMode
    ? productionEnvironment['isDebugBanner'] as bool?
    : developmentEnviornment['isDebugBanner'] as bool?;
