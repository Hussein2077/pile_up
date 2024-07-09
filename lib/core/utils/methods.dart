import 'dart:convert';
import 'dart:html';
import 'dart:js';
import 'package:flutter/material.dart';
import 'package:app_links/app_links.dart';
import 'package:pile_up/core/resource_manager/routes.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/service/navigator_services.dart';
import 'package:pile_up/core/service/service_locator.dart';
import 'package:pile_up/core/utils/constant_api.dart';
import 'package:pile_up/features/on_boarding/on_boarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Methods {
//singleton class
  Methods._internal();

  static final instance = Methods._internal();

  factory Methods() => instance;

  Future<void> saveUserToken({String? authToken}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (authToken != null) {
      preferences.setString(StringManager.userTokenKey, authToken);
    } else {
      preferences.setString(StringManager.userTokenKey, authToken ?? "noToken");
    }
  }

  Future<String> returnUserToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String tokenPref =
        preferences.getString(StringManager.userTokenKey) ?? "noToken";
    return tokenPref;
  }

  Future<String> sharePile({required int pileId}) async {
    String encodedString =
        base64.encode(utf8.encode("action=pile&&pileId=$pileId"));
    final String url = "${ConstantApi.dynamicLinkBaseUrl}?data=$encodedString";

    return url.toString();
  }

  initDynamicLinks({required BuildContext context}) async {
    final _appLinks = AppLinks();

    OnBoardingScreen.dynamicLink = await _appLinks.getLatestLink();

    if (OnBoardingScreen.dynamicLink != null) {
      await handleDeepLink(OnBoardingScreen.dynamicLink,context: context);
    }
  }

  Map<String, String> convertStringToMap(String value) {
    // Split the query string by '&&' to get individual key-value pairs
    List<String> keyValuePairs = value.split('&&');

    // Create a map to store key-value pairs
    Map<String, String> map = {};

    // Iterate over each key-value pair
    for (String pair in keyValuePairs) {
      // Split the key-value pair by '=' to get the key and value
      List<String> keyValue = pair.split('=');
      String key;
      String value;

      if (keyValue.length >= 2) {
        key = keyValue[0];
        value = keyValue[1];
        map[key] = value;
      }
      // Add the key-value pair to the map
    }
    return map;
  }

  Future<void> handleDeepLink(Uri? data,{required BuildContext context}) async {
    final Uri? deepLink = data;
    final String? urlData = deepLink?.queryParameters['data'];
    String decodedString = utf8.decode(base64.decode(urlData ?? ""));
    Map urlMap = Methods.instance.convertStringToMap(decodedString);

    final String? action = urlMap['action'];
    final String? pileId = urlMap['pileId'];
    // final token = await Methods.instance.returnUserToken();
    // if(token=="noToken"){
    //
    // // }
    // Navigator.pushNamed(getIt<NavigationService>().navigatorKey.currentContext??context,
    //     Routes.pilesDetails);
  }
}
