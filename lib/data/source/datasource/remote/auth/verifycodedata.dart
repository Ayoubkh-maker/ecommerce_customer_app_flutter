
import 'package:app_ecommerce/core/API/api_link.dart';
import 'package:app_ecommerce/core/class/crud.dart';

class VerifycodeSignupdata{


Crud crud ;

VerifycodeSignupdata({required this.crud});


postData (String email , String verifycode)async{

var response = await crud.postData(verifycodeSignup, {
"email" : email ,
"verifycode" : verifycode
});
return response.fold((l) => l, (r) => r);

}


}