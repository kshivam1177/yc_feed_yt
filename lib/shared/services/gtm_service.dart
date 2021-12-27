import 'package:flutter/services.dart';

class GTMService {
  //Method channel creation
  final MethodChannel androidChannel = MethodChannel('yellowclass.com/channel');
  final String gtmHandler = "gtmHandler";

  void sendActionEvent2GTM(Map<String, dynamic> gtmArgs) {
    try {
      androidChannel.invokeMethod(gtmHandler, gtmArgs);
    } on PlatformException catch (e) {
      throw "Failed to Invoke: '${e.message}'.";
    }
  }
}
