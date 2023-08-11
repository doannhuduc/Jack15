class ChoiceModel {
  String? image;
  String? title;
  String? url;
  ChoiceModel({this.image, this.title, this.url});

  factory ChoiceModel.fromJson(Map<String, dynamic>? json) {
    return ChoiceModel(
        image: json?["image"] ?? "",
        title: json?["title"] ?? "",
        url: json?["url"] ?? "");
  }
}
