// ignore_for_file: file_names

import 'package:app_ecommerce/core/class/status_request.dart';
import 'package:app_ecommerce/core/function/handlingdata.dart';
import 'package:app_ecommerce/data/source/datasource/remote/testdata.dart';
import 'package:get/get.dart';

class TestController extends GetxController {
  Testdata testdata = Testdata(crud: Get.find());

  List data = [];
  late StatusRequest statusRequest;

  getdata() async {
    statusRequest = StatusRequest.loading;
    var response = await testdata.getdata();
    statusRequest = handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

  @override
  void onInit() {
    getdata();
    super.onInit();
  }
}
