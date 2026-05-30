import 'package:app_ecommerce/core/class/status_request.dart';
import 'package:app_ecommerce/core/function/handlingdata.dart';
import 'package:app_ecommerce/core/services/services.dart';
import 'package:app_ecommerce/data/model/orders_model.dart';
import 'package:app_ecommerce/data/source/datasource/remote/archive_dart.dart';
import 'package:get/get.dart';

abstract class ArchiveController extends GetxController {
  archive();

  printOrderType(String val);
  printpaymentType(String val);
  printOrderStatus(String val);
  submentRating(int orderid , double rating , String comment  );

}

class ArchiveControllerImp extends ArchiveController {
  List<OrdersModel> data = [];
  StatusRequest statusRequest = StatusRequest.none;
  ArchiveData archiveData = ArchiveData(crud: Get.find());
  Myservices myservices = Get.find();
 
  @override
  archive() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await archiveData
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
  submentRating(int orderid , double rating , String comment  ) async {
   data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await archiveData
        .ratingdata(orderid.toString() , rating.toString() , comment );

    statusRequest = handlingdata(response);
    print(statusRequest);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        archive();
        print("success");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }


refrechOrder(){
    archive();
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
