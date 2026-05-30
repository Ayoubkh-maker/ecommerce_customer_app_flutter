import 'package:app_ecommerce/controller/items_details_controller.dart';
import 'package:app_ecommerce/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopTitle extends GetView<ItemsDetailsControllerImp> {
  const TopTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return   Container(
          padding: const EdgeInsets.only(top: 12),
          child:   Text("${controller.itemsModel!.itemsName}",textAlign: TextAlign.center,
          style: TextStyle(color:Colors.white ,fontWeight: FontWeight.bold,fontSize: 16),overflow: TextOverflow.ellipsis,maxLines: 1),
          height: 50,
          width: 200,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(50),topLeft: Radius.circular(50)),
              color: AppColor.blueZ
              ),
        );  }
}