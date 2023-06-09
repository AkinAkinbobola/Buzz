// ignore_for_file: depend_on_referenced_packages

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
    return Scaffold(
      backgroundColor: const Color(0xFFFF725E),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(
              height: 154,
            ),
            SvgPicture.asset(
              'assets/splash_screen/buzz_logo.svg',
              height: 210,
              width: 210,
            ),
            const SizedBox(
              height: 106,
            ),
            SvgPicture.asset('assets/splash_screen/buzz_text.svg')
          ],
        ),
      ),
    );
  }
}
