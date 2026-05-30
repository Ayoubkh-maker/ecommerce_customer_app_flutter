import 'package:app_ecommerce/core/API/api_link.dart';
import 'package:app_ecommerce/core/class/crud.dart';

class Checkoutdata {
  Crud crud;

  Checkoutdata({required this.crud});

  checkout(Map data) async {
    var response = await crud.postData(checkoutlink, data);
    return response.fold((l) => l, (r) => r);
  }
}
