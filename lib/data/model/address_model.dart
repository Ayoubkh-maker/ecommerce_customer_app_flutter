class AdressModel {
  int? addressId;
  String? addressName;
  String? addressStreet;
  String? addressCity;
  double? addressLat;
  double? addressLong;
  int? addressUsersid;

  AdressModel(
      {this.addressId,
      this.addressName,
      this.addressStreet,
      this.addressCity,
      this.addressLat,
      this.addressLong,
      this.addressUsersid});

  AdressModel.fromJson(Map<String, dynamic> json) {
    addressId = json['address_id'];
    addressName = json['address_name'];
    addressStreet = json['address_street'];
    addressCity = json['address_city'];
    addressLat = json['address_lat'];
    addressLong = json['address_long'];
    addressUsersid = json['address_usersid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address_id'] = this.addressId;
    data['address_name'] = this.addressName;
    data['address_street'] = this.addressStreet;
    data['address_city'] = this.addressCity;
    data['address_lat'] = this.addressLat;
    data['address_long'] = this.addressLong;
    data['address_usersid'] = this.addressUsersid;
    return data;
  }
}