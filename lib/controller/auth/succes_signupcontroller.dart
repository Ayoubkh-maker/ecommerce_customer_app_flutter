// ignore_for_file: file_names


import 'package:app_ecommerce/core/constant/routepages.dart';

import 'package:get/get.dart';

abstract class SuccesSignupController extends GetxController {

gotobackLogin();

}

class SuccesSignupControllerImp extends SuccesSignupController {



  @override
  gotobackLogin() {
   Get.offNamed(RoutePages.login);
  }


}