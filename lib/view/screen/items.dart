
import 'package:app_ecommerce/controller/Favorites/favorites_controlller.dart';
import 'package:app_ecommerce/controller/itemspage_controller.dart';
import 'package:app_ecommerce/core/class/handlingdataview.dart';
import 'package:app_ecommerce/core/constant/app_colors.dart';
import 'package:app_ecommerce/data/model/items_models.dart';
import 'package:app_ecommerce/view/widget/app_bare.dart';
import 'package:app_ecommerce/view/widget/items/customlistitems.dart';
import 'package:app_ecommerce/view/widget/items/listcategoriesitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ItemsPage extends StatelessWidget {
  const ItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
     Get.put(ItemsControllerImp());
     FavoritesControlllerImp controllerFav = Get.put(FavoritesControlllerImp());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),

        child: GetBuilder<ItemsControllerImp>(builder: (controller) {
          return  ListView(
          children: [
          CostumAppbare(title: "Hello again!",
           iconLeft: const   Icon(
                            color:  AppColor.blueX,
                            Icons.favorite_border,
                            size: 30,
                          ) ,
                iconRight:const Icon(
                            color:  AppColor.blueX,
                            Icons.notifications,
                            size: 30,
                          ), doIconLeft: () { controller.gotoFavorites(); } , 
          ),
        const  SizedBox(height: 60,),
        const  ListCategoriesItems(),
        const  SizedBox(height: 30,),
           HandlingDataView(statusRequest: controller.statusRequest, widget:
          GridView.builder(
            shrinkWrap: true ,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.data.length,
            gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 340,
            crossAxisSpacing: 10,
            ),
             itemBuilder: (BuildContext context , index ){
           
              controllerFav.isFavorites[controller.data[index]["items_id"] ] = controller.data[index]["favorites"];
            
              return CustomListItems(itemsModel: ItemsModel.fromJson(controller.data[index]), );
             }
             
             )
         ),
          ],
        );
        
        })
      
      ),
    );
  }
}

      