import 'package:app_ecommerce/core/API/api_link.dart';
import 'package:app_ecommerce/core/class/crud.dart';

class Searchdata {

Crud crud ;

Searchdata({required this.crud});


search(search)async{
var response = await crud.postData(searchlink, {"search" : search});
return response.fold((l) => l, (r) => r);

}




}