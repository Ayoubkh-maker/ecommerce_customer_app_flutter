import 'dart:io';

import 'package:app_ecommerce/controller/auth/signupController.dart';
import 'package:app_ecommerce/core/class/handlingdataview.dart';

import 'package:app_ecommerce/core/constant/app_colors.dart';
import 'package:app_ecommerce/core/function/exitapp.dart';
import 'package:app_ecommerce/core/function/validinpot.dart';

import 'package:app_ecommerce/view/widget/auth/customBtnSign.dart';
import 'package:app_ecommerce/view/widget/auth/customTextRout.dart';
import 'package:app_ecommerce/view/widget/auth/custombTextfieldAuth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignupControllerImp());
    return PopScope(
        canPop: false,
        onPopInvoked: (didPop) async {
          bool canExit = await exitApp();
          if (canExit == false) {
            exit(0);
          }
        },
        child: Scaffold(
          backgroundColor: AppColor.interface,
          body: GetBuilder<SignupControllerImp>(
            builder: (controller) =>
            HandlingdataRequest(statusRequest: controller.statusRequest, widget: 
            ListView(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      Container(
                        padding:const  EdgeInsets.only(left: 20),
                        height: 228,
                        child: Row(
                          children:  [
                            Container(
                              height: 50,
                              width: 5,
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Colors.white),
                            ),
                           const Text(
                              " Lets Start ! ",
                              style: TextStyle(
                                  fontSize: 40,
                                  fontFamily: "Cairo",
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      Form(
                        key: controller.keyvalid,
                        child: Container(
                          padding: const EdgeInsets.all(30),
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(200),
                                  topRight: Radius.circular(200))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Sign up",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Cairo",
                                    color: Colors.brown),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Container(
                                padding: const EdgeInsets.only(right: 10),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomTextFieldAuth(
                                        isNumber: false,
                                        hint: "Enter your Username",
                                        text: "Username",
                                        icon: Icons.person_2_outlined,
                                        controller: controller.username,
                                        validator: (value) {
                                          return validinput(
                                              value!, 20, 5, 'username');
                                        },
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      CustomTextFieldAuth(
                                        isNumber: false,
                                        hint: "Enter your email",
                                        text: "Email",
                                        icon: Icons.email_outlined,
                                        controller: controller.email,
                                        validator: (value) {
                                          return validinput(
                                              value!, 30, 5, 'email');
                                        },
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      CustomTextFieldAuth(
                                        hint: "Enter your Phone",
                                        text: "Phone",
                                        icon: Icons.phone_android_outlined,
                                        controller: controller.phone,
                                        isNumber: true,
                                        validator: (value) {
                                          return validinput(
                                              value!, 30, 6, 'phone');
                                        },
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      CustomTextFieldAuth(
                                        isNumber: false,
                                        hint: "Enter your password",
                                        text: "password",
                                        icon: Icons.lock_outline,
                                        controller: controller.password,
                                        validator: (value) {
                                          return validinput(
                                              value!, 30, 6, 'password');
                                        },
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      CustomBtnSign(
                                        titlebtn: "Sign up",
                                        onPressed: () async {
                                          await controller.signup();
                                        },
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      CustomTextRout(
                                        text: "I have an account ",
                                        textrout: "Sign in",
                                        onTap: () {
                                          controller.goToLogin();
                                        },
                                      )
                                    ]),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ), )
           
          ),
        ));
  }
}
