
import 'package:app_ecommerce/core/API/api_link.dart';
import 'package:app_ecommerce/core/class/crud.dart';

class RessetPasswordData{

  Crud crud ;

RessetPasswordData({required this.crud});

postdata(String email , String passsword)async{
 var response = await crud.postData(ressetpassword, {
 "email" :  email,
 "password":  passsword,
 });
 return response.fold((l) => l, (r) => r);
}
}