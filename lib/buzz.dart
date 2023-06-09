// ignore_for_file: unused_import, depend_on_referenced_packages

import 'dart:convert';
import 'dart:io';

import 'package:buzz/constant.dart';
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

  final List<int> duration = [900, 700, 600, 800, 500];

  @override
  void initState() {
    super.initState();
    initializeAcrCloud();
  }

  void initializeAcrCloud() {
    acrCloudSdk = AcrCloudSdk();
    acrCloudSdk.init(
      host: 'identify-us-west-2.acrcloud.com',
      accessKey: 'dccaf0c06d15eb512eab05a5f9f5420a',
      accessSecret: 'cEXwp8kHkjROtLkKWAmDYmJMJgARP9FCylZMOFy4',
      setLog: true,
    );
    acrCloudSdk.songModelStream.listen(searchSong);
  }

  void searchSong(SongModel song) async {
    // Handle the recognized song
    print(song);
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
                child: Container(
                  padding: const EdgeInsets.all(40),
                  height: getProportionateScreenHeight(210),
                  width: getProportionateScreenWidth(210),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: darkOrange,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: SvgPicture.asset(
                      'assets/splash_screen/Logo.svg',
                      height: getProportionateScreenHeight(150),
                      width: getProportionateScreenWidth(150),
                    ),
                  ),
                ),
              ),
            ),
          ),
          onClick == true
              ? SizedBox(
                  width: getProportionateScreenWidth(200),
                  height: getProportionateScreenHeight(60),
                  // child: MusicVisualizer(
                  //   colors: colors,
                  //   duration: duration,
                  //   barCount: 15,
                  // ),
                )
              : const SizedBox(
                  height: 0,
                  width: 0,
                ),
          SizedBox(
            height: getProportionateScreenHeight(15),
          ),
          if (onClick == true)
            Column(
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
                )
              ],
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
      print('recording');
      // Recognition started successfully
    } catch (e) {
      print(e.toString());
      // Handle error
    }
  }

  void stopRecognition() async {
    try {
      print('recording\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n');

      setState(() {
        onClick = !onClick;
      });
      await acrCloudSdk.stop();
      // Recognition started successfully
    } catch (e) {
      print(e.toString());
      // Handle error
    }
  }
}
