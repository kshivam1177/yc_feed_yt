import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

mixin LandscapeStatefulModeMixin<T extends StatefulWidget> on State<T> {
  @override
  void initState() {
    _landscapeModeOnly();
    super.initState();
  }
  // @override
  // Widget build(BuildContext context) {
  //   _landscapeModeOnly();
  //   return null;
  // }

  @override
  void dispose() {
    _enableRotation();
    super.dispose();
  }
}

/// blocks rotation; sets orientation to: landscape
void _landscapeModeOnly() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
}

void _enableRotation() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    // DeviceOrientation.portraitDown,
    // DeviceOrientation.landscapeLeft,
    // DeviceOrientation.landscapeRight,
  ]);
}
