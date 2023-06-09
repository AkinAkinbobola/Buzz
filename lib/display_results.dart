import 'package:buzz/artistInfo.dart';
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
  String? songArtist;
  final List<String> defaultGenre = ['pop'];
  SpotifyPack.Pages<SpotifyPack.Album>? albums;

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

    // For artists
    //albums = await spotify.artists.albums(artistID);
    //final topTracks = await spotify.artists.getTopTracks(artistID, "NG");
    //final relatedArtists = await spotify.artists.relatedArtists(artistID);

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
      songArtist = song.album!.artists![0].name;
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
      body: SingleChildScrollView(
        child: SizedBox(
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
                          borderRadius: BorderRadius.circular(150),
                          border: Border.all(
                              width: 20, color: darkOrange.withOpacity(0.5)),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  pictures![0].url!,
                                )),
                            borderRadius: BorderRadius.circular(150),
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
                      ),
                      Wrap(
                        alignment: WrapAlignment.center,
                        children: List.generate(
                          artists!.length + 1,
                          (index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  right: getProportionateScreenWidth(4)),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ArtistInfo(
                                        artistName: songArtist!,
                                      ),
                                    ),
                                  );
                                },
                                child: index == 0
                                    ? Text(
                                        "${(artists?.length ?? 0) > 1 ? 'Artists' : 'Artist'}:",
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          decoration:
                                              TextDecoration.underline,
                                          color: Colors.blue,
                                        ),
                                      )
                                    : Text(
                                        artists![index - 1]!,
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          decoration:
                                              TextDecoration.underline,
                                          color: Colors.blue,
                                        ),
                                      ),
                              ),
                            );
                          },
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
                                  child: const Text("Stop"),
                                ),
                              ],
                            )
                          : const SizedBox(),
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
                        child: const Text("View Recommendations"),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
