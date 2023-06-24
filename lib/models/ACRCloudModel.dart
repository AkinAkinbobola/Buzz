// To parse this JSON data, do
//
//     final acrCloudModel = acrCloudModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

AcrCloudModel acrCloudModelFromJson(String str) =>
    AcrCloudModel.fromJson(json.decode(str));

String acrCloudModelToJson(AcrCloudModel data) => json.encode(data.toJson());

class AcrCloudModel {
  Metadata? metadata;
  Status? status;
  int? resultType;

  AcrCloudModel({
    this.metadata,
    this.status,
    this.resultType,
  });

  factory AcrCloudModel.fromJson(Map<String, dynamic> json) => AcrCloudModel(
        metadata: json["metadata"] == null
            ? null
            : Metadata.fromJson(json["metadata"]),
        status: json["status"] == null ? null : Status.fromJson(json["status"]),
        resultType: json["result_type"],
      );

  Map<String, dynamic> toJson() => {
        "metadata": metadata?.toJson(),
        "status": status?.toJson(),
        "result_type": resultType,
      };
}

class Metadata {
  DateTime? timestampUtc;
  List<Music>? music;

  Metadata({
    this.timestampUtc,
    this.music,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        timestampUtc: json["timestamp_utc"] == null
            ? null
            : DateTime.parse(json["timestamp_utc"]),
        music: json["music"] == null
            ? []
            : List<Music>.from(json["music"]!.map((x) => Music.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "timestamp_utc": timestampUtc?.toIso8601String(),
        "music": music == null
            ? []
            : List<dynamic>.from(music!.map((x) => x.toJson())),
      };
}

class Music {
  int? dbBeginTimeOffsetMs;
  int? dbEndTimeOffsetMs;
  int? sampleBeginTimeOffsetMs;
  int? sampleEndTimeOffsetMs;
  int? playOffsetMs;
  List<MusicAlbum>? artists;
  String? acrid;
  MusicAlbum? album;
  List<RightsClaim>? rightsClaim;
  ExternalIds? externalIds;
  int? resultFrom;
  Contributors? contributors;
  String? title;
  List<Lang>? langs;
  String? language;
  int? durationMs;
  String? label;
  ExternalMetadata? externalMetadata;
  int? score;
  List<Genre>? genres;
  DateTime? releaseDate;
  List<ReleaseByTerritory>? releaseByTerritories;
  List<Work>? works;

  Music({
    this.dbBeginTimeOffsetMs,
    this.dbEndTimeOffsetMs,
    this.sampleBeginTimeOffsetMs,
    this.sampleEndTimeOffsetMs,
    this.playOffsetMs,
    this.artists,
    this.acrid,
    this.album,
    this.rightsClaim,
    this.externalIds,
    this.resultFrom,
    this.contributors,
    this.title,
    this.langs,
    this.language,
    this.durationMs,
    this.label,
    this.externalMetadata,
    this.score,
    this.genres,
    this.releaseDate,
    this.releaseByTerritories,
    this.works,
  });

  factory Music.fromJson(Map<String, dynamic> json) => Music(
        dbBeginTimeOffsetMs: json["db_begin_time_offset_ms"],
        dbEndTimeOffsetMs: json["db_end_time_offset_ms"],
        sampleBeginTimeOffsetMs: json["sample_begin_time_offset_ms"],
        sampleEndTimeOffsetMs: json["sample_end_time_offset_ms"],
        playOffsetMs: json["play_offset_ms"],
        artists: json["artists"] == null
            ? []
            : List<MusicAlbum>.from(
                json["artists"]!.map((x) => MusicAlbum.fromJson(x))),
        acrid: json["acrid"],
        album:
            json["album"] == null ? null : MusicAlbum.fromJson(json["album"]),
        rightsClaim: json["rights_claim"] == null
            ? []
            : List<RightsClaim>.from(
                json["rights_claim"]!.map((x) => RightsClaim.fromJson(x))),
        externalIds: json["external_ids"] == null
            ? null
            : ExternalIds.fromJson(json["external_ids"]),
        resultFrom: json["result_from"],
        contributors: json["contributors"] == null
            ? null
            : Contributors.fromJson(json["contributors"]),
        title: json["title"],
        langs: json["langs"] == null
            ? []
            : List<Lang>.from(json["langs"]!.map((x) => Lang.fromJson(x))),
        language: json["language"],
        durationMs: json["duration_ms"],
        label: json["label"],
        externalMetadata: json["external_metadata"] == null
            ? null
            : ExternalMetadata.fromJson(json["external_metadata"]),
        score: json["score"],
        genres: json["genres"] == null
            ? []
            : List<Genre>.from(json["genres"]!.map((x) => Genre.fromJson(x))),
        releaseDate: json["release_date"] == null
            ? null
            : DateTime.parse(json["release_date"]),
        releaseByTerritories: json["release_by_territories"] == null
            ? []
            : List<ReleaseByTerritory>.from(json["release_by_territories"]!
                .map((x) => ReleaseByTerritory.fromJson(x))),
        works: json["works"] == null
            ? []
            : List<Work>.from(json["works"]!.map((x) => Work.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "db_begin_time_offset_ms": dbBeginTimeOffsetMs,
        "db_end_time_offset_ms": dbEndTimeOffsetMs,
        "sample_begin_time_offset_ms": sampleBeginTimeOffsetMs,
        "sample_end_time_offset_ms": sampleEndTimeOffsetMs,
        "play_offset_ms": playOffsetMs,
        "artists": artists == null
            ? []
            : List<dynamic>.from(artists!.map((x) => x.toJson())),
        "acrid": acrid,
        "album": album?.toJson(),
        "rights_claim": rightsClaim == null
            ? []
            : List<dynamic>.from(rightsClaim!.map((x) => x.toJson())),
        "external_ids": externalIds?.toJson(),
        "result_from": resultFrom,
        "contributors": contributors?.toJson(),
        "title": title,
        "langs": langs == null
            ? []
            : List<dynamic>.from(langs!.map((x) => x.toJson())),
        "language": language,
        "duration_ms": durationMs,
        "label": label,
        "external_metadata": externalMetadata?.toJson(),
        "score": score,
        "genres": genres == null
            ? []
            : List<dynamic>.from(genres!.map((x) => x.toJson())),
        "release_date":
            "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
        "release_by_territories": releaseByTerritories == null
            ? []
            : List<dynamic>.from(releaseByTerritories!.map((x) => x.toJson())),
        "works": works == null
            ? []
            : List<dynamic>.from(works!.map((x) => x.toJson())),
      };
}

class MusicAlbum {
  String? name;
  List<Lang>? langs;

  MusicAlbum({
    this.name,
    this.langs,
  });

  factory MusicAlbum.fromJson(Map<String, dynamic> json) => MusicAlbum(
        name: json["name"],
        langs: json["langs"] == null
            ? []
            : List<Lang>.from(json["langs"]!.map((x) => Lang.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "langs": langs == null
            ? []
            : List<dynamic>.from(langs!.map((x) => x.toJson())),
      };
}

class Lang {
  String? code;
  String? name;

  Lang({
    this.code,
    this.name,
  });

  factory Lang.fromJson(Map<String, dynamic> json) => Lang(
        code: json["code"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
      };
}

class Contributors {
  List<String>? composers;
  List<String>? lyricists;

  Contributors({
    this.composers,
    this.lyricists,
  });

  factory Contributors.fromJson(Map<String, dynamic> json) => Contributors(
        composers: json["composers"] == null
            ? []
            : List<String>.from(json["composers"]!.map((x) => x)),
        lyricists: json["lyricists"] == null
            ? []
            : List<String>.from(json["lyricists"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "composers": composers == null
            ? []
            : List<dynamic>.from(composers!.map((x) => x)),
        "lyricists": lyricists == null
            ? []
            : List<dynamic>.from(lyricists!.map((x) => x)),
      };
}

class ExternalIds {
  String? iswc;
  String? isrc;
  String? upc;

  ExternalIds({
    this.iswc,
    this.isrc,
    this.upc,
  });

  factory ExternalIds.fromJson(Map<String, dynamic> json) => ExternalIds(
        iswc: json["iswc"],
        isrc: json["isrc"],
        upc: json["upc"],
      );

  Map<String, dynamic> toJson() => {
        "iswc": iswc,
        "isrc": isrc,
        "upc": upc,
      };
}

class ExternalMetadata {
  Musicbrainz? musicbrainz;
  Deezer? deezer;
  Deezer? spotify;
  Musicstory? musicstory;
  Youtube? youtube;

  ExternalMetadata({
    this.musicbrainz,
    this.deezer,
    this.spotify,
    this.musicstory,
    this.youtube,
  });

  factory ExternalMetadata.fromJson(Map<String, dynamic> json) =>
      ExternalMetadata(
        musicbrainz: json["musicbrainz"] == null
            ? null
            : Musicbrainz.fromJson(json["musicbrainz"]),
        deezer: json["deezer"] == null ? null : Deezer.fromJson(json["deezer"]),
        spotify:
            json["spotify"] == null ? null : Deezer.fromJson(json["spotify"]),
        musicstory: json["musicstory"] == null
            ? null
            : Musicstory.fromJson(json["musicstory"]),
        youtube:
            json["youtube"] == null ? null : Youtube.fromJson(json["youtube"]),
      );

  Map<String, dynamic> toJson() => {
        "musicbrainz": musicbrainz?.toJson(),
        "deezer": deezer?.toJson(),
        "spotify": spotify?.toJson(),
        "musicstory": musicstory?.toJson(),
        "youtube": youtube?.toJson(),
      };
}

class Deezer {
  TrackClass? track;
  List<TrackClass>? artists;
  TrackClass? album;

  Deezer({
    this.track,
    this.artists,
    this.album,
  });

  factory Deezer.fromJson(Map<String, dynamic> json) => Deezer(
        track:
            json["track"] == null ? null : TrackClass.fromJson(json["track"]),
        artists: json["artists"] == null
            ? []
            : List<TrackClass>.from(
                json["artists"]!.map((x) => TrackClass.fromJson(x))),
        album:
            json["album"] == null ? null : TrackClass.fromJson(json["album"]),
      );

  Map<String, dynamic> toJson() => {
        "track": track?.toJson(),
        "artists": artists == null
            ? []
            : List<dynamic>.from(artists!.map((x) => x.toJson())),
        "album": album?.toJson(),
      };
}

class TrackClass {
  String? id;

  TrackClass({
    this.id,
  });

  factory TrackClass.fromJson(Map<String, dynamic> json) => TrackClass(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}

class Musicbrainz {
  TrackClass? track;

  Musicbrainz({
    this.track,
  });

  factory Musicbrainz.fromJson(Map<String, dynamic> json) => Musicbrainz(
        track:
            json["track"] == null ? null : TrackClass.fromJson(json["track"]),
      );

  Map<String, dynamic> toJson() => {
        "track": track?.toJson(),
      };
}

class Musicstory {
  TrackClass? track;
  TrackClass? album;

  Musicstory({
    this.track,
    this.album,
  });

  factory Musicstory.fromJson(Map<String, dynamic> json) => Musicstory(
        track:
            json["track"] == null ? null : TrackClass.fromJson(json["track"]),
        album:
            json["album"] == null ? null : TrackClass.fromJson(json["album"]),
      );

  Map<String, dynamic> toJson() => {
        "track": track?.toJson(),
        "album": album?.toJson(),
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

class Genre {
  String? name;

  Genre({
    this.name,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

class ReleaseByTerritory {
  List<String>? territories;
  DateTime? releaseDate;
  List<String>? excludeTerritories;

  ReleaseByTerritory({
    this.territories,
    this.releaseDate,
    this.excludeTerritories,
  });

  factory ReleaseByTerritory.fromJson(Map<String, dynamic> json) =>
      ReleaseByTerritory(
        territories: json["territories"] == null
            ? []
            : List<String>.from(json["territories"]!.map((x) => x)),
        releaseDate: json["release_date"] == null
            ? null
            : DateTime.parse(json["release_date"]),
        excludeTerritories: json["exclude_territories"] == null
            ? []
            : List<String>.from(json["exclude_territories"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "territories": territories == null
            ? []
            : List<dynamic>.from(territories!.map((x) => x)),
        "release_date":
            "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
        "exclude_territories": excludeTerritories == null
            ? []
            : List<dynamic>.from(excludeTerritories!.map((x) => x)),
      };
}

class RightsClaim {
  Distributor? distributor;
  List<RightsOwner>? rightsOwners;
  String? rightsClaimPolicy;
  List<String>? territories;

  RightsClaim({
    this.distributor,
    this.rightsOwners,
    this.rightsClaimPolicy,
    this.territories,
  });

  factory RightsClaim.fromJson(Map<String, dynamic> json) => RightsClaim(
        distributor: json["distributor"] == null
            ? null
            : Distributor.fromJson(json["distributor"]),
        rightsOwners: json["rights_owners"] == null
            ? []
            : List<RightsOwner>.from(
                json["rights_owners"]!.map((x) => RightsOwner.fromJson(x))),
        rightsClaimPolicy: json["rights_claim_policy"],
        territories: json["territories"] == null
            ? []
            : List<String>.from(json["territories"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "distributor": distributor?.toJson(),
        "rights_owners": rightsOwners == null
            ? []
            : List<dynamic>.from(rightsOwners!.map((x) => x.toJson())),
        "rights_claim_policy": rightsClaimPolicy,
        "territories": territories == null
            ? []
            : List<dynamic>.from(territories!.map((x) => x)),
      };
}

class Distributor {
  String? id;
  String? name;

  Distributor({
    this.id,
    this.name,
  });

  factory Distributor.fromJson(Map<String, dynamic> json) => Distributor(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class RightsOwner {
  String? name;
  int? sharePercentage;

  RightsOwner({
    this.name,
    this.sharePercentage,
  });

  factory RightsOwner.fromJson(Map<String, dynamic> json) => RightsOwner(
        name: json["name"],
        sharePercentage: json["share_percentage"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "share_percentage": sharePercentage,
      };
}

class Work {
  String? iswc;
  String? name;
  List<Creator>? creators;

  Work({
    this.iswc,
    this.name,
    this.creators,
  });

  factory Work.fromJson(Map<String, dynamic> json) => Work(
        iswc: json["iswc"],
        name: json["name"],
        creators: json["creators"] == null
            ? []
            : List<Creator>.from(
                json["creators"]!.map((x) => Creator.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "iswc": iswc,
        "name": name,
        "creators": creators == null
            ? []
            : List<dynamic>.from(creators!.map((x) => x.toJson())),
      };
}

class Creator {
  String? name;
  int? ipi;

  Creator({
    this.name,
    this.ipi,
  });

  factory Creator.fromJson(Map<String, dynamic> json) => Creator(
        name: json["name"],
        ipi: json["ipi"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "ipi": ipi,
      };
}

class Status {
  String? msg;
  String? version;
  int? code;

  Status({
    this.msg,
    this.version,
    this.code,
  });

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        msg: json["msg"],
        version: json["version"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "version": version,
        "code": code,
      };
}
