// ignore_for_file: file_names

import 'package:app_ecommerce/controller/auth/forgetpassword/reseetpassword_controller.dart';
import 'package:app_ecommerce/core/class/handlingdataview.dart';


import 'package:app_ecommerce/core/constant/app_image.dart';
import 'package:app_ecommerce/core/function/validinpot.dart';
import 'package:app_ecommerce/view/widget/auth/customBtnSign.dart';
import 'package:app_ecommerce/view/widget/auth/custombTextfieldAuth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RessetPassword extends StatelessWidget {
  const RessetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RessetPasswordImp());

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0.0,
          title: const Text(
            'Create New Password',
            style: TextStyle(fontSize: 20),
          ),
        ),
        body: GetBuilder<RessetPasswordImp>(
          builder: (controller) => HandlingdataRequest(
              statusRequest: controller.statusRequest,
              widget: Form(
                  key: controller.keyvalid,
                  child: ListView(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(30),
                        child: Column(
                          children: [
                            Container(
                              height: 250,
                              width: 250,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(150),
                                  image: const DecorationImage(
                                      image: AssetImage(
                                        AppImages.ressetPassword,
                                      ),
                                      fit: BoxFit.contain)),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            const Text(
                              "Your Password Must Be diffrent \n Previouslly User Password",
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            GetBuilder<RessetPasswordImp>(
                              init: RessetPasswordImp(),
                              builder: (controller) => CustomTextFieldAuth(
                                obscure: controller.isShow,
                                ontapicon: () => controller.changeShowPass(),
                                isNumber: false,
                                hint: "Enter your password",
                                text: "password",
                                icon: Icons.visibility,
                                controller: controller.password,
                                validator: (value) {
                                  return validinput(value!, 30, 6, 'password');
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 30.0,
                            ),
                            GetBuilder<RessetPasswordImp>(
                              builder: (controller) => CustomTextFieldAuth(
                                obscure: controller.isShow,
                                ontapicon: () => controller.changeShowPass(),
                                isNumber: false,
                                hint: "Enter your password",
                                text: "password",
                                icon: Icons.visibility,
                                controller: controller.repPassword,
                                validator: (value) {
                                  return validinput(value!, 30, 6, 'password');
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            CustomBtnSign(
                              onPressed: () {
                                controller.ressetPassword();
                              },
                              titlebtn: "Save",
                            )
                          ],
                        ),
                      ),
                    ],
                  ))),
        ));
  }
}
