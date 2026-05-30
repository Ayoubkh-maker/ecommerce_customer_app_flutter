import 'package:app_ecommerce/core/class/status_request.dart';

import 'package:app_ecommerce/core/function/handlingdata.dart';
import 'package:app_ecommerce/core/services/services.dart';
import 'package:app_ecommerce/data/model/orders_model.dart';
import 'package:app_ecommerce/data/source/datasource/remote/pending_data.dart';
import 'package:get/get.dart';

abstract class PendingController extends GetxController {
  orderPending();
  deleteOrder(String orderid);
  printOrderType(String val);
  printpaymentType(String val);
  printOrderStatus(String val);

}

class PendingControllerImp extends PendingController {
  List<OrdersModel> data = [];
  StatusRequest statusRequest = StatusRequest.none;
  PendingData pendingData = PendingData(crud: Get.find());
  Myservices myservices = Get.find();

  @override
  orderPending() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await pendingData
        .getdata(myservices.sharedPreferences.getString("usersId").toString());

    statusRequest = handlingdata(response);
    print(statusRequest);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        List responsedata = response["data"];
        data.addAll(responsedata.map((e) => OrdersModel.fromJson(e)));

        print("$responsedata");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

    @override
  deleteOrder(String orderid) async {
 
    statusRequest = StatusRequest.loading;
    update();
    var response = await pendingData
        .deletedata(orderid);

    statusRequest = handlingdata(response);
    print(statusRequest);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        // List dataresponse = response["data"];
        //         dataresponse.removeWhere((element) => element.ordersId == orderid);
       
refrechOrder();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
refrechOrder(){
    orderPending();
}
  @override
  void onInit() {
refrechOrder();
    super.onInit();
  }

  @override
  String printOrderStatus(String val) {
    if (val == "0") {
      return "Pending Approval";
    } else if (val == "1") {
      return "The Order is being prepered";
    } else if (val == "2") {
      return "the order get him the delivery";
    }else if (val == "3") {
      return "On the way";
    } else {
      return "Archive";
    }
  }

  @override
  String printOrderType(String val) {
    if (val == "0") {
      return "Delivery";
    } else {
      return "Recive";
    }
  }

  @override
  String printpaymentType(String val) {
    if (val == "0") {
      return "Cash";
    } else {
      return "Card";
    }
  }


}
