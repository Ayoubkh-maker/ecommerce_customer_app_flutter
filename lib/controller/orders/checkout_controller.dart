import 'package:app_ecommerce/core/class/status_request.dart';
import 'package:app_ecommerce/core/constant/routepages.dart';
import 'package:app_ecommerce/core/function/handlingdata.dart';
import 'package:app_ecommerce/core/services/services.dart';
import 'package:app_ecommerce/data/model/address_model.dart';
import 'package:app_ecommerce/data/source/datasource/remote/address_data.dart';
import 'package:app_ecommerce/data/source/datasource/remote/checkout_data.dart';
import 'package:get/get.dart';

abstract class CheckoutController extends GetxController {
  choosePayemnt(String val);
  chooseDelivery(String val);
  chooseShippingAddress(String val);
  checkout();
  goHome();
  goAddress();
  getShippingAddress();
}

class CheckoutControllerImp extends CheckoutController {
  AddressData addressData = Get.put(AddressData(crud: Get.find()));
  Checkoutdata checkoutdata = Get.put(Checkoutdata(crud: Get.find()));

  List<AdressModel> dataShipping = [];
  Myservices myservices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  late int couponid;
  late int couponDiscount;
  late double orderprice; // price for items without deliveryprice or coupon
 
  String? paymentMethode;
  String? deliveryTypa;
  String shpppingAddress = "0";

  @override
  chooseDelivery(val) {
    deliveryTypa = val;
    update();
  }

  @override
  choosePayemnt(val) {
    paymentMethode = val;
    update();
  }

  @override
  chooseShippingAddress(val) {
    shpppingAddress = val;
    update();
  }

  @override
  goHome() {}

  @override
  getShippingAddress() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.viewAdress(
      myservices.sharedPreferences.getString("usersId").toString(),
    );

    statusRequest = handlingdata(response);
    print(statusRequest);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        List responsedata = response["data"];
        dataShipping.addAll(responsedata.map((e) => AdressModel.fromJson(e)));
       shpppingAddress = dataShipping[0].addressId.toString();
        print("$responsedata--------------------------------");
      } else {
        statusRequest = StatusRequest.none;
      }
    }
    update();
  }

  @override
  checkout() async {
    if (paymentMethode == null)
      return Get.snackbar("ereur", "Please select your payment method");
    if (deliveryTypa == null)
      return Get.snackbar("ereur", "Please select your order type");

      if(dataShipping.isEmpty){
          return Get.snackbar("ereur", "Please select your Address");
      }

    statusRequest = StatusRequest.loading;
    update();

    Map data = {
      "userId": myservices.sharedPreferences.getString("usersId").toString(),
      "address": shpppingAddress.toString(),
      "orderstype": deliveryTypa.toString(),
      "pricedelivery": "10",
      "payemntmethode": paymentMethode.toString(),
      "ordersprice": orderprice.toString(),
      "couponid": couponid.toString(),
      "couponDiscount": couponDiscount.toString(),
    };
    var response = await checkoutdata.checkout(data);

    print("-----------------------------$response");
    statusRequest = handlingdata(response);
    print(statusRequest);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        Get.offNamed(RoutePages.homePage);
        Get.snackbar("Success", "the order is get succed");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    couponid = Get.arguments["couponid"];
    orderprice = Get.arguments["orderprice"];
    couponDiscount = Get.arguments["couponDiscount"];

    getShippingAddress();
    super.onInit();
  }

  @override
  goAddress() {
    Get.offNamed(RoutePages.addresspage);
  }
}
