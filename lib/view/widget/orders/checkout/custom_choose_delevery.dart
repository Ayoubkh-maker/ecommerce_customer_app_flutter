import 'package:app_ecommerce/core/constant/app_colors.dart';

import 'package:flutter/material.dart';


class CustomChooseDelivery extends StatelessWidget {
  final String image ;
  final Function() onTap ;
  final bool changeColor ;
  const CustomChooseDelivery({super.key, required this.image, required this.changeColor, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onTap,
      child: Container(
                      height: 70,
                      width: 100,
                      decoration: BoxDecoration(
                        color: changeColor == true ? AppColor.blueA : AppColor.blueASecond ,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: changeColor == true ? [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5), // Shadow color
                            spreadRadius: 5, // How far the shadow spreads
                            blurRadius: 7, // How soft the shadow is
                            offset: const Offset(0,
                                3), // Changes the position of the shadow (horizontal, vertical)
                          ),
                        ] : [],
                      ),
                      child: Image.asset(image),
                    ),
    );
  }
}