// ignore_for_file: depend_on_referenced_packages

import 'package:buzz/buzz.dart';
import 'package:buzz/constant.dart';
import 'package:buzz/size_config.dart';
import 'package:buzz/upload.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int selectedIndex = 1;

  final List<Widget> _pages = [
    // const HomePage(),
    const Buzz(),
    const Upload(),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: backgroundCream,
      body: _pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        items: <BottomNavigationBarItem>[
          // BottomNavigationBarItem(
          //   icon: SvgPicture.asset("assets/navbar_icons/for_you.svg"),
          //   activeIcon:
          //       SvgPicture.asset("assets/navbar_icons/for_you_active.svg"),
          //   label: 'For You',
          // ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/navbar_icons/buzz_icon.svg"),
            label: 'Buzz',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.upload_file_outlined,
            ),
            label: 'Upload',
          ),
        ],
        backgroundColor: navbarWhite,
        selectedLabelStyle: GoogleFonts.poppins(
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
        unselectedLabelStyle: GoogleFonts.poppins(
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
        selectedItemColor: darkOrange,
        unselectedItemColor: black,
        iconSize: 30,
        currentIndex: selectedIndex,
        onTap: onItemTapped,
      ),
    );
  }
}
