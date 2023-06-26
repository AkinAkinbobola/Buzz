import 'package:buzz/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lastfm/lastfm.dart';
import 'package:spotify/spotify.dart';
import 'package:xml/xml.dart';

class ArtistInfo extends StatefulWidget {
  final String artistName;

  const ArtistInfo({Key? key, required this.artistName}) : super(key: key);

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
        await lastfm.read('artist.getInfo', {"artist": widget.artistName});
    final XmlElement bioElement = document.findAllElements('bio').first;
    setState(() {
      content = bioElement.findElements('content').single.innerText;
      summary = bioElement.findElements('summary').single.innerText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: splashOrange,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Artist Information",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 16),
            if (content != null)
              Text(
                "Biography:",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            if (content != null)
              Text(
                content!,
                style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.w500),
              ),
          ],
        ),
      ),
    );
  }
}
