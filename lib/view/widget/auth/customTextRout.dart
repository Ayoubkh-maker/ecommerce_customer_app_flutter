// ignore_for_file: file_names

import 'package:app_ecommerce/core/constant/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextRout extends StatelessWidget {
  final String textrout;
  final String text;
  final void Function() onTap;
  const CustomTextRout({
    super.key,
    required this.onTap,
    required this.textrout,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Text(
          text,
          style: const TextStyle(fontFamily: "Cairo"),
        ),
        const SizedBox(
          width: 5,
        ),
        InkWell(
          onTap: onTap,
          child:  Text(
            textrout,
            style:const TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: "Cairo",
              color: AppColor.interface,
              decoration: TextDecoration.underline,
              decorationColor: Color.fromARGB(255, 134, 107, 96),
            ),
          ),
        )
      ],
    );
  }
}
