import 'dart:io';
import 'package:app_ecommerce/controller/auth/loginController.dart';
import 'package:app_ecommerce/core/class/handlingdataview.dart';
import 'package:app_ecommerce/core/constant/app_colors.dart';
import 'package:app_ecommerce/core/constant/app_image.dart';
import 'package:app_ecommerce/core/function/exitapp.dart';
import 'package:app_ecommerce/core/function/validinpot.dart';
import 'package:app_ecommerce/view/widget/auth/customBtnSign.dart';
import 'package:app_ecommerce/view/widget/auth/customTextRout.dart';
import 'package:app_ecommerce/view/widget/auth/custombTextfieldAuth.dart';
import 'package:app_ecommerce/view/widget/auth/customtextforgotpassword.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
 Get.put(LoginControllerImp());

    return PopScope(
      canPop: false,
      onPopInvoked: (pop) async {
        bool canExit = await exitApp();
        if (canExit == false) {
          exit(0);
        }
      },
      child: Scaffold(
          backgroundColor: AppColor.interface,
          body: GetBuilder<LoginControllerImp>(
              builder: (controller) => HandlingdataRequest(
                    statusRequest: controller.statusRequest,
                    widget: Form(
                      key: controller.kevalid,
                      child: ListView(
                        children: [
                          Container(
                            height: 390,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(200),
                                  topRight: Radius.circular(200)),
                              child: ColorFiltered(
                                  colorFilter: const ColorFilter.mode(
                                      AppColor.interface, BlendMode.modulate),
                                  child:  Image.asset(
                                    AppImages.backgroundLogin,
                                    height: 100,
                                    width: 100,
                                    fit: BoxFit.cover,
                                  )),
                            ),
                          ),
                          Container(
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
                                  "Sign in",
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
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
                                        GetBuilder<LoginControllerImp>(
                                          builder: (controller) =>
                                              CustomTextFieldAuth(
                                            obscure: controller.isShow,
                                            isNumber: false,
                                            hint: "Enter your password",
                                            text: "password",
                                            icon: Icons.visibility,
                                            controller: controller.password,
                                            validator: (value) {
                                              return validinput(
                                                  value!, 30, 6, 'password');
                                            },
                                            ontapicon: () {
                                              controller.changeShowPass();
                                            },
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        CustomForgotPassword(
                                          onTap: () {
                                            controller.goForgotpassword();
                                          },
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        CustomBtnSign(
                                          titlebtn: "Sign in",
                                          onPressed: () {
                                            controller.login();
                                          },
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        CustomTextRout(
                                          text: "Dont have an account ?",
                                          textrout: "Sign up",
                                          onTap: () {
                                            controller.gotoSignup();
                                          },
                                        )
                                      ]),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ))),
    );
  }
}
