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
}
