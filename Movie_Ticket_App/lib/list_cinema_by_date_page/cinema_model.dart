class CinemaModel {
  String? id;
  Location? location;
  List<MovieSchedules>? movieSchedules;
  String? name;
  List<dynamic>? rooms;
  CinemaModel(
      {this.id, this.location, this.movieSchedules, this.name, this.rooms});

  factory CinemaModel.fromJson(Map<String, dynamic>? json) {
    return CinemaModel(
        id: json?["id"] ?? "",
        location: json?["location"] == null
            ? null
            : Location.fromJson(json?["location"]),
        movieSchedules: json?["movie_schedules"] == null
            ? null
            : (json?["movie_schedules"] as List)
                .map((js1) => MovieSchedules.fromJson(js1))
                .toList(),
        name: json?["name"] ?? "",
        rooms: json?["rooms"] ?? []);
  }
}

class Location {
  int? cityCode;
  String? cityName;
  Location({this.cityCode, this.cityName});

  factory Location.fromJson(Map<String, dynamic>? json) {
    return Location(
        cityCode: json?["city_code"] ?? 0, cityName: json?["city_name"] ?? "");
  }
}

class MovieSchedules {
  String? day;
  String? movieId;
  int? roomId;
  String? movieName;
  String? time;
  String? image;
  String? rated;
  MovieSchedules(
      {this.day,
      this.movieId,
      this.roomId,
      this.movieName,
      this.time,
      this.image,
      this.rated});

  factory MovieSchedules.fromJson(Map<String, dynamic>? json) {
    return MovieSchedules(
        day: json?["day"] ?? "",
        movieId: json?["movie_id"] ?? "",
        roomId: json?["room_id"] ?? 0,
        movieName: json?["movie_name"] ?? "",
        time: json?["time"] ?? "",
        image: json?["image"] ?? "",
        rated: json?["rated"]);
  }
}

// Map json = {
//   "location": {"city_code": 2, "city_name": "Hồ Chí Minh"},
//   "movie_schedules": [
//     {
//       "day": "22/07/2023",
//       "movie_id": " SnNku2ZlDHwFLhHUhwb0",
//       "room_id": 2,
//       "movie_name": "NHIỆM VỤ: BẤT KHẢ THI NGHIỆP BÁO PHẦN MỘT",
//       "time": "19h00 - 21h00"
//     }
//   ],
//   "name": "CGV Rice City",
//   "rooms": [1, 2, 3]
// };
