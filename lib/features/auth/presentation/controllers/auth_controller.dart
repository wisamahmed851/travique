import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travique/features/auth/domain/usecases/login_usecase.dart';
import 'package:travique/routes/app_routes.dart';

class AuthController extends GetxController {
  final LoginUsecase loginUsecase;
  AuthController(this.loginUsecase);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var isLoading = false.obs;

  Future<void> login() async {
    isLoading.value = true;

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
      print(e);
      Get.snackbar("Login Failed", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
