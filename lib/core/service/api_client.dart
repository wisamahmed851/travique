import 'dart:convert';

import 'package:get/get_connect/connect.dart';
import 'package:travique/core/constants/api_constants.dart';

class ApiClient extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = ApiConstants.baseUrl;
    httpClient.defaultContentType = 'application/json';

    httpClient.addRequestModifier<dynamic>((request) {
      request.headers['Accept'] = 'application/json';
      request.headers['Content-Type'] = 'application/json';
      return request;
    });

    // ✅ Add this: ensures all responses are decoded as JSON automatically
    httpClient.addResponseModifier((request, response) {
      if (response.body == null && response.bodyString != null) {
        try {
          // Response.body is final; return a new Response with the decoded body
          final decoded = jsonDecode(response.bodyString!);
          return response.copyWith(body: decoded);
        } catch (e) {
          print("Response decode failed: $e");
          return response;
        }
      }
      return response;
    });

    httpClient.timeout = const Duration(seconds: 10);
    super.onInit();
  }
}
