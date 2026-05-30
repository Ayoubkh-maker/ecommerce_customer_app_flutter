import 'package:app_ecommerce/core/class/status_request.dart';
import 'package:app_ecommerce/core/constant/routepages.dart';
import 'package:app_ecommerce/core/function/handlingdata.dart';
import 'package:app_ecommerce/core/services/services.dart';
import 'package:app_ecommerce/data/model/items_models.dart';
import 'package:app_ecommerce/data/source/datasource/remote/items_data.dart';
import 'package:get/get.dart';

abstract class ItemsController extends GetxController {

initial();
changeItems(int val , String catval);
getdata( String  categoriesid );
goItemsDetails(ItemsModel itemsModel);
gotoFavorites();
}
class ItemsControllerImp extends ItemsController {


  List categories = [];
  int? selectCat ;
  String? catid ;
  int? deliveryTime ;

 late ItemsModel itemsModel ;

  Myservices myservices = Get.find();
  
  @override
  initial() {
    categories = Get.arguments['categories'];
    selectCat = Get.arguments['selectCateg'];
    catid = Get.arguments['catid'];
    itemsModel = Get.arguments["itemsModel"];
    deliveryTime = myservices.sharedPreferences.getInt("deliveryTime");
    

    getdata(catid!);
   
  }

  @override
  void onInit() {
   initial();
    super.onInit();
  }
  
  @override
  changeItems(val , catval) {
   selectCat = val ;
   catid = catval ;
   getdata(catid!);
   update();
  }

    ItemsData itemsData = ItemsData(crud: Get.find());

  List data = [];
  late StatusRequest statusRequest;

  @override
  getdata(categoriesid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await itemsData.getdata(categoriesid ,myservices.sharedPreferences.getString("usersId").toString());
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
  goItemsDetails(itemsModel) {
   Get.toNamed(RoutePages.itemsDatails , arguments: {
   "itemsModel" : itemsModel 
   });
  }
  
  @override
  gotoFavorites() {
   Get.toNamed(RoutePages.favorites);
  }


  
}