class OrdersDetailsModel {
  double? itemsprice;
  int? itemscount;
  int? cartId;
  int? cartItemsid;
  int? cartUserid;
  int? cartOrders;
  int? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDesc;
  String? itemsDescAr;
  int? itemsCount;
  int? itemsActive;
  String? itemsImage;
  int? itemsDiscount;
  String? itemsDate;
  int? itemsCategories;
  double? itemsPrice;

  OrdersDetailsModel(
      {this.itemsprice,
      this.itemscount,
      this.cartId,
      this.cartItemsid,
      this.cartUserid,
      this.cartOrders,
      this.itemsId,
      this.itemsName,
      this.itemsNameAr,
      this.itemsDesc,
      this.itemsDescAr,
      this.itemsCount,
      this.itemsActive,
      this.itemsImage,
      this.itemsDiscount,
      this.itemsDate,
      this.itemsCategories,
      this.itemsPrice});

  OrdersDetailsModel.fromJson(Map<String, dynamic> json) {
    itemsprice = json['itemsprice'];
    itemscount = json['itemscount'];
    cartId = json['cart_id'];
    cartItemsid = json['cart_itemsid'];
    cartUserid = json['cart_userid'];
    cartOrders = json['cart_orders'];
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsDesc = json['items_desc'];
    itemsDescAr = json['items_desc_ar'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsImage = json['items_image'];
    itemsDiscount = json['items_discount'];
    itemsDate = json['items_date'];
    itemsCategories = json['items_categories'];
    itemsPrice = json['items_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemsprice'] = this.itemsprice;
    data['itemscount'] = this.itemscount;
    data['cart_id'] = this.cartId;
    data['cart_itemsid'] = this.cartItemsid;
    data['cart_userid'] = this.cartUserid;
    data['cart_orders'] = this.cartOrders;
    data['items_id'] = this.itemsId;
    data['items_name'] = this.itemsName;
    data['items_name_ar'] = this.itemsNameAr;
    data['items_desc'] = this.itemsDesc;
    data['items_desc_ar'] = this.itemsDescAr;
    data['items_count'] = this.itemsCount;
    data['items_active'] = this.itemsActive;
    data['items_image'] = this.itemsImage;
    data['items_discount'] = this.itemsDiscount;
    data['items_date'] = this.itemsDate;
    data['items_categories'] = this.itemsCategories;
    data['items_price'] = this.itemsPrice;
    return data;
  }
}