import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yc_app/my_app.dart';
import 'package:yc_app/utils/connection_status_singleton.dart';

import 'package:yc_app/shared/services/shared_preferences_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  connectionStatus.initialize();
  await sharedPreferenceService.getSharedPreferencesInstance();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) {
    runApp(MyApp());
  });
}
