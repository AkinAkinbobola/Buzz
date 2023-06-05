// ignore_for_file: unused_import, depend_on_referenced_packages

import 'package:buzz/constant.dart';
import 'package:buzz/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';

class Buzz extends StatefulWidget {
  const Buzz({super.key});

  @override
  State<Buzz> createState() => _BuzzState();
}

class _BuzzState extends State<Buzz> {
  @override
  void initState() {
    super.initState();
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
            height: getProportionateScreenHeight(171),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/buzz/microphone.png'),
              SizedBox(
                width: getProportionateScreenWidth(10),
              ),
              Text(
                'Tap to Buzz',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w800, fontSize: 18),
              ),
            ],
          ),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          AvatarGlow(
            endRadius: 200,
            animate: true,
            child: GestureDetector(
              onTap: (){},
              child: Material(
                shape: CircleBorder(),
                elevation: 8,
                child: Container(
                  padding: EdgeInsets.all(40),
                  height: getProportionateScreenHeight(210),
                  width: getProportionateScreenWidth(210),
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: darkOrange),
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
          )
        ],
      ),
    );
  }
}
