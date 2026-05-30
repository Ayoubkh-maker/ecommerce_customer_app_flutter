// ignore_for_file: file_names

import 'package:app_ecommerce/controller/auth/verify_signupController.dart';
import 'package:app_ecommerce/core/class/handlingdataview.dart';
import 'package:app_ecommerce/core/constant/app_colors.dart';
import 'package:app_ecommerce/core/constant/app_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VerifyCodeSignup extends StatelessWidget {
  const VerifyCodeSignup({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(VerifysignupControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0.0,
          title: const Text(
            'Verify your Email',
            style: TextStyle(fontSize: 20),
          ),
        ),
        body: ListView(
          children: [
            GetBuilder<VerifysignupControllerImp>(
                builder: (controller) => HandlingdataRequest(
                      statusRequest: controller.statusRequest,
                      widget: Container(
                        padding: const EdgeInsets.all(30),
                        child: Column(
                          children: [
                            Container(
                              height: 250,
                              width: 250,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  image: const DecorationImage(
                                      image: AssetImage(
                                        AppImages.verifieemail,
                                      ),
                                      fit: BoxFit.contain)),
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
                                  controller.goTosuccesSignup(verificationCode);
                                }),
                            InkWell(
                              onTap: controller.updateCode(),
                              child: Container(
                                margin: const EdgeInsets.only(top: 60),
                                child: const Center(
                                    child: Text(
                                  "RESEND VERIFY CODE",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline,
                                    decorationColor:
                                        Colors.blue,
                                  ),
                                )),
                              ),
                            )
                          ],
                        ),
                      ),
                    ))
          ],
        ));
  }
}
