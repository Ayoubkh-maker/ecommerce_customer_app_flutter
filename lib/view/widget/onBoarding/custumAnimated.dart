// ignore_for_file: file_names

import 'package:app_ecommerce/controller/onboarding_controller.dart';
import 'package:app_ecommerce/data/source/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustumAnimated extends StatelessWidget {
  const CustumAnimated({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImpl>(builder: (controller) =>  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...List.generate(
                  onBodringInst.length,
                  (index) => AnimatedContainer(
                      width:controller.currentPage == index ? 20 : 6,
                      height: 6,
                      margin:const EdgeInsets.only(right: 3),
                      duration: const Duration(milliseconds: 900),
                      decoration: BoxDecoration(color: const Color.fromARGB(255, 74, 53, 45),
                      borderRadius: BorderRadius.circular(10)
                      
                      ),
                      
                      ),
                      
                )
                  ],
                ));
  }
}