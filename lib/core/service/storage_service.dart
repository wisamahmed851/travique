import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static late SharedPreferences _perfs;

  static Future<void> init() async {
    _perfs = await SharedPreferences.getInstance();
  }

  static Future<void> saveToken(String token) async {
    await _perfs.setString('token', token);
    print("token has been set: $token");
  }

  static String? getToken() {
    return _perfs.getString('token');
  }

  static Future<bool> clearToken() async {
    return _perfs.remove('token');
  }

  static bool isLoggedIn() {
    return _perfs.getString("token") != null;
  }

  static Future<void> saveUserInfo(
    int id,
    String name,
    String email,
    String image,
  ) async {
    await _perfs.setInt('user_id', id);
    await _perfs.setString('user_name', name);
    await _perfs.setString('user_email', email);
    await _perfs.setString('user_image', image);
  }

  static int? getUserId() => _perfs.getInt('user_id');
  static String? getUserName() => _perfs.getString('user_name');
  static String? getUserEmail() => _perfs.getString('user_email');
  static String? getUserImage() => _perfs.getString('user_image');
}
