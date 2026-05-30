// ignore_for_file: file_names


import 'package:app_ecommerce/core/constant/routepages.dart';

import 'package:get/get.dart';

abstract class SuccessOperationController extends GetxController {

backLogin();

}

class SuccessOperationControllerImp extends SuccessOperationController {



  @override
  backLogin() {
   Get.offNamed(RoutePages.login);
  }


}