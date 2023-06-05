import 'package:buzz/constant.dart';
import 'package:buzz/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      backgroundColor: backgroundCream,
      body: Column(
        children: [
          SizedBox(
            height: getProportionateScreenHeight(185),
          ),
          RichText(
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
          Text('Enter 6-digit verification code sent to email@gmail.com'),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'OTP',
              labelStyle: TextStyle(color: darkOrange),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: darkOrange),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: darkOrange),
              ),
            ),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(11)
            ],
            keyboardType: TextInputType.number,
          ),
          RichText(
            text: const TextSpan(
              text: "Didn't receive a verification code? ",
              style: TextStyle(
                color: black,
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
              children: [
                TextSpan(
                  text: "Send again",
                  style: TextStyle(
                    color: darkOrange,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}

