// ignore_for_file: file_names

import 'package:app_ecommerce/controller/onboarding_controller.dart';
import 'package:app_ecommerce/core/constant/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustumbuttonOnboarding extends GetView<OnBoardingControllerImpl> {
  const CustumbuttonOnboarding({super.key});

  @override
  Widget build(BuildContext context) {

    return  Container(
                  padding: const EdgeInsets.all(5),
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                   shape: BoxShape.circle,
                   border: Border.all(
                    color: const Color.fromARGB(135, 121, 85, 72),
                    width: 2
                   )
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: AppColor.brown ,
                    ),
                    child: IconButton(onPressed: (){
                      controller.next();
                    },icon: const Icon(Icons.arrow_right_alt,color: Colors.white,size: 30,),),
                  ),
                );
  }
}