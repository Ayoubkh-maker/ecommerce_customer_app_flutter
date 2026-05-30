import 'package:app_ecommerce/core/class/status_request.dart';
import 'package:app_ecommerce/core/function/handlingdata.dart';
import 'package:app_ecommerce/core/services/services.dart';
import 'package:app_ecommerce/data/model/orderdetailsmodel.dart';
import 'package:app_ecommerce/data/model/orders_model.dart';
import 'package:app_ecommerce/data/source/datasource/remote/ordersDetails_data.dart';
import 'package:get/get.dart';

abstract class OrdersDetails extends GetxController{

ordersDetails();

}
class OrdersdetailsImp extends OrdersDetails{

 late OrdersModel ordersModel ;

 List<OrdersDetailsModel> data = [];
  StatusRequest statusRequest = StatusRequest.none;
  OrdersDetailsData ordersDetailsData = OrdersDetailsData(crud: Get.find());
  Myservices myservices = Get.find();

  @override
  ordersDetails() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersDetailsData.getdata(ordersModel.ordersId.toString());
        
    statusRequest = handlingdata(response);
    print(statusRequest);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        List responsedata = response["data"];
        data.addAll(responsedata.map((e) => OrdersDetailsModel.fromJson(e)));

        print("$responsedata");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }





@override
  void onInit() {

    ordersModel = Get.arguments["odermodel"];
    ordersDetails();
  

    super.onInit();
  }


}