import 'package:app_ecommerce/core/API/api_link.dart';
import 'package:app_ecommerce/core/class/crud.dart';

class PendingData {


  Crud crud ;

  PendingData({required this.crud});

  getdata(userid) async{
  var response = await crud.postData(pindinglink, {
    "userId" : userid ,
    },);
  //print("$response -----------------------------------------------------------");
  return response.fold((l) => l, (r) => r);
  }

deletedata(orderid)async{

  var response  = await crud.postData(deleteorder, {
"orderid" : orderid 
  });
return response.fold((l) => l, (r) => r);

}
}