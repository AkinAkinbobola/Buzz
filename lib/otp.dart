// ignore_for_file: camel_case_types

import 'package:buzz/constant.dart';
import 'package:buzz/size_config.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OTP extends StatefulWidget {
  const OTP({super.key});

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      backgroundColor: backgroundCream,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: getProportionateScreenHeight(185),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: getProportionateScreenWidth(60),
            ),
            child: RichText(
              text: const TextSpan(
                text: "Welcome To ",
                style: TextStyle(
                  color: black,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
                children: [
                  TextSpan(
                    text: "Buzz!",
                    style: TextStyle(
                      color: darkOrange,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(40),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: getProportionateScreenWidth(35),
            ),
            child: SizedBox(
              width: getProportionateScreenWidth(270),
              child: const Text(
                  'Enter 6-digit verification code sent to email@gmail.com'),
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          const Center(child: OTP_input()),
          SizedBox(
            height: getProportionateScreenHeight(50),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: getProportionateScreenWidth(45),
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const OTP()),
                );
              },
              child: RichText(
                text: const TextSpan(
                  text: "Didn't receive a verification code? ",
                  style: TextStyle(
                    color: black,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    TextSpan(
                      text: "Send again",
                      style: TextStyle(
                        color: darkOrange,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(40)),
        ],
      ),
    );
  }
}

class OTP_input extends StatelessWidget {
  const OTP_input({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: 6,
      defaultPinTheme: PinTheme(
        width: getProportionateScreenWidth(40),
        height: getProportionateScreenHeight(40),
        textStyle: const TextStyle(fontSize: 20),
        margin:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(5)),
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border(
            bottom: BorderSide(
              color: Colors.black.withOpacity(0.5),
              width: 1.0,
            ),
          ),
        ),
      ),
    );
  }
}
