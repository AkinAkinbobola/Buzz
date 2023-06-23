import 'dart:convert';

import 'package:acr_cloud_sdk/acr_cloud_sdk.dart';
import 'package:buzz/constant.dart';
import 'package:buzz/models/SpotifySongModel.dart' as SpotifyModel;
import 'package:buzz/models/artistsModel.dart' as ArtistModel;
import 'package:buzz/size_config.dart';
import 'package:buzz/spotify_client.dart';
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

  @override
  void initState() {
    super.initState();
    SizeConfig();
    songData = SpotifyModel.spotifySongModelFromJson(widget.songData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          elevation: 0),
      backgroundColor: splashOrange,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: getProportionateScreenHeight(400),
              width: getProportionateScreenWidth(400),
              decoration: BoxDecoration(
                color: darkOrange,
                borderRadius: BorderRadius.circular(200),
                border:
                    Border.all(width: 20, color: darkOrange.withOpacity(0.5)),
              ),
              child: ClipOval(
                child: Image.network(
                  songData.album?.images?[0].url ?? '',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(50),
            ),
            Text(
              "Song Recognized!",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            Text(
              "Song: ${songData.name}",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(4),
            ),
            SizedBox(
              width: getProportionateScreenWidth(280),
              child: Text(
                "Artist${songData.artists != null && songData.artists!.length > 1 ? 's' : ''}: ${songData.artists?.map((artist) => artist.name).join(', ')}",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(4),
            ),
            SizedBox(
              width: getProportionateScreenWidth(280),
              child: Text(
                "Track ${songData.trackNumber} on ${songData.album?.name}",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(4),
            ),
            SizedBox(
              child: Text(
                "Release Year: ${songData.album?.releaseDate?.substring(0, 4) ?? 'N/A'}",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(4),
            ),
            // SizedBox(
            //   child: Text(
            //     // "Genres: ${songData.album?.genres?.join(', ') ?? 'N/A'}",
            //     "Genres:",
            //     textAlign: TextAlign.center,
            //     style: GoogleFonts.poppins(
            //       fontSize: 14,
            //       fontWeight: FontWeight.w500,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
