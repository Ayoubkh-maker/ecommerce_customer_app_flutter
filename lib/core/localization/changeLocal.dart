// ignore_for_file: file_names

import 'package:app_ecommerce/core/constant/apptheme.dart';
import 'package:app_ecommerce/core/services/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControllerLocal extends GetxController {
  ThemeData appTheme = themeEnglish;

// had var nkhzno fih langue
  Locale? language;
// jabda bih sharedPrefrences
  Myservices services = Get.find();

// hadi function tbdlna lagnue w derna dkhl fih langue li bghyinha
  changeLocal(String langueCode) {
    Locale locale = Locale(langueCode);
// khzna fih la langue bech tsauvgarda
    services.sharedPreferences.setString('lang', langueCode);
    appTheme = langueCode == "en" ? themeEnglish : themeArab;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  @override
  void onInit() async{
        final fcmToken = await  FirebaseMessaging.instance.getToken();
       print("===============================================================");
    print(fcmToken);
    // jbna key w hatineh f var
    String? sharedPrefLocal = services.sharedPreferences.getString("lang");

    if (sharedPrefLocal == "ar") {
      language = const Locale("ar");
      appTheme = themeArab;
    } else if (sharedPrefLocal == "en") {
      language = const Locale('en');
      appTheme = themeEnglish;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      appTheme = themeEnglish;
    }
    super.onInit();
  }
}
