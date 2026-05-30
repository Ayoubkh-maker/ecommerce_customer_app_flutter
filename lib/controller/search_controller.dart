import 'package:app_ecommerce/core/class/status_request.dart';
import 'package:app_ecommerce/core/constant/routepages.dart';
import 'package:app_ecommerce/core/function/handlingdata.dart';
import 'package:app_ecommerce/core/services/services.dart';
import 'package:app_ecommerce/data/model/items_models.dart';
import 'package:app_ecommerce/data/source/datasource/remote/search_data.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class SearchController extends GetxController {
  searchItems();
}

class SearchControllerImp extends SearchController {
  List<ItemsModel> data = [];
  Myservices myservices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;
  Searchdata searchdata = Searchdata(crud: Get.find());
   ItemsModel? itemsModel;
  late TextEditingController search;

  goItemDetails(ItemsModel itemsModel) {
    Get.toNamed(RoutePages.itemsDatails,
        arguments: {"itemsModel": itemsModel}
        );
  }

  @override
  searchItems() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await searchdata.search(search.text);
    print("$response-----------------------search");
    statusRequest = handlingdata(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        data.clear();
        List responsedata = response['data'];
        data.addAll(responsedata.map((e) => ItemsModel.fromJson(e)));
        print("$statusRequest---------------------------");
      } else {
        statusRequest = StatusRequest.failure;
        print("$statusRequest---------------------------");
      }
    }

    update();
  }

  @override
  void onInit() {
    //  itemsModel = ItemsModel();
    search = TextEditingController();
    super.onInit();
  }
}
