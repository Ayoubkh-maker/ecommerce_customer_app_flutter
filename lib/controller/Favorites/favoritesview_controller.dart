import 'package:app_ecommerce/core/class/status_request.dart';
import 'package:app_ecommerce/core/function/handlingdata.dart';
import 'package:app_ecommerce/core/services/services.dart';
import 'package:app_ecommerce/data/model/favorites_model.dart';
import 'package:app_ecommerce/data/source/datasource/remote/favorite_data.dart';
import 'package:get/get.dart';

abstract class FavoritesViewController extends GetxController {}

class FavoritesViewControllerImp extends FavoritesViewController {
  // List<FavoritesModel> data = [];

  List<FavoritesModel> data = [] ;

  Myservices myservices = Get.find();

  FavoriteData favoriteData = FavoriteData(crud: Get.find());

  StatusRequest statusRequest = StatusRequest.none;
  
  get categories => null;

  getdataView () async {

     statusRequest = StatusRequest.loading;
    update();
    var response = await favoriteData.getdataView(myservices.sharedPreferences.getString("usersId").toString());
    statusRequest = handlingdata(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        List responseJson = response['data'];
        data.addAll(responseJson.map((e) => FavoritesModel.fromJson(e)));
        print('''''''''''''''''''''''''''''''''''''''data''''''''''''''''''''''''''''''''''''''');
        print(data);
        // data.addAll(response['data']);
        
       
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
 

  }


  deleteFromfav(String deletefav){
  var response =  favoriteData.deleteFavorite(deletefav);
  print("$response-----------------------------------------------------------------");
  data.removeWhere((element) => element.favoritesId == deletefav);
  update();


  }

  @override
  void onInit() {
  getdataView();
    super.onInit();
  }
}
