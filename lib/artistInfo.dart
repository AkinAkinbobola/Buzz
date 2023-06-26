import 'package:buzz/constant.dart';
import 'package:flutter/material.dart';
import 'package:lastfm/lastfm.dart';
import 'package:xml/xml.dart';

class ArtistInfo extends StatefulWidget {
  const ArtistInfo({Key? key}) : super(key: key);

  @override
  State<ArtistInfo> createState() => _ArtistInfoState();
}

class _ArtistInfoState extends State<ArtistInfo> {
  late LastFM lastfm;
  String? content;
  String? summary;

  @override
  void initState() {
    super.initState();
    lastfm = LastFMUnauthorized(kApiKey, kSharedSecret);
    getArtistInfo();
  }

  Future<void> getArtistInfo() async {
    final XmlDocument document =
        await lastfm.read('artist.getInfo', {"artist": "Pink Floyd"});
    final XmlElement bioElement = document.findAllElements('bio').first;
    setState(() {
      content = bioElement.findElements('content').single.innerText;
      summary = bioElement.findElements('summary').single.innerText;
    });

    // Print the content and summary
    // print('Content: $content');
    print('Summary: $summary');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: splashOrange,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Text("$content"),
            Text("$summary"),
          ],
        ),
      ),
    );
  }
}
