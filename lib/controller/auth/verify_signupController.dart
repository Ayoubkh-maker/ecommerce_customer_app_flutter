// ignore_for_file: file_names

import 'package:app_ecommerce/core/class/status_request.dart';
import 'package:app_ecommerce/core/constant/routepages.dart';
import 'package:app_ecommerce/core/function/handlingdata.dart';
import 'package:app_ecommerce/data/source/datasource/remote/auth/resendcode.dart';
import 'package:app_ecommerce/data/source/datasource/remote/auth/verifycodedata.dart';

import 'package:get/get.dart';

abstract class VerifysignupController extends GetxController {
  goTosuccesSignup(String verificationCode);

}

class VerifysignupControllerImp extends VerifysignupController {
  VerifycodeSignupdata verifycodeSignupdata = VerifycodeSignupdata(crud: Get.find());
  ResendCodedata  resendCodedata  = ResendCodedata(crud: Get.find());
  String? email;
  
StatusRequest statusRequest = StatusRequest.none ;

  @override
  goTosuccesSignup(verificationCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifycodeSignupdata.postData(email!, verificationCode);
    statusRequest = handlingdata(response);
    if(statusRequest == StatusRequest.success){
      if(response["status"] == "success"){
          Get.offNamed(RoutePages.succesSignup);
      }else{
        Get.defaultDialog(title: "Warning" , middleText: "the code is doest correct ");
        statusRequest = StatusRequest.failure ;
        
      }
    }
 update();
    
  }

updateCode (){
 resendCodedata.updatecode(email);
}




  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
}
