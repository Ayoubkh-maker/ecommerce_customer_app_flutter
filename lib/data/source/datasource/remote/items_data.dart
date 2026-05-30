
import 'package:app_ecommerce/core/API/api_link.dart';
import 'package:app_ecommerce/core/class/crud.dart';

class ItemsData {


  Crud crud ;

  ItemsData({required this.crud});

  getdata(id ,    userid) async{
  var response = await crud.postData(itemsPage, {
    "id" : id.toString() ,
    "userid" : userid.toString(),
    },);
  //print("$response -----------------------------------------------------------");
  return response.fold((l) => l, (r) => r);
  }


}