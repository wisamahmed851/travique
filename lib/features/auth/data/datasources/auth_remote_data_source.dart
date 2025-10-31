import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:travique/core/constants/api_constants.dart';
import 'package:travique/core/service/api_client.dart';

class AuthRemoteDataSource {
  final ApiClient _apiClient = ApiClient();

  Future<Map<String, dynamic>> login(String email, String password) async {
    print("staring and api with $email, password: $password");
    final response = await _apiClient.post(ApiConstants.loginEndpoint, {
      'email': email,
      'password': password,
    });
    debugPrint(response.body);
    if (response.status.hasError) {
      print("API Error: ${response.statusText}");
      print("Error Message: ${response.body['message']}");
      throw Exception(response.body['message'] ?? "Login Failed");
    }
    if (response.body['success'] == false) {
      print("Login Error: ${response.body['message']}");
      throw Exception(response.body['message'] ?? "Login Failed");
    }

    return response.body;
  }

  Future<Map<String, dynamic>> register(
    String name,
    String email,
    String password,
    String confirmPassword,
  ) async {
    final response = await _apiClient.post(ApiConstants.registerEndpoint, {
      'name': name,
      'email': email,
      'password': password,
      'confirm_password': confirmPassword,
    });
    print("Status: ${response.statusCode}");
    print("Raw body string: ${response.bodyString}");

    // Manual decoding in case GetConnect still fails
    final Map<String, dynamic> body =
        response.body ??
        (response.bodyString != null
            ? Map<String, dynamic>.from(jsonDecode(response.bodyString!))
            : {});

    print("Message: ${body['message']}");
    return body;

    // print("Raw string: ${response.bodyString}");

    // final Map<String, dynamic> decoded = json.decode(
    //   response.bodyString ?? '{}',
    // );

    // print("Decoded message: ${decoded['message']}");

    // // if (response.body == null) {
    // //   print("Null response body. Status: ${response.statusCode}");
    // //   throw Exception("No response from server");
    // // }
    // // if (response.status.hasError) {
    // //   print("Api error: ${response.statusCode}");
    // //   throw Exception(response.body['message'] ?? 'Login Failed');
    // // }
    // // ✅ Business logic failure
    // // if (response.body['success'] == false) {
    // //   print("API failure: ${response.body['message']}");
    // //   throw Exception(response.body['message'] ?? 'Registration failed');
    // // }
    // print("Body message ${response.body['message']}");
    // print("Body status ${response.body['success']}");
    // return response.body;
  }

  Future<Map<String, dynamic>> otpVerification(String email, String otp) async {
    final response = await _apiClient.post(
      ApiConstants.emailVerificationEndpoint,
      {'email': email, 'otp': otp},
    );

    debugPrint(response.body);

    if (response.status.hasError) {
      debugPrint("Api Error: ${response.statusText}");
      throw Exception(response.body['message'] ?? "Otp verification Failed");
    }
    if (response.body['success'] == false) {
      debugPrint('succes fasle: ${response.body['message']}');
      throw Exception('Success failed ${response.body['message']}');
    }
    return response.body;
  }
}
