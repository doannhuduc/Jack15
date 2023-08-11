// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

UserInfoModel welcomeFromJson(String str) =>
    UserInfoModel.fromJson(json.decode(str));

String welcomeToJson(UserInfoModel data) => json.encode(data.toJson());

class UserInfoModel {
  String? email;
  String? userName;
  String? uid;

  UserInfoModel({
    this.email,
    this.userName,
    this.uid,
  });

  factory UserInfoModel.fromJson(Map<String, dynamic> json) => UserInfoModel(
        email: json["email"],
        userName: json["user_name"],
        uid: json["uid"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "user_name": userName,
        "uid": uid,
      };
}
