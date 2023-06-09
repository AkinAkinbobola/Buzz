// To parse this JSON data, do
//
//     final acrCloudModel = acrCloudModelFromJson(jsonString);

import 'dart:convert';

AcrCloudModel acrCloudModelFromJson(String str) => AcrCloudModel.fromJson(json.decode(str));

String acrCloudModelToJson(AcrCloudModel data) => json.encode(data.toJson());

class AcrCloudModel {
    double? costTime;
    int? resultType;
    Metadata? metadata;
    Status? status;

    AcrCloudModel({
        this.costTime,
        this.resultType,
        this.metadata,
        this.status,
    });

    factory AcrCloudModel.fromJson(Map<String, dynamic> json) => AcrCloudModel(
        costTime: json["cost_time"]?.toDouble(),
        resultType: json["result_type"],
        metadata: json["metadata"] == null ? null : Metadata.fromJson(json["metadata"]),
        status: json["status"] == null ? null : Status.fromJson(json["status"]),
    );

    Map<String, dynamic> toJson() => {
        "cost_time": costTime,
        "result_type": resultType,
        "metadata": metadata?.toJson(),
        "status": status?.toJson(),
    };
}

class Metadata {
    List<Music>? music;
    DateTime? timestampUtc;

    Metadata({
        this.music,
        this.timestampUtc,
    });

    factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        music: json["music"] == null ? [] : List<Music>.from(json["music"]!.map((x) => Music.fromJson(x))),
        timestampUtc: json["timestamp_utc"] == null ? null : DateTime.parse(json["timestamp_utc"]),
    );

    Map<String, dynamic> toJson() => {
        "music": music == null ? [] : List<dynamic>.from(music!.map((x) => x.toJson())),
        "timestamp_utc": timestampUtc?.toIso8601String(),
    };
}

class Music {
    int? resultFrom;
    List<GenreClass>? artists;
    ExternalIds? externalIds;
    List<GenreClass>? genres;
    GenreClass? album;
    int? score;
    int? durationMs;
    DateTime? releaseDate;
    String? label;
    String? acrid;
    String? title;
    ExternalMetadata? externalMetadata;
    int? dbBeginTimeOffsetMs;
    int? dbEndTimeOffsetMs;
    int? sampleBeginTimeOffsetMs;
    int? sampleEndTimeOffsetMs;
    int? playOffsetMs;

    Music({
        this.resultFrom,
        this.artists,
        this.externalIds,
        this.genres,
        this.album,
        this.score,
        this.durationMs,
        this.releaseDate,
        this.label,
        this.acrid,
        this.title,
        this.externalMetadata,
        this.dbBeginTimeOffsetMs,
        this.dbEndTimeOffsetMs,
        this.sampleBeginTimeOffsetMs,
        this.sampleEndTimeOffsetMs,
        this.playOffsetMs,
    });

    factory Music.fromJson(Map<String, dynamic> json) => Music(
        resultFrom: json["result_from"],
        artists: json["artists"] == null ? [] : List<GenreClass>.from(json["artists"]!.map((x) => GenreClass.fromJson(x))),
        externalIds: json["external_ids"] == null ? null : ExternalIds.fromJson(json["external_ids"]),
        genres: json["genres"] == null ? [] : List<GenreClass>.from(json["genres"]!.map((x) => GenreClass.fromJson(x))),
        album: json["album"] == null ? null : GenreClass.fromJson(json["album"]),
        score: json["score"],
        durationMs: json["duration_ms"],
        releaseDate: json["release_date"] == null ? null : DateTime.parse(json["release_date"]),
        label: json["label"],
        acrid: json["acrid"],
        title: json["title"],
        externalMetadata: json["external_metadata"] == null ? null : ExternalMetadata.fromJson(json["external_metadata"]),
        dbBeginTimeOffsetMs: json["db_begin_time_offset_ms"],
        dbEndTimeOffsetMs: json["db_end_time_offset_ms"],
        sampleBeginTimeOffsetMs: json["sample_begin_time_offset_ms"],
        sampleEndTimeOffsetMs: json["sample_end_time_offset_ms"],
        playOffsetMs: json["play_offset_ms"],
    );

