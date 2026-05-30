// ignore_for_file: file_names

import 'package:app_ecommerce/controller/onboarding_controller.dart';
import 'package:app_ecommerce/data/source/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustumPageView extends GetView<OnBoardingControllerImpl> {
  const CustumPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return  PageView.builder(
      controller: controller.pageController,
      onPageChanged: (val){
        controller.onpageChange(val);
      },
                  itemCount: onBodringInst.length,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 350,
                            width: double.infinity,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: double.infinity,
                                    width: 160,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(20)),
                                        color: Colors.grey,
                                        image: DecorationImage(
                                            image: AssetImage(
                                              onBodringInst[i].imageLarger!,
                                            ),
                                            fit: BoxFit.cover)),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(20)),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                  onBodringInst[i].imageMeduim!,
                                                ),
                                                fit: BoxFit.cover)),
                                        width: double.infinity,
                                        height: 240,
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Expanded(
                                        child: Container(
                                          height: 140,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(20)),
                                              color: Colors.grey,
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                    onBodringInst[i]
                                                        .imageLitlle!,
                                                  ),
                                                  fit: BoxFit.cover)),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Column(
                            children: [
                              Text(
                                onBodringInst[i].title!,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.titleLarge
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                onBodringInst[i].body!,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.bodyLarge
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  });
  }
}