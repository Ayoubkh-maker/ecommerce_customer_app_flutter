// ignore_for_file: file_names

import 'package:app_ecommerce/core/class/status_request.dart';
import 'package:app_ecommerce/core/constant/routepages.dart';
import 'package:app_ecommerce/core/function/handlingdata.dart';
import 'package:app_ecommerce/data/source/datasource/remote/auth/logindata.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/services/services.dart';

abstract class LoginController extends GetxController {
  gotoSignup();
  login();
  goForgotpassword();
  changeShowPass();
}


class LoginControllerImp extends LoginController {
  GlobalKey<FormState> kevalid = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;

  bool isShow = true;

  StatusRequest statusRequest = StatusRequest.none;
  Logindata logindata = Logindata(crud: Get.find());
  Myservices myservices = Get.find();

  @override
  login() async {
    if (kevalid.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await logindata.postdata(email.text, password.text);
      statusRequest = handlingdata(response);
      print(statusRequest);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {  
          if (response["data"]["users_approve"] == 1) {
            myservices.sharedPreferences
                .setString("name", response['data']["users_name"]);
            myservices.sharedPreferences
                .setString("usersId", response['data']["users-id"].toString());
            myservices.sharedPreferences
                .setString("email", response['data']["users_email"]);
            myservices.sharedPreferences
                .setString("usersPhone", response['data']["users_phone"]);
            myservices.sharedPreferences
                .setString("passwordu", response['data']["users_password"]);
            myservices.sharedPreferences.setString(
                "usersaprv", response['data']["users_approve"].toString());
            myservices.sharedPreferences
                .setString("date", response['data']["users_create"].toString());
            myservices.sharedPreferences.setString("step", "2");
            String userid =
                myservices.sharedPreferences.getString("usersId").toString();
            //hadi message l ga3 user ywslhom ida tkhal apk
            FirebaseMessaging.instance.subscribeToTopic("users");
            //hadi message ki tabghi trsleh user mohaded
            FirebaseMessaging.instance.subscribeToTopic("user $userid");

            Get.offAllNamed(RoutePages.homePage);
          } else {
            Get.offNamed(RoutePages.verifySignup,
                arguments: {"email": email.text});
          }
        } else {
          Get.defaultDialog(
              title: "Warning",
              middleText: "the email or password are not correct ");
          statusRequest = StatusRequest.failure;
        }
      }
    } else {
      // ignore: avoid_print
      print("not valid");
    }
    update();
  }

  @override
  changeShowPass() {
    isShow = isShow == true ? false : true;
    update();
  }

  @override
  gotoSignup() {
    Get.toNamed(RoutePages.signup);
  }

  @override
  goForgotpassword() {
    Get.toNamed(RoutePages.forgetPassword);
  }

  @override
  void onInit() {
    // FirebaseMessaging.instance.getToken().then((value) {

    //  String? token = value ;
    //  // ignore: avoid_print
    //  print(token);

    // });
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
