import 'package:buzz/constant.dart';
import 'package:flutter/material.dart';

import 'models/SpotifySongModel.dart';

class Results extends StatefulWidget {
  const Results({Key? key, required this.jsonData}) : super(key: key);
  final String jsonData;

  @override
  State<Results> createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  late SpotifySongModel songData;

  @override
  void initState() {
    super.initState();
    songData = spotifySongModelFromJson(widget.jsonData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: splashOrange,
      appBar: AppBar(
        backgroundColor: splashOrange,
      ),
      body: Column(
        children: [
          Text('Song ID: ${songData.id ?? "N/A"}'),
          Text('Song name: ${songData.name ?? "N/A"}'),
          Text('Album: ${songData.album?.name ?? "N/A"}'),
          Text('Album ID: ${songData.album?.id ?? "N/A"}'),
          Text('Year Released: ${songData.album?.releaseDate ?? "N/A"}'),
          Text('Artists: ${getArtistsNames(songData.artists)}'),
        ],
      ),
    );
  }

  String getArtistsNames(List<SpotifySongModelArtist>? artists) {
    if (artists == null || artists.isEmpty) {
      return "N/A";
    }
    return artists.map((artist) => artist.name ?? "").join(", ");
  }
}
