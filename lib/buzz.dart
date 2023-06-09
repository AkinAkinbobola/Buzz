// ignore_for_file: unused_import, depend_on_referenced_packages, avoid_print, use_build_context_synchronously, library_prefixes

import 'dart:convert';
import 'dart:io';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:buzz/constant.dart';
import 'package:buzz/display_results.dart';
import 'package:buzz/error.dart';
import 'package:buzz/models/SpotifyAccessTokenModel.dart';
import 'package:buzz/models/SpotifySongModel.dart' as SpotifyModel;
import 'package:buzz/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:acr_cloud_sdk/acr_cloud_sdk.dart';
import 'package:music_visualizer/music_visualizer.dart';
import 'package:http/http.dart' as http;

class Buzz extends StatefulWidget {
  const Buzz({Key? key}) : super(key: key);

  @override
  State<Buzz> createState() => _BuzzState();
}

class _BuzzState extends State<Buzz> {
  late AcrCloudSdk acrCloudSdk;
  bool onClick = false;
  final List<Color> colors = [
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
  ];
  List<String>? noID;

  final List<int> duration = [900, 700, 600, 800, 500];

  @override
  void initState() {
    super.initState();
    initializeAcrCloud();
  }

  void initializeAcrCloud() {
    acrCloudSdk = AcrCloudSdk();
    acrCloudSdk.init(
      host: kHost,
      accessKey: kAccessKey,
      accessSecret: kAccessSecret,
      setLog: true,
    );
    acrCloudSdk.songModelStream.listen(searchSong);
  }

  void searchSong(SongModel song) async {
    final spotifyId =
        song.metadata?.music?[0].externalMetadata?.spotify?.track?.id;
    if (spotifyId == null) {
      print("test");

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ErrorPage() ));
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DisplayResults(
                  songID: spotifyId,
                )),
      );
    }

    await acrCloudSdk.stop();

    setState(() {
      onClick = !onClick;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: splashOrange,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: getProportionateScreenHeight(100),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/buzz/microphone.png'),
              SizedBox(
                width: getProportionateScreenWidth(10),
              ),
              onClick == false
                  ? Text(
                      'Tap to Buzz',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                      ),
                    )
                  : Text(
                      'Buzzing...',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                      ),
                    ),
            ],
          ),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          AvatarGlow(
            endRadius: 200,
            animate: onClick,
            child: GestureDetector(
              onTap: startRecognition,
              child: Material(
                shape: const CircleBorder(),
                elevation: 8,
                child: SvgPicture.asset(
                  'assets/splash_screen/buzz_logo.svg',
                  height: getProportionateScreenHeight(210),
                  width: getProportionateScreenWidth(210),
                ),
              ),
            ),
          ),
          onClick == true
              ? SizedBox(
                  width: getProportionateScreenWidth(200),
                  height: getProportionateScreenHeight(60),
                )
              : const SizedBox(
                  height: 0,
                  width: 0,
                ),
          SizedBox(
            height: getProportionateScreenHeight(15),
          ),
          onClick == true
              ? Column(
                  children: [
                    Text(
                      'Listening for music',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      'Make sure your device can hear the song clearly',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                )
              : const SizedBox(
                  height: 0,
                  width: 0,
                ),
        ],
      ),
    );
  }

  void startRecognition() async {
    try {
      setState(() {
        onClick = !onClick;
      });
      await acrCloudSdk.start();
    } catch (e) {
      print(e.toString());
    }
  }

  void stopRecognition() async {
    try {
      setState(() {
        onClick = !onClick;
      });
      await acrCloudSdk.stop();
    } catch (e) {
      print(e.toString());
    }
  }
}
