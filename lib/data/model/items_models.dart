class ItemsModel {
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
  double? priceDiscount ;
  int? itemsDiscount;
  int? categoriesId;
  String? categoriesName;
  String? categoriesNameAr;
  String? categoriesImage;
  String? categoriesDate;
  int? favorites;

  ItemsModel(
      {this.itemsId,
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
      this.priceDiscount,
      this.itemsDiscount,
      this.categoriesId,
      this.categoriesName,
      this.categoriesNameAr,
      this.categoriesImage,
      this.categoriesDate,
      this.favorites});

  ItemsModel.fromJson(Map<String, dynamic> json) {
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
    priceDiscount = json['priceDiscount'];
    itemsDiscount = json['items_discount'];
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesNameAr = json['categories_name_ar'];
    categoriesImage = json['categories_image'];
    categoriesDate = json['categories_date'];
    favorites = json['favorites'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    data['categories_id'] = this.categoriesId;
    data['categories_name'] = this.categoriesName;
    data['categories_name_ar'] = this.categoriesNameAr;
    data['categories_image'] = this.categoriesImage;
    data['categories_date'] = this.categoriesDate;
    data['favorites'] = this.favorites;
    return data;
  }
}