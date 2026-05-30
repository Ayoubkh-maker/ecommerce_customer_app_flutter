
import 'package:app_ecommerce/core/API/api_link.dart';
import 'package:app_ecommerce/core/class/crud.dart';

class VerifycodeData{


  Crud crud ;

VerifycodeData({required this.crud});

postdata(String email ,String verifyCode)async{
  var resposne = await crud.postData(verifycode, {
    "email" : email ,
    "verifycode" : verifyCode
  });
  return resposne.fold((l) =>  l, (r) => r);
}
  
}