
import 'package:app_ecommerce/core/API/api_link.dart';
import 'package:app_ecommerce/core/class/crud.dart';
class FavoriteData {

Crud crud ;

FavoriteData({required this.crud});



addData(id , userid) async{
  var response = await crud.postData(addFavorites, {
    "itemsId" : id ,
    "userId" : userid 
  });
  return response.fold((l) => l, (r) => r);
}

removeData(id , userid) async{
   var response = await crud.postData(removeFAvorites, {
   "itemsId" : id ,
   "userId" : userid 
   });
   return response.fold((l) => l, (r) => r);
}

getdataView(userid)async{
  var response = await crud.postData( viewFavorites, {
      "userId" : userid 
  });
  return response.fold((l) => l, (r) => r) ;
}

deleteFavorite (favorID)async{
var response = await crud.postData(deletefromFav, {
"favoriteId" : favorID
});
return response.fold((l) => l, (r) => r);

}

}