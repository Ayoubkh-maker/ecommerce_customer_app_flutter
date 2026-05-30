import 'package:app_ecommerce/core/API/api_link.dart';
import 'package:app_ecommerce/core/class/crud.dart';

class AddressData {
  Crud crud;

  AddressData({required this.crud});

  addAdress( userid,  name, city, street, lat, long) async {
    var response = await crud.postData(addAddress, {
      "userId": userid,
      "name": name,
      "city": city,
      "street": street,
      "lat": lat,
      "long": long
    });
    return response.fold((l) => l, (r) => r);
  }

  viewAdress(userid) async {
    var response = await crud.postData(viewAddress,
     {"userId": userid});
    return response.fold((l) => l, (r) => r);
  }

  deleteAdress(addressid) async {
    var response = await crud
        .postData(deleteAddress,
         {"addressid": addressid});
    return response.fold((l) => l, (r) => r);
  }

  updateAdress(itemsid, userid) async {
    var response = await crud
        .postData(updateAddress, {"itemsId": itemsid, "userId": userid});
    return response.fold((l) => l, (r) => r);
  }
}
