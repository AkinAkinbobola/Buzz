// ignore_for_file: depend_on_referenced_packages

import 'package:buzz/onboarding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: SvgPicture.asset(
                'assets/splash_screen/Logo.svg',
                width: 150,
                height: 150,
              ),
            ),
            const SizedBox(
              height: 300,
            ),
            Text(
              'Buzz',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w900,
                fontSize: 40,
              ),
            )

          ],
        ),
      ),
    );
  }
}
