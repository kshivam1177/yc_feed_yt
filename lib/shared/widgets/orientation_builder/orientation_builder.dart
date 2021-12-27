import 'package:flutter/material.dart';

import 'package:native_device_orientation/native_device_orientation.dart';

class NativeOrientationBuilder extends StatelessWidget {
  NativeOrientationBuilder({this.child});
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return NativeDeviceOrientationReader(
      builder: (BuildContext context) {
        NativeDeviceOrientation orientation =
            NativeDeviceOrientationReader.orientation(context);
        int turns;
        switch (orientation) {
          case NativeDeviceOrientation.landscapeLeft:
            turns = 2;
            break;
          case NativeDeviceOrientation.landscapeRight:
            turns = 2;
            break;
          case NativeDeviceOrientation.portraitDown:
            turns = 0;
            break;
          default:
            turns = 0;
            break;
        }
        return RotatedBox(
          quarterTurns: turns,
          child: child,
        );
      },
    );
  }
}
