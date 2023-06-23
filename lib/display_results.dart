import 'package:buzz/constant.dart';
import 'package:buzz/models/SpotifySongModel.dart' as SpotifyModel;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DisplayResults extends StatefulWidget {
  const DisplayResults({Key? key, required this.songData}) : super(key: key);
  final String songData;

  @override
  State<DisplayResults> createState() => _DisplayResultsState();
}

class _DisplayResultsState extends State<DisplayResults> {
  late SpotifyModel.SpotifySongModel songData;
  late DateFormat dateFormat;

  @override
  void initState() {
    super.initState();
    songData = SpotifyModel.spotifySongModelFromJson(widget.songData);
    dateFormat = DateFormat("yyyy");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: splashOrange,
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              songData.album?.images?[0].url ?? '',
              height: 250,
              width: 250,
              fit: BoxFit.cover,
            ),
            Text(
              "Song Recognized!",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              "Artists: ${songData.artists?.map((artist) => artist.name).join(', ')}",
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "Song: ${songData.name}",
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "Track ${songData.trackNumber} on ${songData.album?.name}",
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
