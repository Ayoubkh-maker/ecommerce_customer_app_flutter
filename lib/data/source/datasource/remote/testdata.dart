
import 'package:app_ecommerce/core/API/api_link.dart';
import 'package:app_ecommerce/core/class/crud.dart';

class Testdata {


  Crud crud ;

  Testdata({required this.crud});

  getdata()async{
  var response = await crud.postData(test, {});
  //print("$response -----------------------------------------------------------");
  return response.fold((l) => l, (r) => r);
  }


}