import 'package:buzz/constant.dart';
import 'package:flutter/material.dart';
import 'package:lastfm/lastfm.dart';
import 'package:xml/xml.dart';

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  late LastFM lastfm;
  List<Artist> topArtists = [];
  List<Track> topTracks = [];
  List<Artist> topArtistsNigeria = [];
  List<Track> topTracksNigeria = [];
  bool isLoading = false;

  @override
  void initState() {
    lastfm = LastFMUnauthorized(kApiKey, kSharedSecret);
    getData();
    isLoading = true;
    super.initState();
  }

  Future<void> getData() async {
    final XmlDocument topArtistsXml =
        await lastfm.read('chart.getTopArtists', {});
    final XmlDocument topTracksXml =
        await lastfm.read("chart.getTopTracks", {});

    final topArtistsData = topArtistsXml.findAllElements('artist');
    topArtists = topArtistsData
        .map((element) => Artist.fromXml(element))
        .toList()
        .sublist(0, 10);

    final topTracksData = topTracksXml.findAllElements('track');
    topTracks = topTracksData
        .map((element) => Track.fromXml(element))
        .toList()
        .sublist(0, 10);

    final XmlDocument topArtistsNigeriaXml =
        await lastfm.read('geo.getTopArtists', {"country": "nigeria"});
    final XmlDocument topTracksNigeriaXml =
        await lastfm.read('geo.getTopTracks', {"country": "nigeria"});

    final topArtistsNigeriaData =
        topArtistsNigeriaXml.findAllElements('artist');
    topArtistsNigeria = topArtistsNigeriaData
        .map((element) => Artist.fromXml(element))
        .toList()
        .sublist(0, 10);

    final topTracksNigeriaData = topTracksNigeriaXml.findAllElements('track');
    topTracksNigeria = topTracksNigeriaData
        .map((element) => Track.fromXml(element))
        .toList()
        .sublist(0, 10);

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundCream,
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.white,
                semanticsLabel: "Looks like we found your song!",
              ),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Top Artists"),
                    SizedBox(
                      height: 150,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: topArtists.length,
                        itemBuilder: (context, index) {
                          final artist = topArtists[index];
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              children: [
                                Text(artist.name),
                                Text(artist.mbid),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Text("Top Tracks"),
                    SizedBox(
                      height: 150,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: topTracks.length,
                        itemBuilder: (context, index) {
                          final track = topTracks[index];
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              children: [
                                Text(track.name),
                                Text(track.mbid),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Text("Top Artists - Nigeria"),
                    SizedBox(
                      height: 150,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: topArtistsNigeria.length,
                        itemBuilder: (context, index) {
                          final artist = topArtistsNigeria[index];
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              children: [
                                Text(artist.name),
                                Text(artist.mbid),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

class Artist {
  final String name;
  final String mbid;

  Artist(this.name, this.mbid);

  factory Artist.fromXml(XmlElement element) {
    final name = element.findElements('name').first.innerText;
    final mbid = element.findElements('mbid').first.innerText;
    return Artist(name, mbid);
  }
}

class Track {
  final String name;
  final String mbid;

  Track(this.name, this.mbid);

  factory Track.fromXml(XmlElement element) {
    final name = element.findElements('name').first.innerText;
    final mbid = element.findElements('mbid').first.innerText;
    return Track(name, mbid);
  }
}
