// ignore_for_file: file_names

import 'package:app_ecommerce/core/constant/app_colors.dart';
import 'package:flutter/material.dart';

class CustomBtnSign extends StatelessWidget {
  final String titlebtn;
  final  void Function() onPressed;
  const CustomBtnSign({super.key, required this.titlebtn, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      color: AppColor.interface,
      textColor: Colors.white,
      minWidth: 300,
      height: 40,
      child:  Text(
        titlebtn,
        style:const TextStyle(
            fontFamily: "Cairo", fontWeight: FontWeight.bold, fontSize: 15),
      ),
    );
  }
}
