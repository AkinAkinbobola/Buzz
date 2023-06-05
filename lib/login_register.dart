// ignore_for_file: library_private_types_in_public_api, unused_import, depend_on_referenced_packages

import 'package:buzz/constant.dart';
import 'package:buzz/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'form_button.dart';

class LoginRegisterScreen extends StatefulWidget {
  const LoginRegisterScreen({super.key});

  @override
  _LoginRegisterScreenState createState() => _LoginRegisterScreenState();
}

class _LoginRegisterScreenState extends State<LoginRegisterScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: backgroundCream,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: getProportionateScreenHeight(155),
          ),
          Padding(
            padding: EdgeInsets.only(left: getProportionateScreenWidth(56)),
            child: RichText(
              text: TextSpan(
                text: "Welcome To ",
                style: GoogleFonts.poppins(
                  color: black,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
                children: [
                  TextSpan(
                    text: "Buzz!",
                    style: GoogleFonts.poppins(
                      color: darkOrange,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(45)),
          TabBar(
            labelColor: black,
            controller: _tabController,
            indicatorColor: Colors.black,
            tabs: const [
              Tab(
                text: 'Log In',
              ),
              Tab(
                text: 'Register',
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                LoginForm(),
                RegisterForm(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(25)),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: getProportionateScreenHeight(18)),
            Text(
              "Log In to your account",
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(12)),
            Row(
              children: [
                Image.asset('assets/login_register/google.png'),
                SizedBox(width: getProportionateScreenWidth(24)),
                Image.asset('assets/login_register/apple.png'),
                SizedBox(width: getProportionateScreenWidth(24)),
                Image.asset('assets/login_register/microsoft.png'),
              ],
            ),
            SizedBox(height: getProportionateScreenHeight(48)),
            Text(
              'Or log in with your email',
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(10)),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(25)),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              obscureText: true,
            ),
            SizedBox(height: getProportionateScreenHeight(33)),
            const Text(
              'Forgot your password?',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 13,
                color: darkOrange,
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(48)),
            FormButton(
              text: "Log In",
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(25)),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: getProportionateScreenHeight(18)),
            Text(
              "Create an account",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(12)),
            Row(
              children: [
                Image.asset('assets/login_register/google.png'),
                SizedBox(width: getProportionateScreenWidth(24)),
                Image.asset('assets/login_register/apple.png'),
                SizedBox(width: getProportionateScreenWidth(24)),
                Image.asset('assets/login_register/microsoft.png'),
              ],
            ),
            SizedBox(height: getProportionateScreenHeight(48)),
            Text(
              'Or register with your email',
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF000000),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(10)),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(25)),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              obscureText: true,
            ),
            SizedBox(height: getProportionateScreenHeight(25)),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                labelStyle: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(48)),
            FormButton(
              text: "Register",
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}
