

import 'package:app_ecommerce/core/class/status_request.dart';
import 'package:app_ecommerce/core/function/handlingdata.dart';
import 'package:app_ecommerce/core/services/services.dart';
import 'package:app_ecommerce/data/source/datasource/remote/favorite_data.dart';
import 'package:get/get.dart';

abstract class FavoritesControlller extends GetxController{

setFavorites(id , val);
addFavorites(String id);
removeFavorie(String id);


}


class FavoritesControlllerImp extends FavoritesControlller {



Map isFavorites = {} ;



  @override
  setFavorites(id , val) {
  isFavorites[id] = val ;
  update();

  }




 Myservices myservices = Get.find();



   FavoriteData favoriteData = FavoriteData(crud: Get.find()); 

   StatusRequest statusRequest = StatusRequest.none ;



  @override
  addFavorites(id) async {

    statusRequest = StatusRequest.loading;
    update();
    var response = await favoriteData.addData( id  , myservices.sharedPreferences.getString("usersId").toString());
    statusRequest = handlingdata(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
     Get.rawSnackbar(title: "Favorites" , message: "Your items is added in your Favorites");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

 
  }



  @override
  removeFavorie(id) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await favoriteData.removeData( id  , myservices.sharedPreferences.getString("usersId").toString());
    print("...................response $response");
    statusRequest = handlingdata(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
    Get.rawSnackbar(title: "Favorites" , message: "Your items is remove in your Favorites");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }


  }







  
}