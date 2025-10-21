import 'package:get/get.dart';

class AuthRemoteDataSource {
  final _apiClient = GetConnect();

  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await _apiClient.post(
      'http://192.168.43.63:3000/user/login',
      {'email': email, 'password': password},
    );
    print(response);
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
}
