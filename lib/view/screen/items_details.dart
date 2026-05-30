import 'package:app_ecommerce/controller/items_details_controller.dart';
import 'package:app_ecommerce/core/class/handlingdataview.dart';
import 'package:app_ecommerce/core/constant/app_colors.dart';
import 'package:app_ecommerce/view/widget/items_details/Custom_size_color.dart';
import 'package:app_ecommerce/view/widget/items_details/Custom_ti_pr_dscr.dart';
import 'package:app_ecommerce/view/widget/items_details/custom_addtocard.dart';

import 'package:app_ecommerce/view/widget/items_details/custom_image.dart';
import 'package:app_ecommerce/view/widget/items_details/topTitle.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsDetails extends StatelessWidget {
  const ItemsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsDetailsControllerImp());
    return Scaffold(
        body: GetBuilder<ItemsDetailsControllerImp>(builder: (controller){
          return HandlingDataView(statusRequest: controller.statusRequest, widget: Column(
      children: [
        // image
        const Expanded(flex: 30, child: CustomeImage()),
        const TopTitle(),

        // information image

        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          height: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50), color: AppColor.blueZ),
          child: const Column(
            children: [
              CustomTiPrDesc(),
              CustomSizeColor(),
            ],
          ),
        ),

        const Spacer(),

       const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child:  CostumAddToCard())
      ],
    ));
        })
       
        
        
        
        );
  }
}
