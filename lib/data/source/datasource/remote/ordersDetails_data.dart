
import 'package:app_ecommerce/core/API/api_link.dart';
import 'package:app_ecommerce/core/class/crud.dart';

class OrdersDetailsData {


  Crud crud ;

  OrdersDetailsData({required this.crud});

  getdata( cartOrders) async{

  var response = await crud.postData(ordersdetailslin, {
   "ordersid" : cartOrders
    },);
  //print("$response -----------------------------------------------------------");
  return response.fold((l) => l, (r) => r);
  }


}