    Map<String, dynamic> toJson() => {
        "result_from": resultFrom,
        "artists": artists == null ? [] : List<dynamic>.from(artists!.map((x) => x.toJson())),
        "external_ids": externalIds?.toJson(),
        "genres": genres == null ? [] : List<dynamic>.from(genres!.map((x) => x.toJson())),
        "album": album?.toJson(),
        "score": score,
        "duration_ms": durationMs,
        "release_date": "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
        "label": label,
        "acrid": acrid,
        "title": title,
        "external_metadata": externalMetadata?.toJson(),
        "db_begin_time_offset_ms": dbBeginTimeOffsetMs,
        "db_end_time_offset_ms": dbEndTimeOffsetMs,
        "sample_begin_time_offset_ms": sampleBeginTimeOffsetMs,
        "sample_end_time_offset_ms": sampleEndTimeOffsetMs,
        "play_offset_ms": playOffsetMs,
    };
}

class GenreClass {
    String? name;

    GenreClass({
        this.name,
    });

    factory GenreClass.fromJson(Map<String, dynamic> json) => GenreClass(
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
    };
}

class ExternalIds {
    String? upc;
    String? isrc;

    ExternalIds({
        this.upc,
        this.isrc,
    });

    factory ExternalIds.fromJson(Map<String, dynamic> json) => ExternalIds(
        upc: json["upc"],
        isrc: json["isrc"],
    );

    Map<String, dynamic> toJson() => {
        "upc": upc,
        "isrc": isrc,
    };
}

class ExternalMetadata {
    Deezer? deezer;
    Spotify? spotify;
    Youtube? youtube;

    ExternalMetadata({
        this.deezer,
        this.spotify,
        this.youtube,
    });

    factory ExternalMetadata.fromJson(Map<String, dynamic> json) => ExternalMetadata(
        deezer: json["deezer"] == null ? null : Deezer.fromJson(json["deezer"]),
        spotify: json["spotify"] == null ? null : Spotify.fromJson(json["spotify"]),
        youtube: json["youtube"] == null ? null : Youtube.fromJson(json["youtube"]),
    );

    Map<String, dynamic> toJson() => {
        "deezer": deezer?.toJson(),
        "spotify": spotify?.toJson(),
        "youtube": youtube?.toJson(),
    };
}

class Deezer {
    DeezerAlbum? album;
    List<DeezerAlbum>? artists;
    Track? track;

    Deezer({
        this.album,
        this.artists,
        this.track,
    });

    factory Deezer.fromJson(Map<String, dynamic> json) => Deezer(
        album: json["album"] == null ? null : DeezerAlbum.fromJson(json["album"]),
        artists: json["artists"] == null ? [] : List<DeezerAlbum>.from(json["artists"]!.map((x) => DeezerAlbum.fromJson(x))),
        track: json["track"] == null ? null : Track.fromJson(json["track"]),
    );

    Map<String, dynamic> toJson() => {
        "album": album?.toJson(),
        "artists": artists == null ? [] : List<dynamic>.from(artists!.map((x) => x.toJson())),
        "track": track?.toJson(),
    };
}

class DeezerAlbum {
    int? id;
    String? name;

    DeezerAlbum({
        this.id,
        this.name,
    });

    factory DeezerAlbum.fromJson(Map<String, dynamic> json) => DeezerAlbum(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}

class Track {
    String? name;
    String? id;

    Track({
        this.name,
        this.id,
    });

    factory Track.fromJson(Map<String, dynamic> json) => Track(
        name: json["name"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
    };
}

class Spotify {
    Track? album;
    List<Track>? artists;
    Track? track;

    Spotify({
        this.album,
        this.artists,
        this.track,
    });

    factory Spotify.fromJson(Map<String, dynamic> json) => Spotify(
        album: json["album"] == null ? null : Track.fromJson(json["album"]),
        artists: json["artists"] == null ? [] : List<Track>.from(json["artists"]!.map((x) => Track.fromJson(x))),
        track: json["track"] == null ? null : Track.fromJson(json["track"]),
    );

    Map<String, dynamic> toJson() => {
        "album": album?.toJson(),
        "artists": artists == null ? [] : List<dynamic>.from(artists!.map((x) => x.toJson())),
        "track": track?.toJson(),
    };
}

class Youtube {
    String? vid;

    Youtube({
        this.vid,
    });

    factory Youtube.fromJson(Map<String, dynamic> json) => Youtube(
        vid: json["vid"],
    );

    Map<String, dynamic> toJson() => {
        "vid": vid,
    };
}

class Status {
    String? msg;
    int? code;
    String? version;

    Status({
        this.msg,
        this.code,
        this.version,
    });

    factory Status.fromJson(Map<String, dynamic> json) => Status(
        msg: json["msg"],
        code: json["code"],
        version: json["version"],
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
        "code": code,
        "version": version,
    };
}
