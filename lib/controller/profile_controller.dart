import 'package:app_ecommerce/core/constant/routepages.dart';
import 'package:app_ecommerce/core/services/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class ProfileController extends GetxController {
  appout();
}

class ProfileControllerImp extends ProfileController {
  Myservices myservices = Get.find();

  late String name;
  late String email;

  List<Map<String, dynamic>> profilelist = [
    {
      "title": "Disable notifications",
      "leading": Icons.notifications_active_outlined,
      "ontap": () {
        print("disable notification");
      }
    },
    {
      "title": "Address",
      "leading": Icons.location_on_outlined,
      "ontap": () {
        Get.toNamed(RoutePages.addresspage);
      }
    },
    {
      "title": "Orders",
      "leading": Icons.badge,
      "ontap": () {
        Get.toNamed(RoutePages.pending);
      }
    },
    {
      "title": "About us",
      "leading": Icons.help_outline_outlined,
      "ontap": () {
        print("about us");
      }
    },
    {
      "title": "Contact us",
      "leading": Icons.phone_callback,
      "ontap": () {
        launchUrl(Uri.parse("tel:0665283050"));
      }
    },
    {
      "title": "Logout",
      "leading": Icons.logout_rounded,
      "ontap": () {
        Get.find<ProfileControllerImp>().appout();
      }
    }
  ];

  @override
  void onInit() {
    email = myservices.sharedPreferences.getString("email").toString();
    name = myservices.sharedPreferences.getString("name").toString();
    super.onInit();
  }

  @override
  void appout() {
    String userid = myservices.sharedPreferences.getString("usersId").toString();
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic("user $userid");
    myservices.sharedPreferences.clear();
    Get.offAllNamed(RoutePages.login);
  }
}
