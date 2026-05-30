import 'package:app_ecommerce/core/constant/app_colors.dart';


import 'package:flutter/material.dart';


class CustomChoosePayment extends StatelessWidget {
  final String title ;
  final String image ;
  final Function() onTap ;
  final bool changeColor ;
  const CustomChoosePayment({super.key, required this.title, required this.changeColor, required this.image, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return     InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: changeColor == true ? AppColor.blueA : AppColor.blueASecond, // Background color of the container
                    boxShadow: changeColor == true ? [
                      
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5), // Shadow color
                          spreadRadius: 5, // How far the shadow spreads
                          blurRadius: 7, // How soft the shadow is
                          offset: const Offset(0,
                              3), // Changes the position of the shadow (horizontal, vertical)
                        ) ,
                      ]: [],
                      borderRadius:
                          BorderRadius.circular(10), // Rounded corners (optional)
                    ),
                    child: Row(
                      children: [
                         Expanded(
                          flex: 2,
                          child: Text(
                            title,
                            style: TextStyle(
                                color: changeColor == true ?  Colors.white : const Color.fromARGB(255, 159, 157, 154), fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: Image.asset(
                              image ,
                              height: 60,
                            ))
                      ],
                    )),
    );
  }
}