import 'package:app_ecommerce/core/class/status_request.dart';
import 'package:app_ecommerce/core/constant/routepages.dart';
import 'package:app_ecommerce/core/function/handlingdata.dart';
import 'package:app_ecommerce/core/services/services.dart';
import 'package:app_ecommerce/data/model/cart_model.dart';
import 'package:app_ecommerce/data/model/coupon_model.dart';
import 'package:app_ecommerce/data/source/datasource/remote/cart_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CartController extends GetxController {
  addCart(String itemsid);
  removeCart(String itemsid);
  couponCheck();
  view();
  backDetailsItems();
  reseVarcart();
  getTotalprice();
  refrshPage();
  gocheckOut();
}

class CartControllerImp extends CartController {
  List<Cartmodel> data = [];
  double totalprice = 0.0;
  int totalitems = 0;
  late TextEditingController couponControl;
  late CouponModel couponModel;
  Myservices myservices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  Cartdata cartdata = Cartdata(crud: Get.find());
  int couponDiscount = 0 ;
  String? couponname ;
  int? couponid ;

  

 @override
   getTotalprice(){
    return ((totalprice - totalprice * couponDiscount / 100).toStringAsFixed(2));
   }


  @override
  gocheckOut() {
    if(data.isEmpty) return Get.snackbar("!!!", "the cart is empty");
  Get.toNamed(RoutePages.checkout , arguments: {
    "couponid" : couponid ?? 1 ,
    "orderprice" : totalprice ,
    "couponDiscount" : couponDiscount ,

  });
  }



  @override
  addCart(itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartdata.adddata(
        itemsid, myservices.sharedPreferences.getString("usersId").toString());
    print("-----------------------------$response");
    statusRequest = handlingdata(response);
    print(statusRequest);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        // Get.rawSnackbar(
        //     title: "Favorites", message: "Your items is added in your cart");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }



  @override
  removeCart(itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartdata.removedata(
        itemsid, myservices.sharedPreferences.getString("usersId").toString());
    print("-----------------------------$response");
    statusRequest = handlingdata(response);
    print(statusRequest);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        // Get.rawSnackbar(
        //     title: "Favorites", message: "Your items is removed in your cart");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

  @override
  view() async {
  
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartdata
        .viewData(myservices.sharedPreferences.getString("usersId").toString());
    print("----------------data ?-------------$response");
    statusRequest = handlingdata(response);
    print(statusRequest);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        if (response["datacart"]["status"] == "success") {
          List responsedata = response["datacart"]["data"];
          data.addAll(responsedata.map((e) => Cartmodel.fromJson(e)));
          Map dataresponsecountItems = response["countprice"];
          totalprice = dataresponsecountItems["totalprice"];
          totalitems = dataresponsecountItems["totalcount"];
          print("------------------------totalPrice------------------");
          print("$totalprice");
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  couponCheck() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartdata.couponData(couponControl.text);

    print("-----------------------------$response");
    statusRequest = handlingdata(response);
    print(statusRequest);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        Map<String, dynamic> coupondata = response["data"];
        couponModel = CouponModel.fromJson(coupondata);
        couponDiscount = couponModel.couponDiscount! ;
        couponname = couponModel.couponName! ;
        couponid = couponModel.couponId! ;
      
      } else {
        Get.snackbar("Coupon Code", "please verify your coupon code");
                couponDiscount = 0 ;
                couponname = null ;
                couponid = null ;
      }
    }

    update();
  }

  @override
  backDetailsItems() {
    Get.back();
  }

  @override
  void onInit() {
    
    couponModel = CouponModel();
    couponControl = TextEditingController();
    view();
    super.onInit();
  }

  @override
  reseVarcart() {
    totalitems = 0;
    totalprice = 0.0;
    data.clear();
  }

  @override
  refrshPage() {
    view();
    reseVarcart();
    
  }
  

}
