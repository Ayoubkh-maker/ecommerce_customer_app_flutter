import 'package:app_ecommerce/core/class/status_request.dart';
import 'package:app_ecommerce/core/constant/routepages.dart';
import 'package:app_ecommerce/core/function/handlingdata.dart';
import 'package:app_ecommerce/core/services/services.dart';
import 'package:app_ecommerce/data/model/address_model.dart';
import 'package:app_ecommerce/data/source/datasource/remote/address_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AddressController extends GetxController {
  goaddressDetails();
  addAddress();
  getAddress();
  back();

}

class AddressControllerImp extends AddressController {
  double lat = 21518.2535;
  double long = 215658.2535;
  Myservices myservices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  AddressData addressData = AddressData(crud: Get.find());

  late TextEditingController namecontroller;
  late TextEditingController citycontroller;
  late TextEditingController streetcontroller;

  List<AdressModel> data = [];

  @override
  addAddress() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.addAdress(
      myservices.sharedPreferences.getString("usersId").toString(),
      namecontroller.text,
      citycontroller.text,
      streetcontroller.text,
      lat.toString(),
      long.toString(),
    );
    print("-----------------------------$response");
    statusRequest = handlingdata(response);
    print(statusRequest);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        Get.offAllNamed(RoutePages.homePage);
        Get.snackbar("Success", "the informations are saved");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  delete(addressid) {
    addressData.deleteAdress(addressid);
    data.removeWhere((element) => element.addressId == addressid);
    update(); 
  }

  @override
  getAddress() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.viewAdress(
      myservices.sharedPreferences.getString("usersId").toString(),
    );

    statusRequest = handlingdata(response);
    print(statusRequest);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        List responsedata = response["data"];
        data.addAll(responsedata.map((e) => AdressModel.fromJson(e)));
        print("$responsedata--------------------------------");
   
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    namecontroller = TextEditingController();
    citycontroller = TextEditingController();
    streetcontroller = TextEditingController();
    getAddress();
    super.onInit();
  }

  @override
  goaddressDetails() {
    Get.toNamed(RoutePages.addressDeatils);
  }

  // @override
  // apply() {
  //   Get.offAllNamed(RoutePages.homePage);
  // }

  @override
  back() {
    Get.back();
  }
}
