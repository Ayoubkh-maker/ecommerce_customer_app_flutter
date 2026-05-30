class CouponModel {
  int? couponId;
  String? couponName;
  int? couponCount;
  int? couponDiscount;
  String? couponDate;

  CouponModel(
      {this.couponId,
      this.couponName,
      this.couponCount,
      this.couponDiscount,
      this.couponDate});

  CouponModel.fromJson(Map<String, dynamic> json) {
    couponId = json['coupon_id'];
    couponName = json['coupon_name'];
    couponCount = json['coupon_count'];
    couponDiscount = json['coupon_discount'];
    couponDate = json['coupon_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coupon_id'] = this.couponId;
    data['coupon_name'] = this.couponName;
    data['coupon_count'] = this.couponCount;
    data['coupon_discount'] = this.couponDiscount;
    data['coupon_date'] = this.couponDate;
    return data;
  }
}