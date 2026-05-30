

import 'package:app_ecommerce/controller/auth/succes_signupcontroller.dart';
import 'package:app_ecommerce/core/constant/app_colors.dart';
import 'package:app_ecommerce/view/widget/auth/customBtnSign.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessSignup extends StatelessWidget {
  const SuccessSignup({super.key});


  @override
  Widget build(BuildContext context) {

      SuccesSignupControllerImp controller = Get.put(SuccesSignupControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: const Text(
          'Success Sign Up',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body:  SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                Column(
                  children: [
                    const Icon(
                      Icons.check_circle,
                      size: 300,
                      color: AppColor.interface,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Congratulations",
                      style: TextStyle(fontSize: 30),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "The operation has been successfully",
                      style: TextStyle(
                          color: Colors.grey,
                          fontFamily: "Cairo",
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    const SizedBox(
                      height: 250,
                    ),
                    Center(
                      child: CustomBtnSign(
                        onPressed: () {
                          controller.gotobackLogin();
                        },
                        titlebtn: "Confirm",
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        )
    );
  }
}
