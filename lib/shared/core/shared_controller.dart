import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class HttpInstance with ChangeNotifier {
  var client = http.Client();
  get httpInstance => client;

  checkHttp(respnse) {
    client = http.Client();
  }
}
