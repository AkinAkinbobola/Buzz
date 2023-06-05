// To parse this JSON data, do
//
//     final spotifySongModel = spotifySongModelFromJson(jsonString);

import 'dart:convert';

SpotifySongModel spotifySongModelFromJson(String str) => SpotifySongModel.fromJson(json.decode(str));

String spotifySongModelToJson(SpotifySongModel data) => json.encode(data.toJson());

class SpotifySongModel {
    Album? album;
    List<Artist>? artists;
    List<String>? availableMarkets;
    int? discNumber;
    int? durationMs;
    bool? explicit;
    ExternalIds? externalIds;
    ExternalUrls? externalUrls;
    String? href;
    String? id;
    bool? isLocal;
    String? name;
    int? popularity;
    String? previewUrl;
    int? trackNumber;
    String? type;
    String? uri;

    SpotifySongModel({
        this.album,
        this.artists,
        this.availableMarkets,
        this.discNumber,
        this.durationMs,
        this.explicit,
        this.externalIds,
        this.externalUrls,
        this.href,
        this.id,
        this.isLocal,
        this.name,
        this.popularity,
        this.previewUrl,
        this.trackNumber,
        this.type,
        this.uri,
    });

    factory SpotifySongModel.fromJson(Map<String, dynamic> json) => SpotifySongModel(
        album: json["album"] == null ? null : Album.fromJson(json["album"]),
        artists: json["artists"] == null ? [] : List<Artist>.from(json["artists"]!.map((x) => Artist.fromJson(x))),
        availableMarkets: json["available_markets"] == null ? [] : List<String>.from(json["available_markets"]!.map((x) => x)),
        discNumber: json["disc_number"],
        durationMs: json["duration_ms"],
        explicit: json["explicit"],
        externalIds: json["external_ids"] == null ? null : ExternalIds.fromJson(json["external_ids"]),
        externalUrls: json["external_urls"] == null ? null : ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        isLocal: json["is_local"],
        name: json["name"],
        popularity: json["popularity"],
        previewUrl: json["preview_url"],
        trackNumber: json["track_number"],
        type: json["type"],
        uri: json["uri"],
    );

    Map<String, dynamic> toJson() => {
        "album": album?.toJson(),
        "artists": artists == null ? [] : List<dynamic>.from(artists!.map((x) => x.toJson())),
        "available_markets": availableMarkets == null ? [] : List<dynamic>.from(availableMarkets!.map((x) => x)),
        "disc_number": discNumber,
        "duration_ms": durationMs,
        "explicit": explicit,
        "external_ids": externalIds?.toJson(),
        "external_urls": externalUrls?.toJson(),
        "href": href,
        "id": id,
        "is_local": isLocal,
        "name": name,
        "popularity": popularity,
        "preview_url": previewUrl,
        "track_number": trackNumber,
        "type": type,
        "uri": uri,
    };
}

class Album {
    String? albumType;
    List<Artist>? artists;
    List<String>? availableMarkets;
    ExternalUrls? externalUrls;
    String? href;
    String? id;
    List<Image>? images;
    String? name;
    DateTime? releaseDate;
    String? releaseDatePrecision;
    int? totalTracks;
    String? type;
    String? uri;

    Album({
        this.albumType,
        this.artists,
        this.availableMarkets,
        this.externalUrls,
        this.href,
        this.id,
        this.images,
        this.name,
        this.releaseDate,
        this.releaseDatePrecision,
        this.totalTracks,
        this.type,
        this.uri,
    });

    factory Album.fromJson(Map<String, dynamic> json) => Album(
        albumType: json["album_type"],
        artists: json["artists"] == null ? [] : List<Artist>.from(json["artists"]!.map((x) => Artist.fromJson(x))),
        availableMarkets: json["available_markets"] == null ? [] : List<String>.from(json["available_markets"]!.map((x) => x)),
        externalUrls: json["external_urls"] == null ? null : ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        images: json["images"] == null ? [] : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
        name: json["name"],
        releaseDate: json["release_date"] == null ? null : DateTime.parse(json["release_date"]),
        releaseDatePrecision: json["release_date_precision"],
        totalTracks: json["total_tracks"],
        type: json["type"],
        uri: json["uri"],
    );

    Map<String, dynamic> toJson() => {
        "album_type": albumType,
        "artists": artists == null ? [] : List<dynamic>.from(artists!.map((x) => x.toJson())),
        "available_markets": availableMarkets == null ? [] : List<dynamic>.from(availableMarkets!.map((x) => x)),
        "external_urls": externalUrls?.toJson(),
        "href": href,
        "id": id,
        "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x.toJson())),
        "name": name,
        "release_date": "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
        "release_date_precision": releaseDatePrecision,
        "total_tracks": totalTracks,
        "type": type,
        "uri": uri,
    };
}

class Artist {
    ExternalUrls? externalUrls;
    String? href;
    String? id;
    String? name;
    String? type;
    String? uri;

    Artist({
        this.externalUrls,
        this.href,
        this.id,
        this.name,
        this.type,
        this.uri,
    });

    factory Artist.fromJson(Map<String, dynamic> json) => Artist(
        externalUrls: json["external_urls"] == null ? null : ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        name: json["name"],
        type: json["type"],
        uri: json["uri"],
    );

    Map<String, dynamic> toJson() => {
        "external_urls": externalUrls?.toJson(),
        "href": href,
        "id": id,
        "name": name,
        "type": type,
        "uri": uri,
    };
}

class ExternalUrls {
    String? spotify;

    ExternalUrls({
        this.spotify,
    });

    factory ExternalUrls.fromJson(Map<String, dynamic> json) => ExternalUrls(
        spotify: json["spotify"],
    );

    Map<String, dynamic> toJson() => {
        "spotify": spotify,
    };
}

class Image {
    int? height;
    String? url;
    int? width;

    Image({
        this.height,
        this.url,
        this.width,
    });

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        height: json["height"],
        url: json["url"],
        width: json["width"],
    );

    Map<String, dynamic> toJson() => {
        "height": height,
        "url": url,
        "width": width,
    };
}

class ExternalIds {
    String? isrc;

    ExternalIds({
        this.isrc,
    });

    factory ExternalIds.fromJson(Map<String, dynamic> json) => ExternalIds(
        isrc: json["isrc"],
    );

    Map<String, dynamic> toJson() => {
        "isrc": isrc,
    };
}
