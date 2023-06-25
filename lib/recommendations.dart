import 'package:buzz/constant.dart';
import 'package:flutter/material.dart';
import 'package:spotify/spotify.dart' as SpotifyPack;

class Recommendations extends StatefulWidget {
  const Recommendations({Key? key, required this.tracks}) : super(key: key);

  final List<SpotifyPack.TrackSimple>? tracks;

  @override
  State<Recommendations> createState() => _RecommendationsState();
}

class _RecommendationsState extends State<Recommendations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      backgroundColor: splashOrange,
      body: ListView.builder(
        itemCount: widget.tracks?.length ?? 0,
        itemBuilder: (context, index) {
          final track = widget.tracks![index];
          return ListTile(
            title: Text(track.name ?? ''),
            subtitle: Text(
                track.artists?.map((artist) => artist.name).join(', ') ?? ''),
          );
        },
      ),
    );
  }
}
