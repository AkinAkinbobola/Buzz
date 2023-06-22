import 'package:buzz/constant.dart';
import 'package:buzz/models/SpotifySongModel.dart' as SpotifyModel;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DisplayResults extends StatefulWidget {
  const DisplayResults({super.key});

  @override
  State<DisplayResults> createState() => _DisplayResultsState();
}

class _DisplayResultsState extends State<DisplayResults> {
  var songData = SpotifyModel.spotifySongModelFromJson("""{
  "album": {
    "album_type": "album",
    "artists": [
      {
        "external_urls": {
          "spotify": "https://open.spotify.com/artist/5yPzzu25VzEk8qrGTLIrE1"
        },
        "href": "https://api.spotify.com/v1/artists/5yPzzu25VzEk8qrGTLIrE1",
        "id": "5yPzzu25VzEk8qrGTLIrE1",
        "name": "Young Nudy",
        "type": "artist",
        "uri": "spotify:artist:5yPzzu25VzEk8qrGTLIrE1"
      }
    ],
    "external_urls": {
      "spotify": "https://open.spotify.com/album/6PRXKEq952eaaJWMUGNx5t"
    },
    "href": "https://api.spotify.com/v1/albums/6PRXKEq952eaaJWMUGNx5t",
    "id": "6PRXKEq952eaaJWMUGNx5t",
    "images": [
      {
        "height": 640,
        "url": "https://i.scdn.co/image/ab67616d0000b27356bf918dc517050ebf113d22",
        "width": 640
      },
      {
        "height": 300,
        "url": "https://i.scdn.co/image/ab67616d00001e0256bf918dc517050ebf113d22",
        "width": 300
      },
      {
        "height": 64,
        "url": "https://i.scdn.co/image/ab67616d0000485156bf918dc517050ebf113d22",
        "width": 64
      }
    ],
    "name": "SlimeBall 2",
    "release_date": "2017-08-11",
    "release_date_precision": "day",
    "total_tracks": 13,
    "type": "album",
    "uri": "spotify:album:6PRXKEq952eaaJWMUGNx5t"
  },
  "artists": [
    {
      "external_urls": {
        "spotify": "https://open.spotify.com/artist/5yPzzu25VzEk8qrGTLIrE1"
      },
      "href": "https://api.spotify.com/v1/artists/5yPzzu25VzEk8qrGTLIrE1",
      "id": "5yPzzu25VzEk8qrGTLIrE1",
      "name": "Young Nudy",
      "type": "artist",
      "uri": "spotify:artist:5yPzzu25VzEk8qrGTLIrE1"
    },
    {
      "external_urls": {
        "spotify": "https://open.spotify.com/artist/1URnnhqYAYcrqrcwql10ft"
      },
      "href": "https://api.spotify.com/v1/artists/1URnnhqYAYcrqrcwql10ft",
      "id": "1URnnhqYAYcrqrcwql10ft",
      "name": "21 Savage",
      "type": "artist",
      "uri": "spotify:artist:1URnnhqYAYcrqrcwql10ft"
    }
  ],
  "disc_number": 1,
  "duration_ms": 227175,
  "explicit": true,
  "external_ids": {
    "isrc": "QZ5FA1751439"
  },
  "external_urls": {
    "spotify": "https://open.spotify.com/track/68MTDH8Kk4jBEV1ah0n89s"
  },
  "href": "https://api.spotify.com/v1/tracks/68MTDH8Kk4jBEV1ah0n89s",
  "id": "68MTDH8Kk4jBEV1ah0n89s",
  "is_local": false,
  "name": "EA (feat. 21 Savage)",
  "popularity": 80,
  "preview_url": "https://p.scdn.co/mp3-preview/30118c80b53ad81a70f353b1088b6e76ab12f2bd?cid=0b297fa8a249464ba34f5861d4140e58",
  "track_number": 4,
  "type": "track",
  "uri": "spotify:track:68MTDH8Kk4jBEV1ah0n89s"
}""");
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
            Text("${songData.album?.releaseDate}"),
          ],
        ),
      ),
    );
  }
}
