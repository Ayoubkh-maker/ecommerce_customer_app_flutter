import 'package:app_ecommerce/controller/auth/forgetpassword/success_operationcontroller.dart';
import 'package:app_ecommerce/core/constant/app_colors.dart';
import 'package:app_ecommerce/view/widget/auth/customBtnSign.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessOperation extends StatelessWidget {
  const SuccessOperation({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessOperationController controller =
        Get.put(SuccessOperationControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0.0,
          title: const Text(
            'Success Operation',
            style: TextStyle(fontSize: 20),
          ),
        ),
        body: SingleChildScrollView(
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
                      "Password has been reset successfully",
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
                          controller.backLogin();
                        },
                        titlebtn: "Confirm",
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
