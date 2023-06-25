import 'package:buzz/constant.dart';
import 'package:buzz/recommendations.dart';
import 'package:buzz/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:spotify/spotify.dart' as SpotifyPack;

class DisplayResults extends StatefulWidget {
  const DisplayResults({Key? key, required this.songID}) : super(key: key);
  final String songID;

  @override
  State<DisplayResults> createState() => _DisplayResultsState();
}

class _DisplayResultsState extends State<DisplayResults> {
  final player = AudioPlayer();
  bool isLoading = false;
  bool isPlaying = false;
  bool isPreview = true;
  String? songName;
  String? albumName;
  String? year;
  int? trackNumber;
  String? albumType;
  List<SpotifyPack.Image>? pictures;
  List<String?>? artists;
  List<String>? genres;
  List<SpotifyPack.TrackSimple>? tracks;
  final List<String> defaultGenre = ['pop'];

  @override
  void initState() {
    super.initState();
    SizeConfig();
    setState(() {
      isLoading = true;
    });
    getSongDetails(widget.songID);
  }

  @override
  void dispose() {
    super.dispose();
    player.dispose();
  }

  Future<void> getSongDetails(String songID) async {
    final credentials =
        SpotifyPack.SpotifyApiCredentials(kClientId, kClientSecret);
    final spotify = SpotifyPack.SpotifyApi(credentials);
    final song = await spotify.tracks.get(songID);
    final artistID = song.album?.artists?[0].id;
    final artistsResponse = await spotify.artists.get(artistID!);
    if (song.previewUrl != null) {
      await player.setUrl(song.previewUrl!);
    } else {
      setState(() {
        isPreview = false;
      });
    }
    SpotifyPack.Recommendations recommendations =
        await spotify.recommendations.get(
      seedArtists: [artistID],
      seedTracks: [songID],
      seedGenres: artistsResponse.genres?.isNotEmpty == true
          ? [artistsResponse.genres![0]]
          : defaultGenre,
    );
    tracks = recommendations.tracks;

    setState(() {
      songName = song.name;
      albumName = song.album?.name;
      year = song.album?.releaseDate?.substring(0, 4);
      trackNumber = song.trackNumber;
      albumType = song.album?.albumType;
      pictures = song.album?.images;
      artists = song.artists?.map((artist) => artist.name).toList();
      genres = artistsResponse.genres ?? ['N/A'];
      isLoading = false;
    });
  }

  Future<void> togglePlay() async {
    if (isPlaying) {
      await player.pause();
    } else {
      await player.play();
    }
    setState(() {
      isPlaying = !isPlaying;
    });
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
      body: SizedBox(
        child: Center(
          child: isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    semanticsLabel: "Looks like we found your song!",
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: getProportionateScreenHeight(300),
                      width: getProportionateScreenWidth(300),
                      decoration: BoxDecoration(
                        color: darkOrange,
                        borderRadius: BorderRadius.circular(150),
                        border: Border.all(
                            width: 20, color: darkOrange.withOpacity(0.5)),
                      ),
                      child: ClipOval(
                        child: Image.network(
                          pictures?[0].url ?? '',
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
                      "Song: $songName",
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
                        "${(artists?.length ?? 0) > 1 ? 'Artists' : 'Artist'}: ${artists?.join(', ')}",
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
                        "Track $trackNumber on $albumName",
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
                        "Release Year: $year",
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
                        "Genres: ${genres?.join(', ') ?? 'N/A'}",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    isPreview
                        ? Column(
                            children: [
                              ElevatedButton(
                                onPressed: togglePlay,
                                child: Text(isPlaying ? "Pause" : "Play"),
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  await player.stop();
                                  setState(() {
                                    isPlaying = false;
                                  });
                                },
                                child: Text("Stop"),
                              ),
                            ],
                          )
                        : SizedBox(),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Recommendations(
                              tracks: tracks,
                            ),
                          ),
                        );
                      },
                      child: Text("View Recommendations"),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
