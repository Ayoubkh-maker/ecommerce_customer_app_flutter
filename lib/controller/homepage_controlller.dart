import 'package:app_ecommerce/core/class/status_request.dart';
import 'package:app_ecommerce/core/constant/routepages.dart';
import 'package:app_ecommerce/core/function/handlingdata.dart';
import 'package:app_ecommerce/core/services/services.dart';
import 'package:app_ecommerce/data/model/items_models.dart';
import 'package:app_ecommerce/data/model/pub_model.dart';
import 'package:app_ecommerce/data/source/datasource/remote/homedata.dart';
import 'package:flutter/material.dart';


import 'package:get/get.dart';

abstract class Homecontroller extends GetxController {

inihomepage();
getdata();
gotoItems(List categories , int selectCateg , String categoriesid , ItemsModel itemsModel);


}

class HomecontrollerImp extends Homecontroller {

GlobalKey<ScaffoldState> key = GlobalKey(); 

  Myservices myservices = Get.find();

  String? username ;
  
  String? phone ;

  int? deliveryTime ;

  List<PubModel> pub = [] ;
  List categories = [] ;
  List items = [];
  ItemsModel itemsModel = ItemsModel();

   Homedata homedata = Homedata(crud: Get.find()); 

   StatusRequest statusRequest = StatusRequest.none ;



  @override
  getdata() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await homedata.postdata();
    statusRequest = handlingdata(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        categories.addAll(response['categories']['data']);
        items.addAll(response["items"]['data']);
        List responsepub = response['pub']['data'];
        pub.addAll(responsepub.map((e) => PubModel.fromJson(e)));

      deliveryTime = pub[0].pubDeliveryTime;

      myservices.sharedPreferences.setInt("deliveryTime", deliveryTime!);



      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }


 
 
 
 
 
  @override
  inihomepage() {
    // username = myservices.sharedPreferences.getString('username');
    // userId = myservices.sharedPreferences.getInt("1");
     username = myservices.sharedPreferences.getString("username");
      phone = myservices.sharedPreferences.getString("usersPhone");

  }


  @override
  void onInit() {

    getdata();
    inihomepage();
    super.onInit();
  }
  @override
  void dispose() {
 getdata();
    inihomepage();  
    super.dispose();
  }
  
  @override
  gotoItems(categories , selectCateg , categoriesid , itemsModel )  {
  Get.toNamed(RoutePages.items, arguments: {
  "categories": categories ,
  "selectCateg" : selectCateg,
  "catid" : categoriesid ,
  "itemsModel" : itemsModel 
  });
  }

    goItemsDetails(itemsModel) {
   Get.toNamed(RoutePages.itemsDatails , arguments: {
   "itemsModel" : itemsModel 
   });
  }
  

  
  
  
}