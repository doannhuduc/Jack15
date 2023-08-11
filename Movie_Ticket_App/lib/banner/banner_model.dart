class BannerModel {
  String? image;
  int? movieId;
  String? url;
  BannerModel({this.image, this.movieId, this.url});
  factory BannerModel.fromJson(Map<String, dynamic>? json) {
    return BannerModel(
        image: json?["image"] ?? "",
        movieId: json?["movie_Id"] ?? 1,
        url: json?["url"] ?? "");
  }
}
