
import 'package:app_ecommerce/core/API/api_link.dart';
import 'package:app_ecommerce/core/class/crud.dart';

class CheckemailData {

Crud crud ;

CheckemailData({required this.crud}) ;

postdata(String email)async{
 var resposne = await crud.postData(chcekemail, {
  "email" : email ,
 });
 return resposne.fold((l) => l, (r) => r);
}


}