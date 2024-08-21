import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uni_links/uni_links.dart';

import '../green.dart';
import '../red.dart';
import 'context_utility.dart';

class UniServices {
  static String _code = '';
  static String get Code => _code;
  static bool get hasCode => _code.isNotEmpty;

  static void reset() => _code = '';

  static init() async {
    try {
      final Uri? uri = await getInitialUri();
      uniHandler(uri);
    } on PlatformException {
      log('Failed to receive the code');
    } on FormatException {
      log('Wrong format code received');
    }

    uriLinkStream.listen((Uri? uri) async {
      uniHandler(uri);
    }, onError: (error) {
      log('OnUriLink error: $error');
    });
  }

  static uniHandler(Uri? uri){
    if(uri == null || uri.queryParameters.isEmpty) return;

    Map<String,String> param = uri.queryParameters;

    String receivedCode = param['code'] ?? '';

    if(ContextUtility.context != null){
      if(receivedCode == 'green'){
        print("green print");
        Navigator.push(ContextUtility.context!, MaterialPageRoute(builder: (_) => const GreenScreen()));
      } else {
        print("red print");
        Navigator.push(ContextUtility.context!, MaterialPageRoute(builder: (_) => const RedScreen()));
      }
    }
    else {
      print("Context is null");
      print("Context is null ${ContextUtility.navigatorKey}");
      // Handle the case where context is null
    }
  }
}