// ignore_for_file: file_names

import 'package:app_ecommerce/controller/auth/forgetpassword/verifyCodeController.dart';
import 'package:app_ecommerce/core/class/handlingdataview.dart';

import 'package:app_ecommerce/core/constant/app_colors.dart';

import 'package:app_ecommerce/core/constant/app_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class Verifycode extends StatelessWidget {
  const Verifycode({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0.0,
          title: const Text(
            'Verify your Email',
            style: TextStyle(fontSize: 20),
          ),
        ),
        body: GetBuilder<VerifyCodeImp>(
            builder: (controller) => HandlingdataRequest(
                  statusRequest: controller.statusRequest,
                  widget: ListView(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(30),
                        child: Column(
                          children: [
                            Container(
                              height: 250,
                              width: 250,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(200),
                                  image: const DecorationImage(
                                      image: AssetImage(
                                        AppImages.verifieemail,
                                      ),
                                      fit: BoxFit.cover)),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                             Text(
                              "Please Enter The 5 Digit Code Sent To \n ${controller.email}",
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            OtpTextField(
                                cursorColor: AppColor.interface,
                                margin: const EdgeInsets.only(right: 10),
                                focusedBorderColor: AppColor.interface,
                                numberOfFields: 5,
                                fieldWidth: 56,
                                textStyle: const TextStyle(fontSize: 30),

                                //set to true to show as box or false to show as dash
                                showFieldAsBox: true,
                                //runs when a code is typed in
                                onCodeChanged: (String code) {
                                  //handle validation or checks here
                                },
                                //runs when every textfield is filled
                                onSubmit: (String verificationCode) {
                                  controller
                                      .gotoRessetpassword(verificationCode);
                                }),
                          ],
                        ),
                      ),
                    ],
                  ),
                )));
  }
}
