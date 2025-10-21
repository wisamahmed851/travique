import 'package:get/get.dart';

class AuthRemoteDataSource {
  final _apiClient = GetConnect();

  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await _apiClient.post(
      'http://192.168.100.60:3000/user/login',
      {'email': email, 'password': password},
    );

    if (response.status.hasError) {
      throw Exception(response.statusText ?? "Login Failed");
    }
    if (response.body['success'] == false) {
      throw Exception(response.body['message'] ?? "Login Failed");
    }

    return response.body;
  }
}
