// To parse this JSON data, do
//
//     final spotifyAccessTokenModel = spotifyAccessTokenModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

SpotifyAccessTokenModel spotifyAccessTokenModelFromJson(String str) =>
    SpotifyAccessTokenModel.fromJson(json.decode(str));

String spotifyAccessTokenModelToJson(SpotifyAccessTokenModel data) =>
    json.encode(data.toJson());

class SpotifyAccessTokenModel {
  String? accessToken;
  String? tokenType;
  int? expiresIn;

  SpotifyAccessTokenModel({
    this.accessToken,
    this.tokenType,
    this.expiresIn,
  });

  factory SpotifyAccessTokenModel.fromJson(Map<String, dynamic> json) =>
      SpotifyAccessTokenModel(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        expiresIn: json["expires_in"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "expires_in": expiresIn,
      };
}
