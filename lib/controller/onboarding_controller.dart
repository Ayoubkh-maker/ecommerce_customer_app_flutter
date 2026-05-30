

import 'package:app_ecommerce/core/constant/routepages.dart';
import 'package:app_ecommerce/core/services/services.dart';
import 'package:app_ecommerce/data/source/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OnBoardingController extends GetxController {
// hadi bech tedina l page
  next();
  // tatfa3el m3a annimated li ysra ki troh ldik page
  onpageChange(int index);
}

class OnBoardingControllerImpl extends OnBoardingController {
  late PageController pageController;

  int currentPage = 0;
  
  Myservices services = Get.find();

  @override
  next() {
    currentPage++;
    //psq current yabda m 0 w hna 3adna 3page
    if (currentPage > onBodringInst.length - 1) {
      services.sharedPreferences.setString("step", "1");
      Get.offAllNamed(RoutePages.login);
    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    }
  }

  @override
  onpageChange(int index) {
    currentPage = index;
    update();
  }

  // li9 dilha inia m3a bdya bech t9ad tascroller
  @override
  void onInit() {
    pageController = PageController();

    super.onInit();
  }
}
