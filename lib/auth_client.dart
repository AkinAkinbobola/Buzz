// ignore_for_file: unused_import

import 'dart:convert';
import 'package:buzz/models/LoginModel.dart';
import 'package:buzz/models/RegisterModel.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:dio/dio.dart';

abstract class AuthClient {
  static Future<RegisterModel> registerUser(
      Map<String, dynamic>? userData) async {
    try {
      final response = await http.post(
        Uri.parse('http://10.0.2.2:8000/api/register/'),
        body: userData,
      );

      final registerModel = registerModelFromJson(response.body);
      saveTokenLocally(registerModel.token);
      return registerModel;
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> loginUser(Map<String, dynamic>? userData) async {
    var token = getTokenLocally();
    print(token);
    // return LoginModel.fromJson('');
  }

  static Future<void> saveTokenLocally(String? token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token!);
  }

  static Future<String?> getTokenLocally() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }
}
