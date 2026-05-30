
import 'package:app_ecommerce/core/API/api_link.dart';
import 'package:app_ecommerce/core/class/crud.dart';

class ArchiveData {

Crud crud ;

ArchiveData({required this.crud});




    getdata(userid) async {
    var response = await crud.postData(archivelink,
     {"userId": userid});
    return response.fold((l) => l, (r) => r);
  }
  
      ratingdata(String orderid , String rating ,String  comment ) async {
    var response = await crud.postData(ratinglink,
     {"orderid": orderid ,
      "rating" :  rating,
      "comment" : comment
     });
    return response.fold((l) => l, (r) => r);
  }
}





