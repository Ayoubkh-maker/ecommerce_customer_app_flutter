import 'dart:io';

import 'package:app_ecommerce/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

 exitApp() {
  Get.defaultDialog(
    radius: 40.0,
    
      title: "Exit",
      middleText: "Are you sure you want to exit app",
      actions: [
        MaterialButton(
          onPressed: () {
            exit(0);
          },
          color: AppColor.interface,
          textColor: Colors.white,
          child: const Text("Confirm"),
        ),
         MaterialButton(
          onPressed: () {
            Get.back();
          },
          color: AppColor.interface,
          textColor: Colors.white,
          child: const Text("cancel"),
        ),

      ]);
return true ;
  
}
