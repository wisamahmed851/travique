import 'package:get/get.dart';
import 'package:travique/features/auth/bindings/auth_binding.dart';
import 'package:travique/features/auth/presentation/pages/forget_password.dart';
import 'package:travique/features/auth/presentation/pages/intro_screen.dart';
import 'package:travique/features/auth/presentation/pages/new_password.dart';
import 'package:travique/features/auth/presentation/pages/otp_verifcation.dart';
import 'package:travique/features/city/bindings/city_binding.dart';
import 'package:travique/features/city/presentation/pages/city_detail_screen.dart';
import 'package:travique/features/splash/presentation/pages/splash_screen.dart';
import 'package:travique/features/auth/presentation/pages/login_screen.dart';
import 'package:travique/features/auth/presentation/pages/register_screen.dart';
import 'package:travique/features/home/bindings/home_binding.dart';
import 'package:travique/features/home/presentation/pages/home_screen.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(name: Routes.SPLASH, page: () => SplashScreen()),
    GetPage(
      name: Routes.INTRO,
      page: () => IntroScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.SIGNUP,
      page: () => RegisterScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.OTP_VERIFICATION,
      page: () {
        final args = Get.arguments as Map<String, dynamic>?;
        final bool isPasswordReset = args?['isPasswordReset'] ?? false;
        return OtpVerificationScreen(isPasswordReset: isPasswordReset);
      },
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.FORGOT_PASSWORD,
      page: () => ForgetPassword(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.NEW_PASSWORD,
      page: () => NewPassword(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.CITY_DETAILS,
      page: () => CityDetailScreen(),
      binding: CityBinding(),
    ),
  ];
}
