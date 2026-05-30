
import 'package:app_ecommerce/core/API/api_link.dart';
import 'package:app_ecommerce/core/class/crud.dart';

class Logindata {
  

Crud crud ;

Logindata({required  this.crud});

postdata(String email , String password)async{
 
 var response = await crud.postData(login, {
  "email" : email ,
  "password" : password
 });

 return response.fold((l) => l, (r) => r);
  
}
}