// ignore_for_file: file_names


import 'package:app_ecommerce/core/class/status_request.dart';
import 'package:app_ecommerce/core/constant/routepages.dart';
import 'package:app_ecommerce/core/function/handlingdata.dart';
import 'package:app_ecommerce/data/source/datasource/remote/auth/forgetpassword/verifycodedata.dart';
import 'package:get/get.dart';

abstract class VerifyCode extends GetxController {

gotoRessetpassword(String verifyCode);


}

class VerifyCodeImp extends VerifyCode {

VerifycodeData verifycodeData = VerifycodeData(crud: Get.find());  
StatusRequest statusRequest = StatusRequest.none ;
String ? email ;


  @override
  gotoRessetpassword(verifyCode)async {
    statusRequest = StatusRequest.loading ;
    update();
    var response = await verifycodeData.postdata(email!, verifyCode);
    statusRequest = handlingdata(response);
    if(statusRequest == StatusRequest.success){
      if(response['status'] == "success"){
       Get.offAllNamed(RoutePages.ressetPassword, arguments: {
        "email" : email
       });
      }else{
        Get.defaultDialog(title: "Warning" , middleText: "the code doesnt correcte");
        statusRequest = StatusRequest.failure ;
      }
    }
    update();


  }

  
 
@override
  void onInit() {
 email = Get.arguments["email"];
    super.onInit();
  }
}