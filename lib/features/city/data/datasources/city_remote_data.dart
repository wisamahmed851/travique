import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:travique/core/constants/api_constants.dart';
import 'package:http/http.dart' as http;

class CityRemoteData {
  Future<Map<String, dynamic>> cityDetail(int id) async {
    debugPrint("Everything is fine before fetching fetching the api");
    final url = Uri.parse('${ApiConstants.cityDetail}/$id');

    try {
      final response = await http.get(url);

      debugPrint('api response ${response.toString()}');

      final Map<String, dynamic> responseData = jsonDecode(response.body);

      return responseData;
    } catch (e) {
      debugPrint("api error $e");
      return {
        "success": false,
        "message": "Unable to connect to server",
        "data": {},
      };
    }
  }
}
