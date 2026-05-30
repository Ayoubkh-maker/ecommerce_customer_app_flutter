class OrdersModel {
  int? addressId;
  String? addressName;
  String? addressStreet;
  String? addressCity;
  double? addressLat;
  double? addressLong;
  int? addressUsersid;
  int? ordersId;
  int? ordersUserid;
  int? ordersAddressid;
  int? ordersType;
  int? orderPricedelivery;
  int? ordersPaymentmethod;
  double? ordersPrice;
  double? ordersTotalprice;
  int? ordersCoupon;
  int? ordersRating;
  String? ordersRatingnote;
  int? ordersStatus;
  String? ordersDate;

  OrdersModel(
      {this.addressId,
      this.addressName,
      this.addressStreet,
      this.addressCity,
      this.addressLat,
      this.addressLong,
      this.addressUsersid,
      this.ordersId,
      this.ordersUserid,
      this.ordersAddressid,
      this.ordersType,
      this.orderPricedelivery,
      this.ordersPaymentmethod,
      this.ordersPrice,
      this.ordersTotalprice,
      this.ordersCoupon,
      this.ordersRating,
      this.ordersRatingnote,
      this.ordersStatus,
      this.ordersDate});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    addressId = json['address_id'];
    addressName = json['address_name'];
    addressStreet = json['address_street'];
    addressCity = json['address_city'];
    addressLat = json['address_lat'];
    addressLong = json['address_long'];
    addressUsersid = json['address_usersid'];
    ordersId = json['orders_id'];
    ordersUserid = json['orders_userid'];
    ordersAddressid = json['orders_addressid'];
    ordersType = json['orders_type'];
    orderPricedelivery = json['order_pricedelivery'];
    ordersPaymentmethod = json['orders_paymentmethod'];
    ordersPrice = json['orders_price'];
    ordersTotalprice = json['orders_totalprice'];
    ordersCoupon = json['orders_coupon'];
    ordersRating = json['orders_rating'];
    ordersRatingnote = json['orders_ratingnote'];
    ordersStatus = json['orders_status'];
    ordersDate = json['orders_date'];
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
    data['orders_id'] = this.ordersId;
    data['orders_userid'] = this.ordersUserid;
    data['orders_addressid'] = this.ordersAddressid;
    data['orders_type'] = this.ordersType;
    data['order_pricedelivery'] = this.orderPricedelivery;
    data['orders_paymentmethod'] = this.ordersPaymentmethod;
    data['orders_price'] = this.ordersPrice;
    data['orders_totalprice'] = this.ordersTotalprice;
    data['orders_coupon'] = this.ordersCoupon;
    data['orders_rating'] = this.ordersRating;
    data['orders_ratingnote'] = this.ordersRatingnote;
    data['orders_status'] = this.ordersStatus;
    data['orders_date'] = this.ordersDate;
    return data;
  }
}
