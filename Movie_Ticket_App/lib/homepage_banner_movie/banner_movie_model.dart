class MovieModel {
  String? id;
  String? actor;
  String? banner;
  String? categoty;
  String? dayStart;
  String? description;
  String? director;
  String? image;
  String? language;
  String? name;
  String? rated;
  List<dynamic>? theaters;
  String? time;
  String? trailer;

  MovieModel(
      {this.id,
      this.actor,
      this.banner,
      this.categoty,
      this.dayStart,
      this.description,
      this.director,
      this.image,
      this.language,
      this.name,
      this.rated,
      this.theaters,
      this.time,
      this.trailer});

  factory MovieModel.fromJson(Map<String, dynamic>? json) {
    return MovieModel(
        id: json?["id"] ?? "",
        actor: json?["actor"] ?? "",
        banner: json?["banner"] ?? "",
        categoty: json?["category"],
        dayStart: json?["day_start"] ?? "",
        description: json?["description"],
        director: json?["director"],
        image: json?["image"],
        language: json?["language"],
        name: json?["name"] ?? "",
        rated: json?["rated"],
        theaters: json?["theater"],
        time: json?["time"] ?? "",
        trailer: json?["trailer"]);
  }
}
