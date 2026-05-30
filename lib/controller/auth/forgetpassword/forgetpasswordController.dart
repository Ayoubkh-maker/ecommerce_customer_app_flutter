// ignore_for_file: file_names


import 'package:app_ecommerce/core/class/status_request.dart';
import 'package:app_ecommerce/core/constant/routepages.dart';
import 'package:app_ecommerce/core/function/handlingdata.dart';
import 'package:app_ecommerce/data/source/datasource/remote/auth/forgetpassword/checkemail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {


forgetPassword();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {

GlobalKey<FormState> keyvalid = GlobalKey<FormState>();
CheckemailData checkemailData = CheckemailData(crud: Get.find());
StatusRequest statusRequest = StatusRequest.none ;

late TextEditingController  email ;
 @override
  forgetPassword() async {
   if(keyvalid.currentState!.validate()){
     statusRequest = StatusRequest.loading ;
     update();
     var response = await checkemailData.postdata(email.text);
     statusRequest = handlingdata(response);
     if(statusRequest == StatusRequest.success){
      if(response['status'] == "success"){
     Get.toNamed(RoutePages.verifyCode , arguments: {
      "email" : email.text ,
     });
      }else{
        Get.defaultDialog(title:"warning" , middleText: "the email doesnt correct");
        statusRequest = StatusRequest.failure ;
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
    email = TextEditingController();
    super.onInit();
  }
    @override
void dispose() {
     email = TextEditingController();
    super.dispose();
  } 
  }
  
 

