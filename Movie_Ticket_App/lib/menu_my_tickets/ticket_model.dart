import 'package:firebase_auth/firebase_auth.dart';

class TicketModel {
  String? amountMoney;
  String? movieId;
  String? movieName;
  String? movieTime;
  List<dynamic>? seats;
  String? theaterId;
  String? theaterName;
  String? userId;

  TicketModel(
      {this.amountMoney,
      this.movieId,
      this.movieName,
      this.movieTime,
      this.seats,
      this.theaterId,
      this.theaterName,
      this.userId});

  factory TicketModel.fromJson(Map<String, dynamic>? json) {
    return TicketModel(
        amountMoney: json?["amountMoney"] ?? "",
        movieId: json?["movieId"] ?? "",
        movieName: json?["movieName"] ?? "",
        movieTime: json?["movieTime"] ?? "",
        seats: json?["seats"] ?? [],
        theaterId: json?["theaterId"] ?? "",
        theaterName: json?["theaterName"],
        userId: json?["userId"] ?? "");
  }
}
