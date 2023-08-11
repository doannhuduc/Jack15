class VideosModel {
  String? description;
  int? idVideo;
  String? image;
  String? url;

  VideosModel({this.description, this.idVideo, this.url, this.image});
  factory VideosModel.fromJson(Map<String, dynamic>? json) {
    return VideosModel(
      description: json?["description"] ?? "",
      idVideo: json?["id_video"] ?? 1,
      image: json?["image"] ?? "",
      url: json?["url"] ?? "",
    );
  }
}
