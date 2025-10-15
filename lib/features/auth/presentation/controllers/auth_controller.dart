import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travique/routes/app_routes.dart';

class AuthController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() {
    // For now just simulate login
    if (emailController.text == "admin" && passwordController.text == "1234") {
      Get.offAllNamed(Routes.HOME);
    } else {
      Get.snackbar("Login Failed", "Invalid credentials");
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
