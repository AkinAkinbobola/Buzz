// ignore_for_file: unused_import

import 'dart:convert';
import 'package:buzz/models/RegisterModel.dart';
import 'package:http/http.dart' as http;

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

      return registerModel;
    } catch (e) {
      rethrow;
    }
  }
}
