import 'package:flutter/material.dart';
import 'package:yc_app/modules/splash/splash.dart';
import 'package:yc_app/shared/services.dart';
import 'package:yc_app/utils/theme_controller.dart';

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance!.addObserver(this);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {}

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _YcMaterialApp();
  }
}

class _YcMaterialApp extends StatelessWidget {
  const _YcMaterialApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yellow Class',
      debugShowCheckedModeBanner: isDebugBanner!,
      theme: ThemeController().getAppTheme,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(data: this._mediaQueryData(context), child: child!);
      },
      home: Splash(),
    );
  }

  MediaQueryData _mediaQueryData(BuildContext context) {
    final MediaQueryData data = MediaQuery.of(context);
    return data.copyWith(
      textScaleFactor: data.textScaleFactor > 1.0 ? 1.0 : data.textScaleFactor,
    );
  }
}
