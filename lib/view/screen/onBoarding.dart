// ignore_for_file: file_names

import 'package:app_ecommerce/controller/onboarding_controller.dart';
import 'package:app_ecommerce/core/constant/app_colors.dart';
import 'package:app_ecommerce/view/widget/onBoarding/custumAnimated.dart';
import 'package:app_ecommerce/view/widget/onBoarding/custumButton.dart';
import 'package:app_ecommerce/view/widget/onBoarding/custumPageView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImpl());
    return Container(
        height: double.infinity,
        width: double.infinity,
        color: AppColor.interface,
        padding:
            const EdgeInsets.only(top: 60, right: 30, left: 30, bottom: 30),
        child: const Column(
          
          children:  [
            Expanded( 
              flex: 3,
              child: CustumPageView()
            ),
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    CustumAnimated(),
                   SizedBox(
                      height: 60,
                    ),
                     CustumbuttonOnboarding(),
                  ],
                ))
          ],
        ));
  }
}
