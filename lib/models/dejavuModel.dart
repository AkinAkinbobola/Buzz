// To parse this JSON data, do
//
//     final dejaVuModel = dejaVuModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

DejaVuModel dejaVuModelFromJson(String str) =>
    DejaVuModel.fromJson(json.decode(str));

String dejaVuModelToJson(DejaVuModel data) => json.encode(data.toJson());

class DejaVuModel {
  double? totalTime;
  double? fingerprintTime;
  double? queryTime;
  double? alignTime;
  List<Result>? results;

  DejaVuModel({
    this.totalTime,
    this.fingerprintTime,
    this.queryTime,
    this.alignTime,
    this.results,
  });

  factory DejaVuModel.fromJson(Map<String, dynamic> json) => DejaVuModel(
        totalTime: json["total_time"]?.toDouble(),
        fingerprintTime: json["fingerprint_time"]?.toDouble(),
        queryTime: json["query_time"]?.toDouble(),
        alignTime: json["align_time"]?.toDouble(),
        results: json["results"] == null
            ? []
            : List<Result>.from(
                json["results"]!.map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total_time": totalTime,
        "fingerprint_time": fingerprintTime,
        "query_time": queryTime,
        "align_time": alignTime,
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class Result {
  int? songId;
  String? songName;
  int? inputTotalHashes;
  int? fingerprintedHashesInDb;
  int? hashesMatchedInInput;
  double? inputConfidence;
  int? fingerprintedConfidence;
  int? offset;
  double? offsetSeconds;
  String? fileSha1;

  Result({
    this.songId,
    this.songName,
    this.inputTotalHashes,
    this.fingerprintedHashesInDb,
    this.hashesMatchedInInput,
    this.inputConfidence,
    this.fingerprintedConfidence,
    this.offset,
    this.offsetSeconds,
    this.fileSha1,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        songId: json["song_id"],
        songName: json["song_name"],
        inputTotalHashes: json["input_total_hashes"],
        fingerprintedHashesInDb: json["fingerprinted_hashes_in_db"],
        hashesMatchedInInput: json["hashes_matched_in_input"],
        inputConfidence: json["input_confidence"]?.toDouble(),
        fingerprintedConfidence: json["fingerprinted_confidence"],
        offset: json["offset"],
        offsetSeconds: json["offset_seconds"]?.toDouble(),
        fileSha1: json["file_sha1"],
      );

  Map<String, dynamic> toJson() => {
        "song_id": songId,
        "song_name": songName,
        "input_total_hashes": inputTotalHashes,
        "fingerprinted_hashes_in_db": fingerprintedHashesInDb,
        "hashes_matched_in_input": hashesMatchedInInput,
        "input_confidence": inputConfidence,
        "fingerprinted_confidence": fingerprintedConfidence,
        "offset": offset,
        "offset_seconds": offsetSeconds,
        "file_sha1": fileSha1,
      };
}
