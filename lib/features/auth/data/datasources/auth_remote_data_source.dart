import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:travique/core/constants/api_constants.dart';
import 'package:http/http.dart' as http;
import 'package:travique/core/service/storage_service.dart';

class AuthRemoteDataSource {
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

  Future<Map<String, dynamic>> otpVerification(
    String email,
    String otp,
    bool isPasswordReset,
  ) async {
    if (isPasswordReset) {
      final url = Uri.parse(ApiConstants.resetPasswordotpEndpoint);
      final body = jsonEncode({'email': email.trim(), 'otp': otp.trim()});
      debugPrint("Paylod of the password reset : ${body.toString()}");
      try {
        debugPrint("email body: ${body.toString()}");
        final response = await http.post(
          url,
          headers: {'Content-Type': 'application/json'},
          body: body,
        );

        debugPrint("📡 Reset otp verification => ${response.statusCode}");
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
    } else {
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

  Future<Map<String, dynamic>> forgotPassword(String email) async {
    var url = Uri.parse(ApiConstants.forgotPasswordEndpoint);
    var body = jsonEncode({'email': email});
    debugPrint("Body of the paylod: ${body.toString()}");
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: body,
      );

      debugPrint("Forgot password api: ${response.statusCode}");
      debugPrint("Response: $response");

      final Map<String, dynamic> responseData = jsonDecode(response.body);

      return responseData;
    } catch (e) {
      debugPrint("Error in the remot: ${e.toString()}");
      throw Exception(e.toString());
    }
  }

  Future<Map<String, dynamic>> resetPassword(
    String email,
    String new_password,
  ) async {
    var url = Uri.parse(ApiConstants.resetPasswordEndpoint);
    var body = jsonEncode({'email': email, 'new_password': new_password});
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: body,
      );
      debugPrint("response in the api: ${response.toString()}");

      final Map<String, dynamic> responseData = jsonDecode(response.body);

      return responseData;
    } catch (e) {
      debugPrint("Error in the api: ${e.toString()}");
      throw Exception(e.toString());
    }
  }

  Future<Map<String, dynamic>> logout(String token) async {
    var url = Uri.parse(ApiConstants.logoutEndpoint);
    var body = jsonEncode({});
    var token = StorageService.getToken();
    if (token != null) {
      try {
        final response = await http.post(
          url,
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: body,
        );

        debugPrint("Response of the logout: ${response.toString()}");

        final Map<String, dynamic> responseData = jsonDecode(response.body);

        return responseData;
      } catch (e) {
        throw Exception("Error in the api fetching: ${e.toString()}");
      }
    }
    return {};
  }
}
