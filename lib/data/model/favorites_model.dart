class FavoritesModel {
  int? favoritesId;
  int? favoritesUsersid;
  int? favoritesItemsid;
  int? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDesc;
  String? itemsDescAr;
  int? itemsCount;
  int? itemsActive;
  String? itemsImage;
  String? itemsDate;
  int? itemsCategories;
  double? itemsPrice;
  int? itemsDiscount;
  int? usersId;

  FavoritesModel(
      {this.favoritesId,
      this.favoritesUsersid,
      this.favoritesItemsid,
      this.itemsId,
      this.itemsName,
      this.itemsNameAr,
      this.itemsDesc,
      this.itemsDescAr,
      this.itemsCount,
      this.itemsActive,
      this.itemsImage,
      this.itemsDate,
      this.itemsCategories,
      this.itemsPrice,
      this.itemsDiscount,
      this.usersId});

  FavoritesModel.fromJson(Map<String, dynamic> json) {
    favoritesId = json['favorites_id'];
    favoritesUsersid = json['favorites_usersid'];
    favoritesItemsid = json['favorites_itemsid'];
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsDesc = json['items_desc'];
    itemsDescAr = json['items_desc_ar'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsImage = json['items_image'];
    itemsDate = json['items_date'];
    itemsCategories = json['items_categories'];
    itemsPrice = json['items_price'];
    itemsDiscount = json['items_discount'];
    usersId = json['users-id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['favorites_id'] = this.favoritesId;
    data['favorites_usersid'] = this.favoritesUsersid;
    data['favorites_itemsid'] = this.favoritesItemsid;
    data['items_id'] = this.itemsId;
    data['items_name'] = this.itemsName;
    data['items_name_ar'] = this.itemsNameAr;
    data['items_desc'] = this.itemsDesc;
    data['items_desc_ar'] = this.itemsDescAr;
    data['items_count'] = this.itemsCount;
    data['items_active'] = this.itemsActive;
    data['items_image'] = this.itemsImage;
    data['items_date'] = this.itemsDate;
    data['items_categories'] = this.itemsCategories;
    data['items_price'] = this.itemsPrice;
    data['items_discount'] = this.itemsDiscount;
    data['users-id'] = this.usersId;
    return data;
  }
}