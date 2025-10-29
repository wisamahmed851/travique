import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:travique/features/auth/domain/usecases/login_usecase.dart';
import 'package:travique/routes/app_routes.dart';

class AuthController extends GetxController {
  final LoginUsecase loginUsecase;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  AuthController(this.loginUsecase);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var isLoading = false.obs;
  var isPasswordHidden = true.obs;

  Future<void> togglePasswordVisibility() async {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  Future<void> login() async {
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 2));
    isLoading.value = false;
    Get.snackbar("Success", "Login Successful");
    Get.offAllNamed(Routes.CITY_SELECTION);
    try {
      final response = await loginUsecase(
        emailController.text,
        passwordController.text,
      );
      print(response);
      if (response['data']['access_token'] != null) {
        Get.snackbar("Success", "Login Successful");
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.snackbar("Error", "Invalid Credentials");
      }
    } catch (e) {
      print("Error during login: ${e.toString()}");
      Get.snackbar("Login Failed", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // @override
  // void onClose() {
  //   emailController.dispose();
  //   passwordController.dispose();
  //   super.onClose();
  // }

  Future<void> googleSignIn() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        Get.snackbar("Cancelled", "Google sign in was cancelled");
        return;
      }
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final idToken = googleAuth.idToken;
      final accessToken = googleAuth.accessToken;

      print("🟢 Google Sign-In Successful!");
      print("ID Token: $idToken");
      print("Access Token: $accessToken");

      // You can also show it on the screen
      Get.snackbar("Google Token", idToken ?? "No token found");
    } catch (e) {
      print("❌ Google Sign-In Error: $e");
      Get.snackbar("Error", "Failed to sign in with Google");
    }
  }
}
