
import 'package:app_ecommerce/core/class/status_request.dart';
import 'package:app_ecommerce/core/constant/routepages.dart';
import 'package:app_ecommerce/core/function/handlingdata.dart';
import 'package:app_ecommerce/data/source/datasource/remote/auth/forgetpassword/reseetpassworddata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class RessetPassword extends GetxController {

ressetPassword();
changeShowPass();
}

class RessetPasswordImp extends RessetPassword  {

GlobalKey<FormState> keyvalid = GlobalKey<FormState>();

late TextEditingController password ;
late TextEditingController repPassword ;

  bool isShow = true ;
  String? email ;
  StatusRequest statusRequest = StatusRequest.none ;
  RessetPasswordData ressetPasswordData = RessetPasswordData(crud: Get.find());

@override
  changeShowPass(){
  isShow = isShow == true ? false : true ;
  update();
}

    @override
  ressetPassword()async {
    if(password.text != repPassword.text){
  return Get.defaultDialog(title: "warning" , middleText: "The password doesnt match");
    }

   if(keyvalid.currentState!.validate()){
   statusRequest = StatusRequest.loading ;
   update();
   var response = await ressetPasswordData.postdata(email!, password.text);
   statusRequest = handlingdata(response);
   if(statusRequest == StatusRequest.success){
    if(response['status'] == "success"){
     Get.toNamed(RoutePages.succesOperation);
    }else{
       Get.defaultDialog(title: "warning" , middleText: "Try again");
       statusRequest = StatusRequest.failure;
    }
   }
        
    }else{
      // ignore: avoid_print
      print("not valid");
    }
    update();
  }


  @override
  void onInit() {
    email = Get.arguments['email'];
  password = TextEditingController();
  repPassword = TextEditingController();
    super.onInit();
  }
  
  @override
  void dispose() {
  password = TextEditingController();
  repPassword = TextEditingController();
    super.dispose();
  }


}