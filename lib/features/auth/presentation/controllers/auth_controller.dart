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
  final loginemailController = TextEditingController();
  final loginpasswordController = TextEditingController();
  final verificationemailController = TextEditingController(); 
  final verificationotpController = TextEditingController(); 
  var isLoading = false.obs;
  var isPasswordHidden = true.obs;

  Future<void> togglePasswordVisibility() async {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  Future<void> login() async {
    isLoading.value = true;

    try {
      final response = await loginUsecase(
        loginemailController.text,
        loginpasswordController.text,
      );

      debugPrint("Login response: $response");

      final bool success = response['success'] ?? false;
      final String message = response['message'] ?? '';
      final data = response['data'] ?? {};

      if (success) {
        if (data['access_token'] != null) {
          await StorageService.saveToken(data['access_token']);
          Get.snackbar("Success", "Login Successful");
          Get.offAllNamed(Routes.MAIN_LAYOUT);
        } else if (message.contains("Account not verified")) {
          Get.snackbar("Info", message);
          var email = data['email'] ?? loginemailController.text; 
          debugPrint("email thats going to the otp: $email");
          Get.offAllNamed(
            Routes.OTP_VERIFICATION,
            arguments: {
              'isPasswordReset': false,
              'email': email,
            },
          );
        }
      } else {
        Get.snackbar("Error", message.isNotEmpty ? message : "Login failed");
      }
    } catch (e) {
      debugPrint("Error during login: ${e.toString()}");
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

      debugPrint("Register response: $response");

      final bool success = response['success'] ?? false;
      final String message = response['message'] ?? '';
      final data = response['data'] ?? {};

      if (success) {
        // ✅ Registration successful → Go to OTP verification
        Get.snackbar(
          "Success",
          message.isNotEmpty
              ? message
              : "Registration successful. Please verify your email.",
        );
        Get.toNamed(
          Routes.OTP_VERIFICATION,
          arguments: {'isPasswordReset': true, 'email': emailController.text},
        );
      } else {
        // ❌ Validation or other backend error
        Get.snackbar(
          "Error",
          message.isNotEmpty ? message : "Registration failed",
        );
      }
    } catch (e) {
      debugPrint("Error during register: ${e.toString()}");
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> otpVerification(String otp) async {
    isLoading.value = true;

    try {
      final result = await verificationUsecase(verificationemailController.text, otp);
      debugPrint("🔍 OTP Verification Result: $result");

      final bool success = result['success'] ?? false;
      final String message = result['message'] ?? '';
      final data = result['data'] ?? {};

      if (success) {
        final user = data['user'];
        final token = data['access_token'];

        // ✅ Save the token for authenticated API calls
        await StorageService.saveToken(token);

        // (Optional) save user info if needed
        // await StorageService.saveUser(user);

        Get.snackbar(
          "Success",
          message.isNotEmpty ? message : "Account verified successfully",
        );
        Get.offAllNamed(Routes.MAIN_LAYOUT); // replace navigation stack
      } else {
        Get.snackbar(
          "Error",
          message.isNotEmpty ? message : "OTP verification failed",
        );
      }
    } catch (e) {
      debugPrint("❌ Error during OTP verification: ${e.toString()}");
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
