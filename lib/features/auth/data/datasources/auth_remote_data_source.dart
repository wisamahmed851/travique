import 'package:get/get.dart';
import 'package:travique/core/constants/api_constants.dart';

class AuthRemoteDataSource {
  final _apiClient = GetConnect();

  Future<Map<String, dynamic>> login(String email, String password) async {
    print("staring and api with $email, password: $password");
    final response = await _apiClient.post(ApiConstants.loginEndpoint, {
      'email': email,
      'password': password,
    });
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
    if (response.status.hasError) {
      print("Api error: ${response.statusCode}");
      print("Api message: ${response.body['message']}");
      throw Exception(response.body['message'] ?? 'Login Failed');
    }
    if (response.body['success'] == false) {
      print("Login Error: ${response.body['message']}");
      throw Exception(response.body['message'] ?? "Login Failed");
    }
    return response.body;
  }
}
