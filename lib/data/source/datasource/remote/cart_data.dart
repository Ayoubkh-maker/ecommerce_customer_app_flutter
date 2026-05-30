import 'package:app_ecommerce/core/API/api_link.dart';
import 'package:app_ecommerce/core/class/crud.dart';


class Cartdata {


Crud crud ;

Cartdata({required this.crud});

adddata(itemsid , userid)async{
  var response = await crud.postData(addcart, {
  "itemsId" : itemsid ,
  "userId" : userid   
  });
  return response.fold((l) => l, (r) => r);
}

removedata(itemsid , userid)async{
  var response = await crud.postData(removecart, {
  "itemsId" : itemsid ,
  "userId" : userid   
  });
  return response.fold((l) => l, (r) => r);
}


countData(itemsid , userid)async{
    var response = await crud.postData(getcount, {
  "itemsId" : itemsid ,
  "userId" : userid   
  });
  return response.fold((l) => l, (r) => r);
}

viewData(userid)async{
    var response = await crud.postData(viewcart, {
  "userId" : userid   
  });
  return response.fold((l) => l, (r) => r);
}

couponData(couponname)async{
    var response = await crud.postData(couponlink, {
  "couponname" : couponname   
  });
  return response.fold((l) => l, (r) => r);
}

}