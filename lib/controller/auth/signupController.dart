// ignore_for_file: file_names


import 'package:app_ecommerce/core/class/status_request.dart';
import 'package:app_ecommerce/core/constant/routepages.dart';
import 'package:app_ecommerce/core/function/handlingdata.dart';
import 'package:app_ecommerce/data/source/datasource/remote/auth/signupdata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignupController extends GetxController {
  signup();
  goToLogin();

}

class SignupControllerImp extends SignupController {

GlobalKey<FormState> keyvalid =  GlobalKey<FormState> () ;

SignupData signupData = SignupData(crud: Get.find());

  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;

StatusRequest statusRequest = StatusRequest.none ;

  @override
  signup() async{
    
try{
      if(keyvalid.currentState!.validate()){
       statusRequest = StatusRequest.loading;
       update();
       var response = await signupData.postdata(username.text, email.text, password.text, phone.text);
       statusRequest = handlingdata(response);
       if(statusRequest == StatusRequest.success){
        if(response['status'] == "success"){
          print("--------------------------------SIGN UP");
          print("$response");

           Get.offAllNamed(RoutePages.verifySignup,arguments: {
            "email" :email.text 
           } );
        }else{
       Get.defaultDialog(title: "warning ",middleText: "phone number or email are exist ");
       statusRequest = StatusRequest.failure ;
        }
       }else{
        // ignore: avoid_print
        print("$statusRequest---------------------------------------");
       }

    }else{
     
      // ignore: avoid_print
      print("not valide");
    }
}catch(e){
  // ignore: avoid_print
  print("$e-------------------------------------");
}

    update();
  }


  @override
  goToLogin() {
    Get.offNamed(RoutePages.login);
  }

  @override
  void onInit() {
   
    username = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }
  

}
