import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:travique/core/constants/api_constants.dart';

class HomeRemoteDataSource {
  Future<Map<String, dynamic>> getHomeData() async {
    final url = Uri.parse(ApiConstants.popularCities);

    try {
      final response = await http.get(url);
      debugPrint(" Home Page data ${response.toString()}");

      final Map<String, dynamic> responseData = jsonDecode(response.body);
      return responseData;
    } catch (e) {
      debugPrint("❌ Home Pgae data error: $e");
      return {
        "success": false,
        "message": "Unable to connect to server",
        "data": {},
      };
    }
  }
}
