import 'package:app_ecommerce/core/constant/routepages.dart';
import 'package:app_ecommerce/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Mymiddleware extends GetMiddleware{

    @override
  // ignore: overridden_fields
  int? priority = 1;
  Myservices services = Get.find();

 @override
  RouteSettings? redirect(String? route) {
    if(services.sharedPreferences.getString("step") == "2"){
      return const RouteSettings(name: RoutePages.homePage);
    }
    if(services.sharedPreferences.getString("step") == "1"){
      return const RouteSettings(name: RoutePages.login);
    }
    return null;
  }
}