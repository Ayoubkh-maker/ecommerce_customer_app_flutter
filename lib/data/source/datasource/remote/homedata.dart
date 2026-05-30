import 'package:app_ecommerce/core/API/api_link.dart';
import 'package:app_ecommerce/core/class/crud.dart';

class Homedata {

Crud crud ;

Homedata({required this.crud});



postdata() async{
  var response = await crud.postData(homepage, {});
  return response.fold((l) => l, (r) => r);
}

}