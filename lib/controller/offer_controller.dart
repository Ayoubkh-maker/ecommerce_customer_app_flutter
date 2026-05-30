import 'package:app_ecommerce/core/class/status_request.dart';
import 'package:app_ecommerce/core/function/handlingdata.dart';
import 'package:app_ecommerce/data/model/items_models.dart';
import 'package:app_ecommerce/data/source/datasource/remote/offer_data.dart';
import 'package:get/get.dart';

abstract class OfferController extends GetxController {}

class OfferControllerImp extends OfferController {
  OfferData offerData = OfferData(crud: Get.find());

  List<ItemsModel> data = [];
  late StatusRequest statusRequest;

  getdata() async {
    statusRequest = StatusRequest.loading;
    var response = await offerData.getdata();
    statusRequest = handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List responsedata = response["data"];
        data.addAll(responsedata.map((e) => ItemsModel.fromJson(e)));
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
