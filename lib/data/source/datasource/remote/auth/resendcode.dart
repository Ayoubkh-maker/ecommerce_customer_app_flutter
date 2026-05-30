import 'package:app_ecommerce/core/API/api_link.dart';
import 'package:app_ecommerce/core/class/crud.dart';

class ResendCodedata {

Crud crud ;

ResendCodedata({required this.crud});

updatecode(email)async{

var response = await crud.postData(resendverify, {
"email"  : email 
});
return response.fold((l) => l, (r) => r);

}


}