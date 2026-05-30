import 'package:app_ecommerce/controller/Favorites/favorites_controlller.dart';
import 'package:app_ecommerce/controller/offer_controller.dart';
import 'package:app_ecommerce/core/class/handlingdataview.dart';
import 'package:app_ecommerce/view/widget/offer/customlistoffer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Offer extends StatelessWidget {
  const Offer({super.key});

  @override
  Widget build(BuildContext context) {
 Get.put(OfferControllerImp());
 Get.put(FavoritesControlllerImp());

 return Scaffold(appBar: AppBar(title: Text("Offers"),),
 body:  ListView(
      children: [
        GetBuilder<OfferControllerImp>(builder: (controller){
          return HandlingDataView(statusRequest: controller.statusRequest, widget: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: controller.data.length,
            itemBuilder:  (context, index) {
              
            return Container(
              padding: EdgeInsets.all(20),
              child: CustomListoffer(itemsModel: controller.data[index],));
          }));
        })
      ],
    )  ,
 );


    // return 
   
  }
}