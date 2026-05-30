
import 'package:app_ecommerce/core/class/status_request.dart';
import 'package:app_ecommerce/core/constant/routepages.dart';
import 'package:app_ecommerce/core/function/handlingdata.dart';
import 'package:app_ecommerce/core/services/services.dart';
import 'package:app_ecommerce/data/model/items_models.dart';
import 'package:app_ecommerce/data/source/datasource/remote/cart_data.dart';
import 'package:get/get.dart';

abstract class ItemsDetailsController extends GetxController {
  backtoHome();
  gotoCart();
  add();
  remove();
  removeCart(String itemsid);
  addCart(String itemsid);
  getcount(String itemsid);
}

class ItemsDetailsControllerImp extends ItemsDetailsController {

   ItemsModel? itemsModel;
  StatusRequest statusRequest = StatusRequest.none;
    Cartdata cartdata = Cartdata(crud: Get.find());
  Myservices myservices = Get.find();

  int countItems = 0;

  initiaData()async  {
 
    statusRequest = StatusRequest.loading ;
     itemsModel = Get.arguments["itemsModel"];
    countItems = await getcount(itemsModel!.itemsId.toString());
    statusRequest = StatusRequest.success;
    update();
      
  }
  
  @override
  addCart(itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartdata.adddata(
        itemsid, myservices.sharedPreferences.getString("usersId").toString());
    print("-----------------------------$response");
    statusRequest = handlingdata(response);
    print(statusRequest);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        Get.rawSnackbar(
            title: "Favorites", message: "Your items is added in your cart");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  removeCart(itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartdata.removedata(
        itemsid, myservices.sharedPreferences.getString("usersId").toString());
    print("-----------------------------$response");
    statusRequest = handlingdata(response);
    print(statusRequest);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        Get.rawSnackbar(
            title: "Favorites", message: "Your items is removed in your cart");
      } else {
        statusRequest = StatusRequest.failure;
      }
      
    }
    
update();
  }

  @override
  getcount(String itemsid) async {
    int countItems = 0;
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartdata.countData(
        itemsid, myservices.sharedPreferences.getString("usersId").toString());
    print("----------------data ?-------------$response");
    statusRequest = handlingdata(response);
    print(statusRequest);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        countItems = response["data"];
        print(
            "---------------------------------------cart----------------------------");
        print("$countItems");
        return countItems;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }





  @override
  void onInit()async {
        
  
    
   itemsModel = ItemsModel();
    initiaData();
    super.onInit();
  }

  @override
  backtoHome() {
    Get.back();
  }
  
  @override
  add() {
    addCart(itemsModel!.itemsId.toString());
   countItems++;
    update();
  }
  
  @override
  remove() {
   if(countItems > 0){
    removeCart(itemsModel!.itemsId.toString());
    countItems -- ;
    update();
   }
  }
  
  @override
  gotoCart() {
  Get.offNamed(RoutePages.cart);
  }
}
