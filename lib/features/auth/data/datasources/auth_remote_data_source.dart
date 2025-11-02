import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travique/core/constants/api_constants.dart';
import 'package:travique/core/service/api_client.dart';
import 'package:http/http.dart' as http;

class AuthRemoteDataSource {
  final ApiClient _apiClient = ApiClient();
  final _apiClients = GetConnect();

  Future<Map<String, dynamic>> login(String email, String password) async {
    final url = Uri.parse(ApiConstants.loginEndpoint);
    final body = jsonEncode({
      'email': email.trim(),
      'password': password.trim(),
    });

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: body,
      );

      debugPrint("📡 Login API called: ${response.statusCode}");
      debugPrint("Response body: ${response.body}");

      // decode safely
      final Map<String, dynamic> decoded = jsonDecode(response.body);

      // Your backend always returns { success, message, data }
      return decoded;
    } catch (e) {
      debugPrint("❌ Login API Error: $e");
      return {
        "success": false,
        "message": "Unable to connect to server",
        "data": {},
      };
    }
  }

  Future<Map<String, dynamic>> register(
    String name,
    String email,
    String password,
    String confirmPassword,
  ) async {
    final url = Uri.parse(ApiConstants.registerEndpoint);
    final body = jsonEncode({
      'name': name.trim(),
      'email': email.trim(),
      'password': password,
      'confirm_password': confirmPassword,
    });

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: body,
      );

      debugPrint("📡 Register API called: ${response.statusCode}");
      debugPrint("Response body: ${response.body}");

      final Map<String, dynamic> decoded = jsonDecode(response.body);
      return decoded;
    } catch (e) {
      debugPrint("❌ Register API Error: $e");
      return {
        "success": false,
        "message": "Unable to connect to server",
        "data": {},
      };
    }
  }

  Future<Map<String, dynamic>> otpVerification(String email, String otp) async {
    final url = Uri.parse(ApiConstants.emailVerificationEndpoint);
    final body = jsonEncode({'email': email.trim(), 'otp': otp.trim()});

    try {
      debugPrint("email body: ${body.toString()}");
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: body,
      );

      debugPrint("📡 OTP Verification API => ${response.statusCode}");
      debugPrint("Response => ${response.body}");

      final Map<String, dynamic> decoded = jsonDecode(response.body);

      // Always return consistent structure
      return decoded;
    } catch (e) {
      debugPrint("❌ OTP Verification Error: $e");
      return {
        "success": false,
        "message": "Unable to connect to server",
        "data": {},
      };
    }
  }


}
