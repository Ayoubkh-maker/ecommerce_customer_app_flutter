// ignore_for_file: file_names

import 'package:app_ecommerce/controller/auth/forgetpassword/forgetpasswordController.dart';
import 'package:app_ecommerce/core/class/handlingdataview.dart';


import 'package:app_ecommerce/core/constant/app_image.dart';
import 'package:app_ecommerce/core/function/validinpot.dart';
import 'package:app_ecommerce/view/widget/auth/customBtnSign.dart';
import 'package:app_ecommerce/view/widget/auth/custombTextfieldAuth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoergetPassword extends StatelessWidget {
  const FoergetPassword({super.key});

  @override
  Widget build(BuildContext context) {

        Get.put(ForgetPasswordControllerImp());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: const Text(
          'Forgot Password',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: GetBuilder<ForgetPasswordControllerImp>(builder: (controller) =>
      HandlingdataRequest(statusRequest: controller.statusRequest, widget: Form(
        key: controller.keyvalid,
        child: SingleChildScrollView(
          child: Container(
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
                            AppImages.checkemail,
                          ),
                          fit: BoxFit.cover)),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Please Enter Your Email Adress To \n Recieve a Verification Code",
                  textAlign: TextAlign.center,
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
                    return validinput(value!, 100, 5, 'email');
                  },
                ),
               const  SizedBox(height: 250,),
                CustomBtnSign(
                  onPressed: () {
                  
                    controller.forgetPassword();
             
                  },
                  titlebtn: "Send",
                )
              ],
            ),
          ),
        ),
      ), )
     )
    );
  }
}
