import 'package:app_ecommerce/controller/items_details_controller.dart';
import 'package:app_ecommerce/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CostumAddToCard extends GetView<ItemsDetailsControllerImp> {
  const CostumAddToCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
        SizedBox(height: 20,),
       
       
        InkWell(
          onTap: (){
        controller.gotoCart();
          },
          child: Container(
            
           margin: const EdgeInsets.symmetric(horizontal: 30),
            height: 50,
            width: 600,
            
            child: Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text("Add to card" , style:  TextStyle(color: Colors.white , fontWeight: FontWeight.bold,),textAlign: TextAlign.center,  )),
            decoration: BoxDecoration(color: AppColor.blueZ,borderRadius: BorderRadius.circular(50), ),  ),
        ),
    ],);
  }
}