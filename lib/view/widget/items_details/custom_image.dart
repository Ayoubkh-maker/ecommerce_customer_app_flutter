
import 'package:app_ecommerce/controller/items_details_controller.dart';
import 'package:app_ecommerce/core/API/api_link.dart';
import 'package:app_ecommerce/core/constant/app_colors.dart';
import 'package:app_ecommerce/view/widget/app_bare.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CustomeImage extends GetView<ItemsDetailsControllerImp>{

  const CustomeImage({super.key, });

  @override
  Widget build(BuildContext context) {

    return    Container(
      // color: Colors.red,
      width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(top: 30),
        alignment: Alignment.center,
        // height: 450,
   
        
        child: 
      Stack(
        
        children: [
          
         Align(
          alignment: Alignment.center,
          child: Hero(
           
            tag: "${controller.itemsModel!.itemsId}",
            child: CachedNetworkImage(imageUrl: "$itemsImage/${controller.itemsModel!.itemsImage}")),),
        
         
         Padding(
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 20),
             child: CostumAppbare(
              title: "" ,
          
              doiconRight: (){},  
              iconLeft: const Icon(color:  AppColor.blueX, Icons.arrow_left_sharp,   size: 30,) ,            
              iconRight:const Icon( color:  AppColor.blueX, Icons.favorite_outline , size: 30, ), 
              doIconLeft: () { controller.backtoHome(); } 
                           ,  ),
           ),
         
      ],
      
      
      )
    
      ,);
  }
}