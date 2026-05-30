import 'package:app_ecommerce/core/constant/app_colors.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: (){
                      
                    },
                    icon: const Icon(Icons.arrow_back_ios_new,),
                    color: AppColor.blueZ,
                  ),
                  MaterialButton(
                    onPressed: () {},
                    child: const Text(
                      "Cart",
                      style: TextStyle(
                          fontSize: 25,
                          color: AppColor.blueX,
                          fontWeight: FontWeight.w600,
                          fontFamily: "sans"),
                    ),
                  ),
                IconButton(onPressed: (){}, icon: Icon(Icons.delete_outline))
                ],
              );
  }
}