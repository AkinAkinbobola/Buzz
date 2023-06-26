import 'package:buzz/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotify/spotify.dart' as SpotifyPack;

class Recommendations extends StatefulWidget {
  const Recommendations({Key? key, required this.tracks}) : super(key: key);

  final List<SpotifyPack.TrackSimple>? tracks;

  @override
  State<Recommendations> createState() => _RecommendationsState();
}

class _RecommendationsState extends State<Recommendations> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      backgroundColor: splashOrange,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {},
              child: Text("Save to Playlist"),
            ),
            Column(
              children: widget.tracks?.map((track) {
                    return ListTile(
                      title: Text(
                        track.name ?? '',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      subtitle: Text(
                        track.artists
                                ?.map((artist) => artist.name)
                                .join(', ') ??
                            '',
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  }).toList() ??
                  [],
            ),
          ],
        ),
      ),
    );
  }
}
