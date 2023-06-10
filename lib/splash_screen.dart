// ignore_for_file: depend_on_referenced_packages, unused_import

import 'package:buzz/constant.dart';
import 'package:buzz/onboarding.dart';
import 'package:buzz/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 4)).then((value) {
      Navigator.of(context).pushReplacement(
          CupertinoPageRoute(builder: (ctx) => const OnboardingScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: splashOrange,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: getProportionateScreenHeight(154),
            ),
            SvgPicture.asset(
              'assets/splash_screen/buzz_logo.svg',
              height: getProportionateScreenHeight(210),
              width: getProportionateScreenHeight(210),
            ),
            SizedBox(
              height: getProportionateScreenHeight(106),
            ),
            SvgPicture.asset('assets/splash_screen/buzz_text.svg')
          ],
        ),
      ),
    );
  }
}
