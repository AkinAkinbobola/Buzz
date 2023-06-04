import 'package:buzz/constant.dart';
import 'package:buzz/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'form_button.dart';

class LoginRegisterScreen extends StatefulWidget {
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
            height: getProportionateScreenHeight(185),
          ),
          Padding(
            padding: EdgeInsets.only(left: getProportionateScreenWidth(56)),
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
          SizedBox(height: getProportionateScreenHeight(45)),
          TabBar(
            labelColor: black,
            controller: _tabController,
            tabs: [
              const Tab(
                text: 'Log In',
              ),
              const Tab(
                text: 'Register',
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
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
            const Text(
              "Log In to your account",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
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
            const Text(
              'Or log in with your email',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(10)),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(25)),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Password',
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
            const Text(
              "Log In to your account",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
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
            SizedBox(height: getProportionateScreenHeight(30)),
            const Text(
              'Or register with your email',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(10)),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(25)),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: getProportionateScreenHeight(25)),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Confirm Password',
              ),
              obscureText: true,
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
