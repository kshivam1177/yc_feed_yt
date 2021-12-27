import 'dart:async';
import 'package:flutter/services.dart';

class NewRelic {
  static const MethodChannel _channel =
      MethodChannel('yellowclass.com/channel');

  static Future<bool> setStringAttribute(String name, String value) async {
    final Map<String, dynamic> params = <String, String>{
      'name': name,
      'value': value
    };
    final bool result =
        await _channel.invokeMethod('setStringAttribute', params);
    return result;
  }

  static Future<bool> setDoubleAttribute(String name, double value) async {
    final Map<String, dynamic> params = <String, dynamic>{
      'name': name,
      'value': value
    };
    final bool result =
        await _channel.invokeMethod('setDoubleAttribute', params);
    return result;
  }

  static Future<bool> setBooleanAttribute(String name, bool value) async {
    final Map<String, dynamic> params = <String, dynamic>{
      'name': name,
      'value': value
    };
    final bool result =
        await _channel.invokeMethod('setBooleanAttribute', params);
    return result;
  }

  static Future<bool> incrementAttribute(String name,
      {double value = 1.0}) async {
    final Map<String, dynamic> params = <String, dynamic>{
      'name': name,
      'value': value
    };
    final bool result =
        await _channel.invokeMethod('incrementAttribute', params);
    return result;
  }

  static Future<bool> recordBreadcrumb(String breadcrumbName,
      {Map<String, dynamic> attributes = const {}}) async {
    final Map<String, dynamic> params = <String, dynamic>{
      'breadcrumbName': breadcrumbName,
      'attributes': attributes
    };
    final bool result = await _channel.invokeMethod('recordBreadcrumb', params);
    return result;
  }

  static Future<String> startInteraction(String actionName) async {
    final Map<String, String> params = <String, String>{
      'actionName': actionName
    };
    final String result =
        await _channel.invokeMethod('startInteraction', params);
    return result;
  }

  static void endInteraction(String id) async {
    final Map<String, String> params = <String, String>{'id': id};
    print(await _channel.invokeMethod('endInteraction', params));
  }

  // static Future<bool> recordCustomEvent(String eventType, {String eventName = "", Map<String, dynamic> eventAttributes = const {}} ) async {
  //   final Map<String, dynamic> params = <String, dynamic> {
  //     'eventType': eventType,
  //     'eventName': eventName,
  //     'eventAttributes': eventAttributes
  //   };
  //   final bool result = await _channel.invokeMethod('recordCustomEvent', params);
  //   return result;
  // }
  static void recordCustomEvent(String eventType,
      {String eventName = "",
      Map<String, dynamic> eventAttributes = const {}}) {
    final Map<String, dynamic> params = <String, dynamic>{
      'eventType': eventType,
      'eventName': eventName,
      'eventAttributes': eventAttributes
    };
    _channel.invokeMethod('recordCustomEvent', params);
  }

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
