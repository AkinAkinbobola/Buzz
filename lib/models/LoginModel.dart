// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  DateTime? expiry;
  String? token;

  LoginModel({
    this.expiry,
    this.token,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        expiry: json["expiry"] == null ? null : DateTime.parse(json["expiry"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "expiry": expiry?.toIso8601String(),
        "token": token,
      };
}
