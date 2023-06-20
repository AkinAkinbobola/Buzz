// ignore_for_file: unused_import

import 'dart:convert';
import 'dart:io';

import 'package:buzz/constant.dart';
import 'package:buzz/landing.dart';
import 'package:buzz/onboarding.dart';
import 'package:buzz/login_register.dart';
import 'package:buzz/otp.dart';
import 'package:buzz/recording.dart';
import 'package:buzz/splash_screen.dart';
import 'package:flutter/material.dart';

import 'buzz.dart';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide.none,
          ),
          floatingLabelStyle: const TextStyle(
            color: darkOrange,
          ),
        ),
      ),
      home: const LoginRegisterScreen(),
    );
  }
}


