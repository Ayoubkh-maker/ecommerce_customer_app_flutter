import 'package:app_ecommerce/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCountItems extends GetView<CartControllerImp> {
final String msg ;
  const CustomCountItems( {super.key , required this.msg }) ; 

  @override
  Widget build(BuildContext context) {
    return     Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 40,
                width: double.infinity,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(60)),
                    color: Color(0xffFFF4F0)),
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   const Icon(Icons.shopping_bag, color: Color(0xffE97B3E)),
                  const  SizedBox( 
                      width: 10,
                    ),
                    Text(
                      msg,
                      style:
                         const  TextStyle(color: Color.fromARGB(255, 255, 139, 76)),
                    )
                  ],
                ),
              );
  }
}