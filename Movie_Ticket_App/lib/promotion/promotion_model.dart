class PromotionModel {
  String? image;
  int? promotionId;
  String? url;
  String? description;
  PromotionModel({this.image, this.promotionId, this.url, this.description});
  factory PromotionModel.fromJson(Map<String, dynamic>? json) {
    return PromotionModel(
        image: json?["image_promotion"] ?? "",
        promotionId: json?["id_promotion"] ?? 1,
        url: json?["url"],
        description: json?["description"] ?? "");
  }
}
