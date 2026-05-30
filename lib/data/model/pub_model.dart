class PubModel {
  int? pubId;
  String? pubTitle;
  String? pubImage;
  int? pubDeliveryTime;

  PubModel({this.pubId, this.pubTitle, this.pubImage, this.pubDeliveryTime});

  PubModel.fromJson(Map<String, dynamic> json) {
    pubId = json['pub_id'];
    pubTitle = json['pub_title'];
    pubImage = json['pub_image'];
    pubDeliveryTime = json['pub_deliveryTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pub_id'] = this.pubId;
    data['pub_title'] = this.pubTitle;
    data['pub_image'] = this.pubImage;
    data['pub_deliveryTime'] = this.pubDeliveryTime;
    return data;
  }
}