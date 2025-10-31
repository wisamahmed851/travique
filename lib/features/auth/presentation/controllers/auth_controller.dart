import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travique/core/service/storage_service.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'package:travique/features/auth/domain/usecases/login_usecase.dart';
import 'package:travique/features/auth/domain/usecases/register_usecase.dart';
import 'package:travique/features/auth/domain/usecases/verification_usecase.dart';
import 'package:travique/routes/app_routes.dart';

class AuthController extends GetxController {
  final LoginUsecase loginUsecase;
  final RegisterUsecase registerUsecase;
  final VerificationUsecase verificationUsecase;
  // final GoogleSignIn _googleSignIn = GoogleSignIn();
  AuthController(
    this.loginUsecase,
    this.registerUsecase,
    this.verificationUsecase,
  );
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final otpController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  var isLoading = false.obs;
  var isPasswordHidden = true.obs;

  Future<void> togglePasswordVisibility() async {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  Future<void> login() async {
    // isLoading.value = true;
    // await Future.delayed(Duration(seconds: 2));
    // isLoading.value = false;
    // Get.snackbar("Success", "Login Successful");
    // Get.offAllNamed(Routes.CITY_SELECTION);
    try {
      final response = await loginUsecase(
        emailController.text,
        passwordController.text,
      );
      print(response);
      if (response['data']['access_token'] != null) {
        await StorageService.saveToken(response['data']['access_token']);
        Get.snackbar("Success", "Login Successful");
        Get.offAllNamed(Routes.MAIN_LAYOUT);
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

  /* Future<void> googleSignIn() async {
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
  } */

  Future<void> register() async {
    isLoading.value = true;
    try {
      final response = await registerUsecase(
        nameController.text,
        emailController.text,
        passwordController.text,
        confirmPasswordController.text,
      );
      print(response);
      if (response['success'] = true) {
        Get.toNamed(
          Routes.OTP_VERIFICATION,
          arguments: {'isPasswordReset': true},
        );
        Get.snackbar('success', response['message']);
      }
      if (response['success'] == false) {
        Get.snackbar("Error", response['message']);
      }
      // return null;
    } catch (e) {
      print("Error: ${e.toString()}");
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> otpVerification(String otp) async {
    isLoading.value = true;
    try {
      final result = await verificationUsecase(emailController.text, otp);
      print(result);
      if (result['success'] == true) {
        Get.snackbar("success", result['message']);
        Get.toNamed(Routes.MAIN_LAYOUT);
      }
      if (result['success'] == false) {
        Get.snackbar("Error", result['message']);
      }
    } catch (e) {
      debugPrint("Error: ${e.toString()}");
      Get.snackbar("Error", e.toString());
    }
  }
}
