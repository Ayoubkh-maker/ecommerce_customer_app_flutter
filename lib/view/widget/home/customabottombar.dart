import 'package:app_ecommerce/core/constant/app_colors.dart';
import 'package:flutter/material.dart';

class CostumbottomBar extends StatelessWidget {
  final void Function() onPressed;
  final IconData icon;
  final String? text;
  final bool active ;
  const CostumbottomBar(
      {super.key,
      required this.onPressed,
      required this.icon,
       this.text, 
      required this.active});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(

     hoverColor: const Color.fromARGB(255, 255, 255, 255),
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [Icon(
          
          icon, 
          color: active == true ? const Color.fromARGB(255, 255, 255, 255) : AppColor.interface,
          size: active == true ? 40 : 30,
        ),
        //  Text(text , style: const TextStyle(fontSize: 10,color: Colors.white),)
        ],
      ),
    );
  }
}
