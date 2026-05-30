
import 'package:app_ecommerce/core/API/api_link.dart';
import 'package:app_ecommerce/core/class/crud.dart';

class OfferData {


  Crud crud ;

  OfferData({required this.crud});

  getdata() async{
  var response = await crud.postData(offerlink, {},);
  //print("$response -----------------------------------------------------------");
  return response.fold((l) => l, (r) => r);
  }


}