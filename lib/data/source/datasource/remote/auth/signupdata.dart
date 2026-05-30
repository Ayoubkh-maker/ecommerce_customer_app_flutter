
import 'package:app_ecommerce/core/API/api_link.dart';
import 'package:app_ecommerce/core/class/crud.dart';



class SignupData{

 Crud crud ;

SignupData({required this.crud});


postdata(String username , String email , String password , String phone) async{

  var resposne = await crud.postData(signup, {
    "username" :  username,
    "email" :  email,
    "password" :  password,
    "phone" :  phone,

  }
  
  
  );
  
  return resposne.fold((l) => l, (r) => r);




}



}